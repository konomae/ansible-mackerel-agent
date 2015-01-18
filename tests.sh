#!/bin/bash
docker run -it -e "MACKEREL_APIKEY=$MACKEREL_APIKEY" -h ansible-mackerel-agent -v $(pwd):/data --rm ansible/centos7-ansible:stable /bin/bash /data/tests/run.sh