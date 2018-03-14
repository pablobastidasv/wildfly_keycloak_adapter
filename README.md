# Docker wildfly container

A Wildfly docker container with the Keycloak adapter installed to deploy 
your apps using KEYCLOAK login method like below:

```xml
<auth-method>KEYCLOAK</auth-method>
```

## Dockerfile

Dockerfile should looks like below example.

```Dockerfile
FROM pablobastidasv/wildfly_keycloak_adapter
COPY ./target/micro.war ${DEPLOYMENT_DIR}
```

The `.war` file is a standard JEE artifact.