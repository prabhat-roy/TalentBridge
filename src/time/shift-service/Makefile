.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/shift-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t talentbridge/shift-service:latest .

docker-run:
	docker run --rm -p 50121:50121 --env-file .env talentbridge/shift-service:latest
