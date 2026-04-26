.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/ergonomic-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t talentbridge/ergonomic-service:latest .

docker-run:
	docker run --rm -p 50282:50282 --env-file .env talentbridge/ergonomic-service:latest
