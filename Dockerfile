FROM sonarqube:6.5-alpine
MAINTAINER Robert Neal <robert.neal@zenrooms.com>

# create plugin download location; so we can copy them later when SonarQube is started
ENV PLUGIN_DOWNLOAD_LOCATION /opt/plugins-download
RUN mkdir -p $PLUGIN_DOWNLOAD_LOCATION
WORKDIR ${PLUGIN_DOWNLOAD_LOCATION}

# download plugins from:
# - http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/
# - https://sonarsource.bintray.com/Distribution/
# - https://github.com/SonarQubeCommunity/
RUN wget https://sonarsource.bintray.com/Distribution/sonar-php-plugin/sonar-php-plugin-2.10.0.2087.jar
RUN wget http://sonarsource.bintray.com/Distribution/sonar-javascript-plugin/sonar-javascript-plugin-2.13.jar
RUN wget https://sonarsource.bintray.com/Distribution/sonar-typescript-plugin/sonar-typescript-plugin-1.0.0.340.jar
RUN wget https://github.com/racodond/sonar-json-plugin/releases/download/1.4/sonar-json-plugin-1.4.jar
RUN wget http://sonarsource.bintray.com/Distribution/sonar-xml-plugin/sonar-xml-plugin-1.4.1.jar
RUN wget https://sonarsource.bintray.com/Distribution/sonar-web-plugin/sonar-web-plugin-2.4.jar
RUN wget https://github.com/SonarQubeCommunity/sonar-css/releases/download/1.10/sonar-css-plugin.jar
RUN wget https://sonarsource.bintray.com/Distribution/sonar-scm-git-plugin/sonar-scm-git-plugin-1.2.jar
RUN wget http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-timeline-plugin/1.5/sonar-timeline-plugin-1.5.jar
RUN wget https://github.com/SonarQubeCommunity/sonar-sonargraph/releases/download/sonar-sonargraph-plugin-3.5/sonar-sonargraph-plugin-3.5.jar

COPY scripts/entrypoint.sh /opt/docker-entrypoint.sh
RUN chmod +x /opt/docker-entrypoint.sh

WORKDIR ${SONARQUBE_HOME}
ENTRYPOINT ["/opt/docker-entrypoint.sh"]