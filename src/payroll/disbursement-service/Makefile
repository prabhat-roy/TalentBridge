.PHONY: build test run package docker-build
build:; mvn -B compile
test:; mvn -B test
run:; mvn -B spring-boot:run
package:; mvn -B package -DskipTests
docker-build: package
	docker build -t talentbridge/disbursement-service:latest .
docker-run:
	docker run --rm -p 50044:50044 --env-file .env talentbridge/disbursement-service:latest
