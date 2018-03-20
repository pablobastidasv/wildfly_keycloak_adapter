FROM jboss/keycloak-adapter-wildfly
LABEL maintainer="Pablo Bastidas, pablobastidasv@gmail.com"
COPY enabling_security_domain.cli $HOME
RUN  $JBOSS_HOME/bin/jboss-cli.sh --file=$HOME/enabling_security_domain.cli && \
    rm -rf $JBOSS_HOME/standalone/configuration/standalone_xml_history/current \
    rm -rf $HOME/enabling_security_domain.cli
ENV DEPLOYMENT_DIR "$JBOSS_HOME/standalone/deployments"