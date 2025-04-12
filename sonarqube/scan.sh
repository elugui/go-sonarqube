#!/bin/bash

clear
echo "********************************************************"
echo "Criando e executando o container do SonarQube Scanner..."
echo "********************************************************"
docker run -it \
  -e SONAR_HOST_URL="http://sonarqube-app:9000" \
  -e SONAR_TOKEN="sqp_3fd8f3822852867827d4f80d6f48f0b51a432bbe" \
  -e SONARQUBE_SCANNER_PARAMS='{ 
    "sonar.projectKey":"go-prooject", 
    "sonar.language":"go",
    "sonar.sources": ".",
    "sonar.text.inclusions": "**/*.go",
    "sonar.exclusions": "**/*_test.go",
    "sonar.tests": ".",
    "sonar.test.inclusions": "**/*_test.go",
    "sonar.go.coverage.reportPaths": "coverage.out",
    "sonar.scm.disabled": "true"
  }' \
  -v $(realpath ../go/):/usr/src/ \
  -v sonar_cache:/opt/sonar-scanner/.sonar/cache \
  --platform linux/amd64 \
  --name sonar-scanner \
  --network sonarqube_sonarnet \
  --rm \
  sonarsource/sonar-scanner-cli:latest
  