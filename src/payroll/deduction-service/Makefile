.PHONY: build test run package docker-build
build:; mvn -B compile
test:; mvn -B test
run:; mvn -B spring-boot:run
package:; mvn -B package -DskipTests
docker-build: package
	docker build -t talentbridge/deduction-service:latest .
docker-run:
	docker run --rm -p 50043:50043 --env-file .env talentbridge/deduction-service:latest
