.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/hr-admin-bff .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t talentbridge/hr-admin-bff:latest .

docker-run:
	docker run --rm -p 50003:50003 --env-file .env talentbridge/hr-admin-bff:latest
