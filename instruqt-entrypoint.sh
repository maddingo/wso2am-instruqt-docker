#!/bin/bash

APIM_HOST="wso2am-9443-${INSTRUQT_PARTICIPANT_ID}.env.play.instruqt.com"

echo "HOSTNAME: ${APIM_HOST}"

sed -i 's#hostname = "localhost"#hostname = "${APIM_HOST}"#' ${WSO2_SERVER_HOME}/repository/conf/deployment.toml

/home/wso2carbon/docker-entrypoint.sh