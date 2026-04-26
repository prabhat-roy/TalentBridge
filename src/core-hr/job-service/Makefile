.PHONY: build test run package docker-build
build:; mvn -B compile
test:; mvn -B test
run:; mvn -B spring-boot:run
package:; mvn -B package -DskipTests
docker-build: package
	docker build -t talentbridge/job-service:latest .
docker-run:
	docker run --rm -p 50013:50013 --env-file .env talentbridge/job-service:latest
