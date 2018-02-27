FROM airhacks/wildfly
LABEL maintainer="Pablo Bastidas, pablobastidasv@gmail.com"
ENV KEYCLOAK_ADAPTER_VERSION "3.4.3.Final"
ENV KEYCLOAK_ADAPTER_DIR ${INSTALL_DIR}/adapter-${KEYCLOAK_ADAPTER_VERSION}
ENV KEYCLOAK_ADAPTER_URL https://downloads.jboss.org/keycloak/${KEYCLOAK_ADAPTER_VERSION}/adapters/keycloak-oidc/keycloak-wildfly-adapter-dist-${KEYCLOAK_ADAPTER_VERSION}.zip
USER root
RUN curl -O ${KEYCLOAK_ADAPTER_URL} \
    && unzip keycloak-wildfly-adapter-dist-${KEYCLOAK_ADAPTER_VERSION}.zip -d ${KEYCLOAK_ADAPTER_DIR} \
    && rm keycloak-wildfly-adapter-dist-${KEYCLOAK_ADAPTER_VERSION}.zip \
    && mv ${KEYCLOAK_ADAPTER_DIR}/modules/system/add-ons ${WILDFLY_HOME}/modules/system/ \
    && ${WILDFLY_HOME}/bin/jboss-cli.sh --file=${KEYCLOAK_ADAPTER_DIR}/bin/adapter-elytron-install-offline.cli \
    && rm -rf ${KEYCLOAK_ADAPTER_DIR} \
    && rm -rf ${WILDFLY_HOME}/standalone/configuration/standalone_xml_history/current \
    && chown -R serveradmin:serveradmin ${INSTALL_DIR} \
    && chmod -R a+rw ${INSTALL_DIR}
USER serveradmin