#!/usr/bin/env bash

HOST=$1
getJSONValueByKey () {
  python3.6 -c "import sys, json; print(json.load(sys.stdin)['$1'])"
}

VERSION=$(curl $HOST:8081/apiv1/version -sw " %{http_code}")
STATUS_CODE=${VERSION:${#VERSION}-3}
DATA=$(echo ${VERSION::${#VERSION}-3} | getJSONValueByKey version)

if [[ $STATUS_CODE -ne 200 ]] ; then
	echo "Error: $VERSION"
	read
	exit 
else
	echo "Passed: $VERSION"
	VERSION=$DATA
fi

TOKEN=$(curl -X CREATE $HOST:8081/apiv1/tokens -F "email=god@example.com" \
	-F "password=123456"  -sw " %{http_code}")
STATUS_CODE=${TOKEN:${#TOKEN}-3}
DATA=$(echo ${TOKEN::${#TOKEN}-3} | getJSONValueByKey token)

if [[ $STATUS_CODE -ne 200 ]] ; then
	echo "Error: $TOKEN"
	read
	exit
else
	echo "Passed: $TOKEN"
	TOKEN=$DATA
fi

AUTHORIZATION_CODE=$(curl -X CREATE \
"$HOST:8081/apiv1/authorizationcodes?applicationId=1&scopes=title&\
state=123456&redirectUri=http://example2.com/oauth2" \
-H "authorization:$DATA" -sw " %{http_code}")
STATUS_CODE=${AUTHORIZATION_CODE:${#AUTHORIZATION_CODE}-3}
DATA=$(echo ${AUTHORIZATION_CODE::${#AUTHORIZATION_CODE}-3} |
	getJSONValueByKey authorizationCode)

if [[ $STATUS_CODE -ne 200 ]] ; then
	echo "Error: $AUTHORIZATION_CODE"
	read
	exit
else
	echo "Passed: $AUTHORIZATION_CODE"
	AUTHORIZATION_CODE=$DATA
fi

SECRET=$(curl -X GET "$HOST:8081/apiv1/applications/1" \
	-H "authorization: $TOKEN" -sw " %{http_code}")
STATUS_CODE=${SECRET:${#SECRET}-3}
DATA=$(echo ${SECRET::${#SECRET}-3} | getJSONValueByKey secret)

if [[ $STATUS_CODE -ne 200 ]] ; then
	echo "Error: $SECRET"
	read
	exit
else
	echo "Passed: $SECRET"
	SECRET=$DATA
fi

ACCESS_TOKEN=$(curl -X CREATE -sw " %{http_code}" \
"$HOST:8081/apiv1/accesstokens" -F "code=$AUTHORIZATION_CODE" \
  -F "secret=$SECRET" -F "applicationId=1" )
STATUS_CODE=${ACCESS_TOKEN:${#ACCESS_TOKEN}-3}
DATA=$(echo ${ACCESS_TOKEN::${#ACCESS_TOKEN}-3} | getJSONValueByKey accessToken)

if [[ $STATUS_CODE -ne 200 ]] ; then
	echo "Error: $ACCESS_TOKEN"
	read
	exit
else
	echo "Passed: $ACCESS_TOKEN"
	ACCESS_TOKEN=$DATA
fi

MEMBER=$(curl -X GET "$HOST:8081/apiv1/members/me" \
  -H "authorization: oauth2-accesstoken $ACCESS_TOKEN" -sw  " %{http_code}")
STATUS_CODE=${MEMBER:${#MEMBER}-3}
DATA=$(echo ${MEMBER::${#MEMBER}-3} | getJSONValueByKey title)

if [[ $STATUS_CODE -ne 200 ]] ; then
	echo "Error: $MEMBER"
	read
	exit
else
	echo "Passed: $MEMBER"
fi

echo; echo "--- DONE ---"
