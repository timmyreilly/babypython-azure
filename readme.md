This is miminum code required for an Azure Flask project deployment. 

Check out my [blog post](http://timmyreilly.azurewebsites.net/starter-site-for-flask-on-azure-web-apps/) if you have any other questions. 


# To run locally. 

Application: 
```
pip install python3
pip install -r requirements.txt

python run.py --debug=False --port=5000
```

Integration Tests:
*Application must be running* 
Currently takes 5 minutes to install, and the basics test takes less than a minute. 
```
cd setup/
chmod +x ubuntu_host_setup.sh
ansible-playbook ./test/ansible/basics.yml -vv --extra-vars '{"host":"localhost", "port":"5000"}'
```






