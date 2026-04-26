.PHONY: build test run package docker-build
build:; mvn -B compile
test:; mvn -B test
run:; mvn -B spring-boot:run
package:; mvn -B package -DskipTests
docker-build: package
	docker build -t talentbridge/salary-service:latest .
docker-run:
	docker run --rm -p 50041:50041 --env-file .env talentbridge/salary-service:latest
