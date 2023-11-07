server:
	cd src/server && make release
client:
	cd src/client && make release
dev-server:
	cd src/server && make develop
dev-client:
	cd src/client && make develop
docker-up:
	docker-compose up -d --build
docker-down:
	docker-compose down
docker-logs:
	docker-compose logs -f -t
