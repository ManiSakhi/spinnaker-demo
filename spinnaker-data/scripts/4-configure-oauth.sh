#!/bin/bash

# env flags that need to be set:
CLIENT_ID=93ae7696433a31f6c2a2
CLIENT_SECRET=29e4c57025fa873685c81d7c17b830c80bfb0fa3
PROVIDER=github
REDIRECT_URI=http://54.88.91.13:9000
set -e

if [ -z "${CLIENT_ID}" ] ; then
  echo "CLIENT_ID not set"
  exit
fi
if [ -z "${CLIENT_SECRET}" ] ; then
  echo "CLIENT_SECRET not set"
  exit
fi
if [ -z "${PROVIDER}" ] ; then
  echo "PROVIDER not set"
  exit
fi
fi
if [ -z "${REDIRECT_URI}" ] ; then
 echo "REDIRECT_URI not set"
  exit
fi


MY_IP=`curl -s ifconfig.co`

hal config security authn oauth2 edit \
  --client-id $CLIENT_ID \
  --client-secret $CLIENT_SECRET \
  --provider $PROVIDER
hal config security authn oauth2 enable

hal config security authn oauth2 edit --pre-established-redirect-uri $REDIRECT_URI


