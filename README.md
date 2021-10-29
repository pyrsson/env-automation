# Ansible setup for working env

- python >= 3.6
- pip >= 4.5

```bash
cp secrets-template.yml secrets.yml
# edit it to use the secrets you need, then optionally encypt it
vi secrets.yml
ansible-vault encrypt secrets.yml
```
