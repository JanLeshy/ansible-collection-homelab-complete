#!/bin/bash
if [[ ! -e .venv ]]; then
    python3 -m venv .ansible-home-lab-env
else
    echo "env already exists" 1>&2
fi

source .ansible-home-lab-env/bin/activate
python -m pip install --upgrade pip 
pip install -r requirements.txt

echo "Ansible Python environment is ready"

echo "Installing Ansible Collection"
ansible-galaxy collection install -r requirements.yml 

echo "Installing Ansible Roles"
ansible-galaxy install -r requirements.yml 