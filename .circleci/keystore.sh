#!/bin/bash

echo $ANDROID_KEYSTORE | base64 -di | tee android/keystore.jks >/dev/null

echo storePassword=$STORE_PASSWORD >> android/key.properties
echo keyPassword=$KEY_PASSWORD >> android/key.properties
echo keyAlias=key >> android/key.properties
echo storeFile=android/keystore.jks >> android/key.properties