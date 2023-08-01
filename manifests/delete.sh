IFS=$'\n'
for line in $(cat ../.env)
do
    echo "$line"
    export "$line"
done

echo

eval "$KUBECTL_CMD delete -f rqd-deployment.yaml"
eval "$KUBECTL_CMD delete -f cuebot-deployment.yaml"
eval "$KUBECTL_CMD delete -f db-deployment.yaml"
eval "$KUBECTL_CMD delete \
  -f db-service.yaml \
  -f cuebot-service.yaml \
  -f rqd-service.yaml"
eval "$KUBECTL_CMD delete \
  -f db-volume-claim.yaml"



