curl -v https://vstsagentpackage.azureedge.net/agent/2.190.0/vsts-agent-linux-x64-2.190.0.tar.gz --output /usr/local/agent2021.tar.gz
cd /usr/local/
mkdir myagent
cd myagent
gzip -d < /usr/local/agent2021.tar.gz | tar xvf -
mkdir work
cd /usr/local/myagent/
./config.sh --unattended --agent vmssagentspoolWESTUS_20 --url https://dev.azure.com/yuekon/ --auth PAT --token 4uai5jdo6yowdz5ir5y32g7sxec56qau4z2hgsgzrt4nxcrmgkqq --pool win10 --work /usr/local/work --replace --acceptTeeEula & wait $!
./run.sh "$@"