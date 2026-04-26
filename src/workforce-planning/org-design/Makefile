.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/org-design .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t talentbridge/org-design:latest .

docker-run:
	docker run --rm -p 50203:50203 --env-file .env talentbridge/org-design:latest
