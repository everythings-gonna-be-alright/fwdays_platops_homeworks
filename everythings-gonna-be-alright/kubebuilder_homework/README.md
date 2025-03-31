# Config Operator

This is just a demo project to check how the config operator works. It was created as homework for a platform engineering course.

## How does your reconciliation loop work?

It watches through the API for any `appsv1.ConfigSync{}` CRDs between a set time period (60 seconds by default) and generate configmap based on CRDs values. If a configmap doesn't exist - it will create a new one. If it exists - it will try to update the existing one.

## How you handled error conditions?

As I can see, the code uses function `IsNotFound` and returns an empty value to avoid fatal conditions and continue executing.

## Issues during homework

In examples I found two mistakes:

1. `controllers/configsync_controller.go` - patch doesn't exist. I found the file in internal/controller dir.
2. `package controllers` in `configsync_controller.go` - it's wrong. The correct package name is controller, not controllers.

## Logs

```bash
config-operator λ kubectl get po
NAME                                                 READY   STATUS    RESTARTS   AGE
config-operator-controller-manager-57b4bc6c7-jrz75   1/1     Running   0          49s

config-operator λ kubectl get configmap my-config -o yaml
apiVersion: v1
data:
  app.properties: |
    app.name=MyApp
    app.version=1.0.0
  putin: khuylo
kind: ConfigMap
metadata:
  creationTimestamp: "2025-03-30T20:11:11Z"
  name: my-config
  namespace: config-operator-system
  resourceVersion: "2054"
  uid: 5a247b32-d268-4a79-ac63-f4d031ea675d
config-operator λ kubectl get configsync configsync-sample -o yaml
apiVersion: apps.example.com/v1
kind: ConfigSync
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"apps.example.com/v1","kind":"ConfigSync","metadata":{"annotations":{},"name":"configsync-sample","namespace":"config-operator-system"},"spec":{"configMapName":"my-config","data":{"app.properties":"app.name=MyApp\napp.version=1.0.0\n","putin":"khuylo"},"updateInterval":30}}
  creationTimestamp: "2025-03-30T20:11:11Z"
  generation: 1
  name: configsync-sample
  namespace: config-operator-system
  resourceVersion: "2055"
  uid: 1cbb1497-ec48-46f2-9f45-c78c8396a903
spec:
  configMapName: my-config
  data:
    app.properties: |
      app.name=MyApp
      app.version=1.0.0
    putin: khuylo
  updateInterval: 30
status:
  lastSyncTime: "2025-03-30T20:11:11Z"
  status: Synced

config-operator λ kubectl edit configsync configsync-sample
configsync.apps.example.com/configsync-sample edited

config-operator λ kubectl get configsync configsync-sample -o yaml
apiVersion: apps.example.com/v1
kind: ConfigSync
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"apps.example.com/v1","kind":"ConfigSync","metadata":{"annotations":{},"name":"configsync-sample","namespace":"config-operator-system"},"spec":{"configMapName":"my-config","data":{"app.properties":"app.name=MyApp\napp.version=1.0.0\n","putin":"khuylo"},"updateInterval":30}}
  creationTimestamp: "2025-03-30T20:11:11Z"
  generation: 2
  name: configsync-sample
  namespace: config-operator-system
  resourceVersion: "2153"
  uid: 1cbb1497-ec48-46f2-9f45-c78c8396a903
spec:
  configMapName: my-config
  data:
    app.properties: |
      app.name=MyApp
      app.version=2.0.0
    putin: khuylo
  updateInterval: 30
status:
  lastSyncTime: "2025-03-30T20:12:03Z"
  status: Synced
```
