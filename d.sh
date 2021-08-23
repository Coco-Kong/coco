#curl -v https://vstsagentpackage.azureedge.net/agent/2.190.0/vsts-agent-linux-x64-2.190.0.tar.gz --output /home/coco/agent2021.tar.gz
#cd /home/coco/
#mkdir myagent
#cd myagent
#gzip -d < /home/coco/agent2021.tar.gz | tar xvf -
#mkdir _work
#cd /home/coco/myagent/_work
#./config.sh --unattended --agent vmssagentspoolWESTUS_20 --url https://dev.azure.com/yuekon/ --auth PAT --token xxx --pool win10 --work /home/coco/myagent/_work --replace --acceptTeeEula & wait $!
#./run.sh "$@"
