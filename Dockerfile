FROM wso2/wso2am:3.2.0

COPY instruqt-entrypoint.sh /home/wso2carbon/instruqt-entrypoint.sh

ENTRYPOINT [ "/home/wso2carbon/instruqt-entrypoint.sh" ]