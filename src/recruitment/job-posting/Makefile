.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/job-posting .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t talentbridge/job-posting:latest .

docker-run:
	docker run --rm -p 50060:50060 --env-file .env talentbridge/job-posting:latest
