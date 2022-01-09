andrewrothstein.terraform_switcher
=========
![Build Status](https://github.com/andrewrothstein/ansible-terraform_switcher/actions/workflows/build.yml/badge.svg)


Installs [terraform_switcher](https://warrensbox.github.io/terraform-switcher/).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.terraform_switcher
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
