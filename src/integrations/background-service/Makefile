.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/background-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t talentbridge/background-service:latest .

docker-run:
	docker run --rm -p 50323:50323 --env-file .env talentbridge/background-service:latest
