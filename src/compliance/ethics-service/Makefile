.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/ethics-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t talentbridge/ethics-service:latest .

docker-run:
	docker run --rm -p 50264:50264 --env-file .env talentbridge/ethics-service:latest
