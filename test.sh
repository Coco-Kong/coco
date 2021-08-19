# Prepars a linux vm in a scale set with proxy configuration to enable Azure DevOps agent
# David Watson, 2021. Based on sript from Mark Muir & Brodie Hicks, 2020.

#General proxy config - different programs use upper or lower case, so we set both.
#Note the /etc/profile.d/*.sh files are executed for every user.

echo "Setting Proxy..."
echo "#!/bin/bash
export HTTP_PROXY=\"http://proxy.education.tas.gov.au:8081\"
export http_proxy=\"http://proxy.education.tas.gov.au:8081\"
export HTTPS_PROXY=\"http://proxy.education.tas.gov.au:8081\"
export https_proxy=\"http://proxy.education.tas.gov.au:8081\"
export VSTS_AGENT_INPUT_PROXYURL=\"http://proxy.education.tas.gov.au:8081\"
export VSTS_AGENT_INPUT_PROXYUSERNAME=\"\"
export VSTS_AGENT_INPUT_PROXYPASSWORD=\"\"
" > /etc/profile.d/1-prepare-adoagent.sh
chmod +x /etc/profile.d/1-prepare-adoagent.sh

source /etc/profile.d/1-prepare-adoagent.sh # Load into the current shell
export HTTP_PROXY="http://proxy.education.tas.gov.au:8081"
export http_proxy="http://proxy.education.tas.gov.au:8081"
export HTTPS_PROXY="http://proxy.education.tas.gov.au:8081"
export https_proxy="http://proxy.education.tas.gov.au:8081"
export VSTS_AGENT_INPUT_PROXYURL="http://proxy.education.tas.gov.au:8081"
export VSTS_AGENT_INPUT_PROXYUSERNAME=""
export VSTS_AGENT_INPUT_PROXYPASSWORD=""

echo 'Defaults env_keep += "http_proxy HTTP_PROXY https_proxy HTTPS_PROXY VSTS_AGENT_INPUT_PROXYURL VSTS_AGENT_INPUT_PROXYUSERNAME VSTS_AGENT_INPUT_PROXYPASSWORD"' | sudo -i tee -a /etc/sudoers.d/1-ado-agentpool

# Set Wget proxy
echo "
HTTP_PROXY = http://proxy.education.tas.gov.au:8081
http_proxy = http://proxy.education.tas.gov.au:8081
HTTPS_PROXY = http://proxy.education.tas.gov.au:8081
https_proxy = http://proxy.education.tas.gov.au:8081
" > /etc/wgetrc

# Update Search Domains / DNS if not found
grep -qw "search education.tas.gov.au" /etc/resolv.conf || { echo "Setting Search Domains ..." && echo search education.tas.gov.au | sudo -i tee -a /etc/resolv.conf; }

# curl https://www.bing.com/ --output /usr/local/bing01.html
# curl -v https://vstsagentpackage.azureedge.net/agent/2.190.0/vsts-agent-linux-x64-2.190.0.tar.gz --output /usr/local/agent01.tar.gz
