#!/bin/bash
JAVA_VERSION=11
JAVA_DISTRIBUTION="zulu"
MAVEN_GROUP_ID="com.example.project"
MAVEN_OPTS="-DgenerateBackupPoms=false -Dsurefire.skipTests=false"
MAVEN_RESOLVE_RANGES_OPTS="-DallowMajorUpdates=false -DallowMinorUpdates=false -DallowIncrementalUpdates=true -DallowSnapshots=false -DgenerateBackupPoms=false"

MAVEN_PROFILE_NAME=$1
SERVER_USERNAME=$2
SERVER_PASSWORD=$3

echo "ENVIRONMENT=$(if ${{ github.event.pull_request.merged == true && MAVEN_PROFILE_NAME == "snapshot" }}; then echo 'int'; else echo 'dev'; fi)" >> $GITHUB_ENV

echo "JAVA_VERSION=$JAVA_VERSION" >> $GITHUB_ENV
echo "JAVA_DISTRIBUTION=$JAVA_DISTRIBUTION" >> $GITHUB_ENV
echo "MAVEN_GROUP_ID=$MAVEN_GROUP_ID" >> $GITHUB_ENV
echo "MAVEN_OPTS=$MAVEN_OPTS" >> $GITHUB_ENV
echo "MAVEN_SET_VERSION_OPTS=$MAVEN_SET_VERSION_OPTS" >> $GITHUB_ENV
echo "MAVEN_PROFILE_NAME=$MAVEN_PROFILE_NAME" >> $GITHUB_ENV

