touch /usr/local/envvar.txt
touch /usr/local/envvar2.txt
printenv > /usr/local/envvar.txt
echo $http_proxy > /usr/local/envvar2.txt

curl https://www.bing.com/ --output /usr/local/bing18.html
curl -v https://vstsagentpackage.azureedge.net/agent/2.190.0/vsts-agent-linux-x64-2.190.0.tar.gz --output /usr/local/18.tar.gz
curl https://raw.githubusercontent.com/Coco-Kong/coco/master/testDownloadAgent.py --output /usr/local/test18.py
python3 /usr/local/test18.py

