.PHONY: build test run package docker-build
build:; mvn -B compile
test:; mvn -B test
run:; mvn -B spring-boot:run
package:; mvn -B package -DskipTests
docker-build: package
	docker build -t talentbridge/organisation-service:latest .
docker-run:
	docker run --rm -p 50011:50011 --env-file .env talentbridge/organisation-service:latest
