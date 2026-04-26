.PHONY: install run test lint docker-build
install:; npm install
run:; npm run start
dev:; npm run dev
test:; npm test
docker-build:
	docker build -t talentbridge/buddy-service:latest .
docker-run:
	docker run --rm -p 50033:50033 --env-file .env talentbridge/buddy-service:latest
