#!/usr/bin/env bash
set -e

APK_URL=$1
CALLBACK_URL=$2

curl -m 20 -s $APK_URL -o /tmp/android_app.apk

STATUS=$?
python ./androguard_manifest.py /tmp/android_app.apk | \
  curl -m 5 -s -XPOST $CALLBACK_URL -H "Content-Type: text/xml" --data-binary @-

