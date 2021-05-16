#!/bin/bash

APIM_HOST="wso2am-9443-${INSTRUQT_PARTICIPANT_ID}.env.play.instruqt.com"

echo "HOSTNAME: ${APIM_HOST}" >the_host_name

sed -i "s#hostname = \"localhost\"#hostname = \"${APIM_HOST}\"#" ${WSO2_SERVER_HOME}/repository/conf/deployment.toml
sed -i -E "s#^base_path = .+#base_path = \"https://${APIM_HOST}\"#"  ${WSO2_SERVER_HOME}/repository/conf/deployment.toml

cat >> ${WSO2_SERVER_HOME}/repository/conf/deployment.toml <<EOF

## Added by instruqt-entrypoint.sh
[apim.idp]
server_url = "https://${APIM_HOST}"
authorize_endpoint = "https://${APIM_HOST}/oauth2/authorize"
oidc_logout_endpoint = "https://${APIM_HOST}/oidc/logout"
oidc_check_session_endpoint = "https://${APIM_HOST}/oidc/checksession"
EOF

/home/wso2carbon/docker-entrypoint.sh
