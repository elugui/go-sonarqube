## SonarQube com Golang

### Comando para executar o container
```
docker run -it --rm -v ./go/:/app golang:1.19 bash
```

### Comando para gerar o arquivo de cobertura do teste
```
go test -coverprofile=coverage.out
```

### Comando para executar o SonarQube

```
docker-compose up -d
```

### Comando para executar o sonar scanner

```
sonar-scanner
```
Neste projeto optei por não utilizar a criação do arquivo `sonar-project.properties` e os parâmetros estão sendo passados via `SONARQUBE_SCANNER_PARAMS` (parâmetros em formato JSON) ao executar o comando `docker run`.

Para executar o `sonar scanner` entre na pasta `./sonarqube`, execute o comando `chmod +x scan.sh` para conceder permissão de execução em seguida `./scan.sh` e a análise será executada. Nota: O `SonarQube` container deve estar em execução, veja o comando acima para executá-lo.






