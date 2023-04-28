# 🚨 ARCHIVED 🚨
> This was created while I was still researching what direction to head.
I'm not outright deleting it because there is still some valuable informatino contained.
As well as configs / confs / etc which could be good reference material.

But there will be no more updates.


# DownQuark Discussion Hub Base Instance
---
## UPDATE: This repo is going to be obliterated soon.
I'm going to handle this stuff in a different way and will nix this when complete. 

---
> Use at your own risk

This is intended to be used as a singular instance for _DownQuark_.
There will be cusom code which will most likely cause breaking changes if depolyed outside of its cuurrent environment.
Nothing is preventing anyone from cloning/forking/etc, but s upport for any issues that arise will be non-existent.

---
## Running Docker Compose
Docker Desktop cannot be used to launch this due to the use of `${PWD}1 in _docker-compose.yml_.
To use the **Command Line**:
  - first run: `% cd <THIS_DIRECTORY> && docker compose up -d`
  - subsequent: `% cd <THIS_DIRECTORY> && docker compose start`


## After Docker Compose:
### There is an issue with running the entrypoint script that causes an infinite loop
- pretty sure it has to do with the `restart: auto` but need to dig into it
> TODO: why does the below get into an infinite loop?
A workaround is to log into the container and run the script as the root user:
- `% docker exec -it --user root apache-php /bin/bash`
  - then:
- `root:var/www/html sh /var/run/dq-init.sh`

If you can connect to your database without a port, and the user has a password enabled you should be ready to use the manager.
Otherwise, read the `No Password or Port Required` section below before continuing to the `Create Instance` instructions.

## Create Instance
> first you will need to ensure there is a database that is accessible `dq_discussion_hub` \(on port 3313) for this example,
Using the **Manager**.
1. Log back in as root:
  - `% docker exec -it --user root apache-php /bin/bash` 
1. Only on the first run will you need to do:
  - `root:var/www/html php manager/tiki-manager.php manager:info`
1. Create the instance:
  - `root:var/www/html php manager/tiki-manager.php create:instance`
  - follow the terminal prompts
1. Navigate to your instance when instructed:
  - `http://dq.local:1003/qore`
  - provide the information requested
1. Complete!

---

## No Password or Port Required
You can _hack_ around the issue by updating 2 files:
```
--- a/hub/manager/src/Command/Traits/InstanceConfigure.php
+++ b/hub/manager/src/Command/Traits/InstanceConfigure.php
@@ -514,6 +514,7 @@ trait InstanceConfigure
                     }
 
                     $dbname = "{$prefix}_db";
+                    throw new DatabaseErrorException($dbname, '13');
                     if ($dbRoot->databaseExists($dbname)) {
                         $this->logger->warning("Database '$dbname' already exists.");
                         if (!$this->io->confirm('Continue?')) {
@@ -529,7 +530,8 @@ trait InstanceConfigure
         $config = [
             'host' => $dbRoot->host,
             'user' => $dbRoot->user,
-            'pass' => $dbRoot->pass,
+            // 'pass' => $dbRoot->pass,
+            'port' => '3313',
             'database' => $dbRoot->dbname ?: null,
             'prefix' => isset($dbPrefix) ? $dbPrefix : null
         ];
```
and
```
--- a/hub/manager/src/Libs/Database/Database.php
+++ b/hub/manager/src/Libs/Database/Database.php
@@ -116,9 +116,10 @@ class Database
         $config = self::getInstanceDataBaseConfig($db_local_path);
 
         $db = new self($instance);
-        $db->host = $config['host'];
-        $db->user = $config['user'];
-        $db->pass = $config['pass'];
-        $db->host = $config['host'];
-        $db->user = $config['user'];
-        $db->pass = $config['pass'];
+        $db->host = 'mariadb'; //$config['host'];
+        $db->user = 'mlnck'; //$config['user'];
+        $db->port = '3313'; //$config['user'];
+        // $db->pass = $config['pass'];
         $db->dbname = $config['dbname'];
         $db->type = $config['type'];
 
@@ -250,10 +251,11 @@ class Database
 
     public function query($sql)
     {
-        $args = array(
-            '-u', $this->user,
-            '-p'. escapeshellarg($this->pass),
-            '-h', $this->host,
+        $args = array( // mysql -h mariadb -u mlnck --port 3313
+            '-u', 'mlnck', //$this->user,
+            // '-p'. escapeshellarg($this->pass),
+            '-h', 'mariadb', // $this->host,
+            '--port', '3313',
             '-N',
             '-s'
         );
```
### Initial database content
I've included an initial dump of the database when it is first fully configured befoere any other adjustments.
I'm not sure if this will help skip some of the setup or not, but including it to play around with and leverage what parts we can.
Find it `/_dq/dump-dq_discussion_hub-202301140914.sql`

https://phpdocker.io/ <- kinda cool