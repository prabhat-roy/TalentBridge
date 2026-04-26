.PHONY: build test run package docker-build
build:; mvn -B compile
test:; mvn -B test
run:; mvn -B spring-boot:run
package:; mvn -B package -DskipTests
docker-build: package
	docker build -t talentbridge/referral-service:latest .
docker-run:
	docker run --rm -p 50024:50024 --env-file .env talentbridge/referral-service:latest
