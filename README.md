# Ansible setup for working env

Install ansible via pip

```bash
cp secrets-template.yml secrets.yml
# edit it to use the secrets you need, then optionally encypt it
vi secrets.yml
ansible-vault encrypt secrets.yml
```
