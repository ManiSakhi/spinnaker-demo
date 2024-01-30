#!/bin/bash

# env flags that need to be set:
CLIENT_ID=35c67667cfa03a3e68ab
CLIENT_SECRET=4730b721b4328ae5dacea4cc4d128e6fa374b04a
PROVIDER=github
REDIRECT_URI=http://3.89.138.255:9000
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

