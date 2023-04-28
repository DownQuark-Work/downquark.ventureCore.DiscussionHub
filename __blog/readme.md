Federated:

WriteFreely

https://writefreely.org/createdwith
https://writefreely.org/features/community-building

> INSTALL: https://discuss.write.as/t/install-writefreely-with-apache-and-mysql/665

https://discuss.write.as/t/problems-with-federation-url-and-other-urls/7164/2

https://www.digitalocean.com/community/tutorials/how-to-use-apache-as-a-reverse-proxy-with-mod_proxy-on-ubuntu-16-04#example-1-%E2%80%94-reverse-proxying-a-single-backend-server


https://access.redhat.com/documentation/en-us/jboss_enterprise_application_platform/6/html/administration_and_configuration_guide/install_the_mod_proxy_http_connector_into_apache_httpd



as `[ec2-user@ip-172-31-1-196 blog]`:
```
alias qrxRestart='sudo systemctl restart writefreely'
alias qrxStart='sudo systemctl start writefreely'
alias qrxStop='sudo systemctl stop writefreely'
alias logQrx='sudo journalctl -f -u writefreely' # tail service logs
```