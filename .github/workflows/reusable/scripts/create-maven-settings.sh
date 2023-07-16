#!/bin/bash
SETTINGS_XML=$(cat << EOF
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                        http://maven.apache.org/xsd/settings-1.0.0.xsd">
  <activeProfiles><activeProfile>${PROFILE}</activeProfile></activeProfiles>
  <profiles>
    <profile>
      <id>${PROFILE}</id>
      <repositories>
        <repository>
          <id>${REPOSITORY_ID}</id>
          <url>${REPOSITORY_URL}</url>
          <releases>
            <enabled>${REPOSITORY_RELEASES_ENABLED}</enabled>
            <updatePolicy>always</updatePolicy>
          </releases>
          <snapshots>
            <enabled>${REPOSITORY_SNAPSHOTS_ENABLED}</enabled>
            <updatePolicy>always</updatePolicy>
          </snapshots>
        </repository>
      </repositories>
    </profile>
  </profiles>
  <servers>
    <server>
      <id>${SERVER_ID}</id>
      <username>${SERVER_USERNAME}</username>
      <password>${SERVER_PASSWORD}</password>
    </server>
  </servers>
</settings>
EOF
)

echo "$SETTINGS_XML" > /home/runner/.m2/settings.xml