.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/succession-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t talentbridge/succession-service:latest .

docker-run:
	docker run --rm -p 50202:50202 --env-file .env talentbridge/succession-service:latest
