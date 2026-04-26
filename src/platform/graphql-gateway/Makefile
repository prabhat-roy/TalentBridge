.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/graphql-gateway .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t talentbridge/graphql-gateway:latest .

docker-run:
	docker run --rm -p 50004:50004 --env-file .env talentbridge/graphql-gateway:latest
