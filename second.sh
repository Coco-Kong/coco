printenv $http_proxy > /usr/local/envvar.txt
echo $http_proxy > /usr/local/envvar2.txt

curl https://www.bing.com/ --output /usr/local/bing0818.html
curl -v https://vstsagentpackage.azureedge.net/agent/2.190.0/vsts-agent-linux-x64-2.190.0.tar.gz --output /usr/local/0818.tar.gz