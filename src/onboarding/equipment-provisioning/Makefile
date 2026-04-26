.PHONY: build test run lint tidy docker-build
build:; go build -o bin/equipment-provisioning .
test:; go test ./... -v -race
run:; go run .
tidy:; go mod tidy
lint:; golangci-lint run ./...
docker-build: tidy
	docker build -t talentbridge/equipment-provisioning:latest .
docker-run:
	docker run --rm -p 50032:50032 --env-file .env talentbridge/equipment-provisioning:latest
