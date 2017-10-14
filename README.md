# docker-sonarqube

Docker image based on default [SonarQube 6.5](https://hub.docker.com/_/sonarqube/) with manual installed plugins. 
The default provided plugins are removed and replaced by manual downloaded.

To add/remove plugins modify the Dockerfile and build your own version.

### Building the image
`docker build -t docker-sonarqube .`

### Running the image
`docker run -it --rm docker-sonarqube`

## Installed plugins
* sonar-php-plugin-2.10.0.2087.jar
* sonar-javascript-plugin-2.8.jar
* sonar-typescript-plugin-1.0.0.340.jar
* sonar-json-plugin-1.4.jar
* sonar-xml-plugin-1.4.1.jar
* sonar-web-plugin-2.4.jar
* sonar-css-plugin.jar  
* sonar-scm-git-plugin-1.2.jar
* sonar-sonargraph-plugin-3.5.jar
* sonar-timeline-plugin-1.5.jar
