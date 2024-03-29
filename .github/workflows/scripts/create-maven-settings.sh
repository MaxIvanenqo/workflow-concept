#!/bin/bash

REPOSITORY_URL=$1
SERVER_ID=$2
SERVER_USERNAME=$3
SERVER_PASSWORD=$4

SETTINGS_XML=$(cat << EOF
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                        http://maven.apache.org/xsd/settings-1.0.0.xsd">
  <profiles>
    <profile>
      <id>snapshot</id>
      <repositories>
        <repository>
          <id>snapshot</id>
          <url>${REPOSITORY_URL}</url>
          <releases>
            <enabled>false</enabled>
          </releases>
          <snapshots>
            <enabled>true</enabled>
            <updatePolicy>always</updatePolicy>
          </snapshots>
        </repository>
      </repositories>
    </profile>
    <profile>
      <id>release</id>
      <repositories>
        <repository>
          <id>release</id>
          <url>${REPOSITORY_URL}</url>
          <releases>
            <enabled>true</enabled>
            <updatePolicy>always</updatePolicy>
          </releases>
          <snapshots>
            <enabled>false</enabled>
          </snapshots>
        </repository>
      </repositories>
    </profile>
  </profiles>
</settings>
EOF
)

echo "$SETTINGS_XML" > /home/runner/.m2/settings.xml
