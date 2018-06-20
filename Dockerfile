FROM ubuntu:18.04

# We fix sonar version
ENV SONAR_SCANNER_VERSION 3.2.0.1227

# We install the basics
RUN apt-get -y update
RUN apt-get install -y curl unzip nodejs npm

# Download and install the scanner
RUN curl --insecure -OL https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip
RUN unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip
ENV PATH="/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin:${PATH}"

# Install typescript globally as it is needed for SonarTS
RUN npm install -g typescript

# Entrypoint
ENTRYPOINT ["sonar-scanner"]
