echo
echo
echo "================================================================================"
echo "Installing Azure CLI"
echo "================================================================================"
if ! command -v az &> /dev/null
then
    echo "az could not be found"
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
else
    sudo apt-get update && sudo apt-get install --only-upgrade -y azure-cli
fi
echo
echo "================================================================================"
echo "Installing Python 3.6 and Pip3"
echo "================================================================================"
sudo apt update
sudo apt install python3.6
sudo apt install -y python3-pip
sudo apt install -y python3-setuptools
echo
echo "================================================================================"
echo "Installing Ansible"
echo "================================================================================"
sudo apt install -y software-properties-common libssl-dev libffi-dev 
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible
echo
echo
echo "================================================================================"
echo "Installing Pip Packages (Ansible, Linters, OpenCensus, etc.)"
echo "================================================================================"
pip3 install "wheel==0.30.0"
python setup.py bdist_wheel 
sudo pip3 install -r requirements.txt
echo
echo
echo "================================================================================"
echo "Using Ansible to perform remaining configuration"
echo "================================================================================"
ansible-galaxy install -r requirements.yml
sudo ansible-playbook ubuntu_setup.yml -vvv
