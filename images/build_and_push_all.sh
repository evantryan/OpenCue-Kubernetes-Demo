echo "---------------------------------- opencue ----------------------------------"

docker compose --env-file ../.env -f docker-compose-opencue.yml build
docker compose --env-file ../.env -f docker-compose-opencue.yml push

echo "---------------------------------- render nodes ----------------------------------"

docker compose --env-file ../.env -f docker-compose-rendernodes.yml build
docker compose --env-file ../.env -f docker-compose-rendernodes.yml push
