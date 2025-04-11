#!/bin/bash

clear
echo "********************************************************"
echo "Criando e executando o container do SonarQube Scanner..."
echo "********************************************************"
docker run -it \
  -e SONAR_HOST_URL="http://sonarqube-app:9000" \
  -e SONAR_TOKEN="sqp_61443f6f1579699a4813ea101f0a42a1cf43548b" \
  -e SONARQUBE_SCANNER_PARAMS='{"sonar.projectKey":"go-project","sonar.sources":"."}' \
  -v $(realpath ../go/):/usr/src/ \
  -v sonar_cache:/opt/sonar-scanner/.sonar/cache \
  --platform linux/amd64 \
  --name sonar-scanner \
  --network sonarqube_sonarnet \
  --rm \
  sonarsource/sonar-scanner-cli:latest

