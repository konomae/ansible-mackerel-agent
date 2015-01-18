#!/bin/bash

PLAYBOOK=/data/tests/playbook.yml
EXTRA_VARS="mackerel_agent_apikey=$MACKEREL_APIKEY"


# Tests
ansible-playbook $PLAYBOOK --syntax-check
ansible-playbook -c local -e $EXTRA_VARS $PLAYBOOK

# Cleanup
HOSTID=$(cat /var/lib/mackerel-agent/id)
curl -H "X-Api-Key: $MACKEREL_APIKEY" \
	 -H "Content-Type: application/json" \
	 -X POST -d "{}" "https://mackerel.io/api/v0/hosts/$HOSTID/retire"

# Tests
ansible-playbook -c local -e $EXTRA_VARS $PLAYBOOK | \
	grep -q 'changed=0\s*unreachable=0\s*failed=0' && exit 0 || exit 1
