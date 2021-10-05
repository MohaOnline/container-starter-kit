```bash

docker run --rm -it -v "$HOME":/root -v "$(pwd)":/app -w /app maven:3-jdk-11 mvn -e -DskipTests=true clean package

docker run --rm -it -v "$HOME":/root -v "$(pwd)":/app -w /app maven:3-jdk-11 mvn clean package
docker run --rm -it -v "$HOME/.m2":/root/.m2 -v "$(pwd)":/app -w /app maven:3-jdk-11 mvn clean spring-boot:repackage
```