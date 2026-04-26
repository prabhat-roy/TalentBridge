.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/nps-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t talentbridge/nps-service:latest .

docker-run:
	docker run --rm -p 50224:50224 --env-file .env talentbridge/nps-service:latest
