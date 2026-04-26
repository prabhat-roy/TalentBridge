.PHONY: build test run package docker-build
build:; mvn -B compile
test:; mvn -B test
run:; mvn -B spring-boot:run
package:; mvn -B package -DskipTests
docker-build: package
	docker build -t talentbridge/offer-service:latest .
docker-run:
	docker run --rm -p 50023:50023 --env-file .env talentbridge/offer-service:latest
