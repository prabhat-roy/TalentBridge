.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/labour-compliance .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t talentbridge/labour-compliance:latest .

docker-run:
	docker run --rm -p 50260:50260 --env-file .env talentbridge/labour-compliance:latest
