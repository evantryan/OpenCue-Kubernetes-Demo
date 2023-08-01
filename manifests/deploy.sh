IFS=$'\n'
for line in $(cat ../.env)
do
    echo "$line"
    export "$line"
done

echo

eval "$KUBECTL_CMD apply \
  -f db-volume-claim.yaml"

eval "$KUBECTL_CMD apply \
  -f db-service.yaml \
  -f cuebot-service.yaml \
  -f rqd-service.yaml"

eval "envsubst < db-deployment.yaml | $KUBECTL_CMD apply -f -"
eval "envsubst < cuebot-deployment.yaml | $KUBECTL_CMD apply -f -"
eval "envsubst < rqd-deployment.yaml | $KUBECTL_CMD apply -f -"

# kubectl port-forward --address=0.0.0.0 service/cuebot 8443:8443 