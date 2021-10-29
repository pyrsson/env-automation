# Ansible setup for working env

- python >= 3.6
- pip >= 4.5

## first run

install.sh sets up a secret file with your sudo password for use by ansible later, and installs pip and ansible

```bash
sudo ./install.sh
ansible-vault encrypt secrets.yml
```
