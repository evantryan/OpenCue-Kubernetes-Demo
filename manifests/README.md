# Manage OpenCue

## deploy

The deploy script reads the environment settings from ../.env and uses `envsubst` to pass that to manifests. The rqd deployment has an affinity section so only one rqd pod per node will be created. In addition to that section, one might want to futz with the resource limits and requests.

    ./deploy.sh

Check everything is running with `kubectl get all`. You should see something like...

    NAME                         READY   STATUS    RESTARTS   AGE
    pod/db-##########-#####      1/1     Running   0          14m
    pod/cuebot-#########-#####   1/1     Running   0          14m
    pod/rqd-##########-#####     1/1     Running   0          14m

    NAME                 TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)             AGE
    service/kubernetes   ClusterIP   10.000.000.0     <none>        443/TCP             40d
    service/db           ClusterIP   10.000.000.000   <none>        5432/TCP            14m
    service/cuebot       ClusterIP   10.000.000.000   <none>        8443/TCP,8080/TCP   14m
    service/rqd          ClusterIP   10.000.000.000   <none>        8444/TCP            14m

    NAME                     READY   UP-TO-DATE   AVAILABLE   AGE
    deployment.apps/db       1/1     1            1           14m
    deployment.apps/cuebot   1/1     1            1           14m
    deployment.apps/rqd      1/1     1            1           14m

    NAME                               DESIRED   CURRENT   READY   AGE
    replicaset.apps/db-##########      1         1         1       14m
    replicaset.apps/cuebot-#########   1         1         1       14m
    replicaset.apps/rqd-##########     1         1         1       14m


Scaling rqd can be done with

    kubectl scale --replicas 6 deployment rqd

Once `1/1` is achieved, the cuebot port can be forwarded/exposed with the following command. Note that this can also be achieved using ingress, NodePort or something like inlets. This is needed to access cuebot on localhost. Port-forward doesn't detatch, so you'll need another terminal while this is running.

    kubectl port-forward --address=0.0.0.0 service/cuebot 8443:8443

## Have a look at cuegui, submit test jobs, explore pyoutline and pycue modules

Check out [../client/README.md](../client/README.md)

## bring it all down

    ./delete.sh