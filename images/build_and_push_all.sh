echo "---------------------------------- opencue ----------------------------------"

docker compose --env-file ../.env -f docker-compose-opencue.yml build --push

echo "---------------------------------- render nodes ----------------------------------"

docker compose --env-file ../.env -f docker-compose-rendernodes.yml build --push
