FROM ubuntu:18.04

# We install the basics
RUN apt-get -y update
RUN apt-get install -y curl unzip

# Download and install the scanner
RUN curl --insecure -OL https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.1.0.1141-linux.zip
RUN unzip sonar-scanner-cli-3.1.0.1141-linux.zip

ENTRYPOINT ["sonar-scanner-3.1.0.1141-linux/bin/sonar-scanner"]
