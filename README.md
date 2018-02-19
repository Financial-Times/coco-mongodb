# MongoDB wrapper
MongoDB wrapper that runs in a 3 node replicaset.

For keeping the persistent data it uses 3 k8s Persistent Volumes, one for each replicaset.

### Mongo configurator
On the first start with empty data, MongoDB needs configuration to run in a replica set.

On a Kubernetes cluster this is achieved automatically by a [mongo configurator job](helm/mongodb/templates/mongo-configurator-job.yaml) 
that runs `only` on the first `helm install` in a cluster.

## Useful information:
[Ops panic guide](https://sites.google.com/a/ft.com/universal-publishing/ops-guides/mongodb-panic-guide)

## Troubleshooting
### Access to the data
You can have access to the data by entering the pod and looking into `/data/db`
```
kubectl exec -it mongodb-x-...... /bin/bash
#inside the pod
cd /data/db

``` 

### Access to the data without mongodb running
If, for some reason (like restore debug) you need access to the data, but without the instance running you can use a temporary pod to mount mongo's persistent volume.

Here are the steps for it:
1. Stop the mongo instance
    ```
    kc scale deployment mongodb-x --replicas 0
    ```
1. Create a file `mongo-debug-x.yaml` with the following contents:
    ```
    apiVersion: v1
    kind: Pod
    metadata:
      name: mongo-x-debug
    spec:
      tolerations:
      - key: "dedicated"
        operator: "Equal"
        value: "mongo"
        effect: "NoSchedule"
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: kube-aws.coreos.com/role
                operator: In
                values:
                - mongo-worker
      containers:
      - name: debug
        image: alpine
        # Just spin & wait forever
        command: [ "/bin/sh", "-c", "--" ]
        args: [ "while true; do sleep 30; done;" ]
        volumeMounts:
        - name: mongo-x-data
          mountPath: /data/db
      volumes:
       - name: mongo-x-data
         persistentVolumeClaim:
           claimName: "mongodb-pvc-x"
    ```
1. Deploy the pod:
    ```
    kubectl apply -f mongo-debug-x.yaml
    ```    
1. Enter the pod and find the volume mounted in /data/db
    ```
    kubectl exec -it mongo-x-debug /bin/bash
    #inside the pod
    cd /data/db    
    ```
