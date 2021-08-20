#echo '
## DOE Proxy Configuration
#HttpProxy.Host=proxy.education.tas.gov.au
#HttpProxy.Port=8081
#' | sudo -i tee -a /etc/waagent.conf

touch /usr/local/envvar22.txt
printenv > /usr/local/envvar22.txt
id >> /usr/local/envvar22.txt

