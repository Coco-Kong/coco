echo '
# DOE Proxy Configuration
HttpProxy.Host=proxy.education.tas.gov.au
HttpProxy.Port=8081
' | sudo -i tee -a /etc/waagent.conf
