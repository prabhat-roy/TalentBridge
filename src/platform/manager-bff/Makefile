.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/manager-bff .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t talentbridge/manager-bff:latest .

docker-run:
	docker run --rm -p 50002:50002 --env-file .env talentbridge/manager-bff:latest
