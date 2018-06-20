FROM ubuntu:18.04

# We install the basics
RUN apt-get -y update
RUN apt-get install -y curl unzip nodejs

# Download and install the scanner
RUN curl --insecure -OL https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip
RUN unzip sonar-scanner-cli-3.2.0.1227-linux.zip
ENV PATH="/sonar-scanner-3.2.0.1227-linux/bin:${PATH}"

# We copy the plugins in the plugin directory
COPY plugins /sonar-scanner-3.2.0.1227-linux/extensions/

# Entrypoint
ENTRYPOINT ["sonar-scanner"]
