.PHONY: build test run package docker-build
build:; mvn -B compile
test:; mvn -B test
run:; mvn -B spring-boot:run
package:; mvn -B package -DskipTests
docker-build: package
	docker build -t talentbridge/onboarding-service:latest .
docker-run:
	docker run --rm -p 50030:50030 --env-file .env talentbridge/onboarding-service:latest
