ansible-mackerel-agent
======================

Install `mackerel-agent`.

[![Circle CI](https://circleci.com/gh/konomae/ansible-mackerel-agent.svg?style=svg)](https://circleci.com/gh/konomae/ansible-mackerel-agent)


How To Install
--------------

```bash
$ ansible-galaxy install konomae.mackerel-agent
```

or

```bash
$ ansible-galaxy install https://github.com/konomae/ansible-mackerel-agent
```


Role Variables
--------------

    mackerel_agent_apikey: "YOUR_API_KEY"



Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: konomae.mackerel-agent, mackerel_agent_apikey: "YOUR_API_KEY" }


Tests
-----

```bash
$ docker pull ansible/centos7-ansible:stable
$ export MACKEREL_APIKEY="YOUR_API_KEY"
$ ./tests.sh --rm
```


License
-------

MIT
