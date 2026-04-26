.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/health-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t talentbridge/health-service:latest .

docker-run:
	docker run --rm -p 50280:50280 --env-file .env talentbridge/health-service:latest
