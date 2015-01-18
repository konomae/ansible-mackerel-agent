#!/bin/bash

PLAYBOOK=/data/tests/playbook.yml
EXTRA_VARS="mackerel_agent_apikey=$MACKEREL_APIKEY"

ansible-playbook $PLAYBOOK --syntax-check
ansible-playbook -c local -e $EXTRA_VARS $PLAYBOOK
ansible-playbook -c local -e $EXTRA_VARS $PLAYBOOK | \
	grep -q 'changed=0\s*unreachable=0\s*failed=0' && exit 0 || exit 1