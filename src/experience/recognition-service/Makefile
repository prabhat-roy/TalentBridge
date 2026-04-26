.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/recognition-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t talentbridge/recognition-service:latest .

docker-run:
	docker run --rm -p 50222:50222 --env-file .env talentbridge/recognition-service:latest
