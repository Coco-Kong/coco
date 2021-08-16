import os  
import urllib.request  

url='https://vstsagentpackage.azureedge.net/agent/2.190.0/vsts-agent-linux-x64-2.190.0.tar.gz'  
dir=os.path.abspath('.')  
work_path=os.path.join(dir,'test.tar.gz')  
urllib.request.urlretrieve(url,work_path) 