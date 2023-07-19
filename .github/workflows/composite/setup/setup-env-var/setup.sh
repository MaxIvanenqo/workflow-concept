#!/bin/bash
JAVA_VERSION=11
JAVA_DISTRIBUTION="zulu"
MAVEN_GROUP_ID="com.example.project"
MAVEN_OPTS="-DgenerateBackupPoms=false -Dsurefire.skipTests=false"
MAVEN_RESOLVE_RANGES_OPTS="-DallowMajorUpdates=false -DallowMinorUpdates=false -DallowIncrementalUpdates=true -DallowSnapshots=false -DgenerateBackupPoms=false"
MAVEN_SET_VERSION_OPTS="-DremoveSnapshot=true -DprocessParent=true -DprocessAllModules=true -DprocessDependencies=true -DprocessPlugins=false -DgenerateBackupPoms=false -DgroupId=$MAVEN_GROUP_ID"

MAVEN_PROFILE_NAME=$1
SERVER_USERNAME=$2
SERVER_PASSWORD=$3

echo "::set-output name=JAVA_VERSION::$JAVA_VERSION"
echo "::set-output name=JAVA_DISTRIBUTION::$JAVA_DISTRIBUTION"
echo "::set-output name=MAVEN_GROUP_ID::$MAVEN_GROUP_ID"
echo "::set-output name=MAVEN_OPTS::$MAVEN_OPTS"
echo "::set-output name=MAVEN_RESOLVE_RANGES_OPTS::$MAVEN_RESOLVE_RANGES_OPTS"
echo "::set-output name=MAVEN_SET_VERSION_OPTS::$MAVEN_SET_VERSION_OPTS"
echo "::set-output name=MAVEN_PROFILE_NAME::$MAVEN_PROFILE_NAME"
