.PHONY: build test run lint docker-build
build:; cargo build
test:; cargo test
run:; cargo run
lint:; cargo clippy -- -D warnings
release:; cargo build --release
docker-build:
	docker build -t talentbridge/document-service:latest .
docker-run:
	docker run --rm -p 50031:50031 --env-file .env talentbridge/document-service:latest
