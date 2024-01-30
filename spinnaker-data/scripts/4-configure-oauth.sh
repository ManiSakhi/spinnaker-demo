#!/bin/bash

# env flags that need to be set:
CLIENT_ID=12e5f0e5c52f56f7b115
CLIENT_SECRET=cad0456f933e5be23e004cb2cc0f8611ab9538c3
PROVIDER=github
REDIRECT_URI=http://3.82.231.0:9000
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

hal config security ui edit \
    --override-base-url http://${MY_IP}:9000


hal config security api edit \
    --override-base-url http://${MY_IP}:8084

