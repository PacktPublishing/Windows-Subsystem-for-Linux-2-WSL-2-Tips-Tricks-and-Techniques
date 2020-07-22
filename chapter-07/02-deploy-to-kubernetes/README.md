# README

This is a sample project to show running a web application in Kubernetes

These steps assume that you have followed along with previous examples and have a local `simple-python-app:v1` image.


## Running the web application

The yaml files describing the deployment and service are defined in the `manifests` folder. To deploy the web application, run

```bash
kubectl create -f manifests
```

To check the status, run `kubectl get all`:

```bash
$ kubectl get all
NAME                                      READY   STATUS    RESTARTS   AGE
pod/chapter-07-example-7dc44b8d94-4xgr2   1/1     Running   0          112s

NAME                         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/chapter-07-example   NodePort    10.107.251.113   <none>        5000:30123/TCP   110s
service/kubernetes           ClusterIP   10.96.0.1        <none>        443/TCP          23h

NAME                                 READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/chapter-07-example   1/1     1            1           113s

NAME                                            DESIRED   CURRENT   READY   AGE
replicaset.apps/chapter-07-example-7dc44b8d94   1         1         1       113s
```

Note the `30123` port on the service: 

```bash
$ curl http://localhost:30123
<html><body><h1>Hello from chapter-07-example-7dc44b8d94-4xgr2</h1></body></html>
```

## Deleting the web application

To stop the web application running and clean up, run `kubectl delete -f manifests`