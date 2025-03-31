# Timoni homework

## Report about any challenges faced ans sollutions

I can't run application from .yaml files. It works only from .cue files.
Also impossible to create module without module name in command. (`timoni mod init my-web-app` - correct. `timoni mod init` - incorrect).

I use standard timoni template with some minor changes.

## Logs of single installation

```bash
timoni_homework:main* λ timoni apply web-prod ./my-web-app --namespace default --values values.cue
4:49AM INF i:web-prod > building ./my-web-app
4:49AM INF i:web-prod > using module timoni.sh/my-web-app version 0.0.0-devel
4:49AM INF i:web-prod > installing web-prod in namespace default
4:49AM INF i:web-prod > ServiceAccount/default/web-prod created
4:49AM INF i:web-prod > ConfigMap/default/web-prod-339f7ac4 created
4:49AM INF i:web-prod > Service/default/web-prod created
4:49AM INF i:web-prod > Deployment/default/web-prod created
4:49AM INF i:web-prod > resources are ready

timoni_homework:main* λ kubectl get po
NAME                        READY   STATUS    RESTARTS   AGE
web-prod-6f978d48d5-2sqhk   1/1     Running   0          16s
web-prod-6f978d48d5-4dnc6   1/1     Running   0          16s
web-prod-6f978d48d5-bp2pn   1/1     Running   0          16s
web-prod-6f978d48d5-gq8nt   1/1     Running   0          16s
web-prod-6f978d48d5-gs5rj   1/1     Running   0          16s
web-prod-6f978d48d5-nxhk6   1/1     Running   0          16s
web-prod-6f978d48d5-p8zml   1/1     Running   0          16s
web-prod-6f978d48d5-pr79q   1/1     Running   0          16s
web-prod-6f978d48d5-td8f2   1/1     Running   0          16s
web-prod-6f978d48d5-xvq6j   1/1     Running   0          16s
```

## Logs of bundle installation

```bash
timoni_homework:main* λ timoni bundle apply -f bundle.cue
4:51AM INF b:podinfo > applying 2 instance(s)
4:51AM INF b:podinfo > i:production > applying module timoni.sh/my-web-app version 0.0.0-devel
4:51AM INF b:podinfo > i:production > installing production in namespace nginx-production
4:51AM INF b:podinfo > i:production > Namespace/nginx-production created
4:51AM INF b:podinfo > i:production > ServiceAccount/nginx-production/production created
4:51AM INF b:podinfo > i:production > ConfigMap/nginx-production/production-96dbbcf9 created
4:51AM INF b:podinfo > i:production > Service/nginx-production/production created
4:51AM INF b:podinfo > i:production > Deployment/nginx-production/production created
4:51AM INF b:podinfo > i:production > resources are ready
4:51AM INF b:podinfo > i:staging > applying module timoni.sh/my-web-app version 0.0.0-devel
4:51AM INF b:podinfo > i:staging > installing staging in namespace nginx-staging
4:51AM INF b:podinfo > i:staging > Namespace/nginx-staging created
4:51AM INF b:podinfo > i:staging > ServiceAccount/nginx-staging/staging created
4:51AM INF b:podinfo > i:staging > ConfigMap/nginx-staging/staging-73f6f68f created
4:51AM INF b:podinfo > i:staging > Service/nginx-staging/staging created
4:51AM INF b:podinfo > i:staging > Deployment/nginx-staging/staging created
4:51AM INF b:podinfo > i:staging > resources are ready
4:51AM INF b:podinfo > applied successfully in 11s

timoni_homework:main* λ kubectl get po -A| grep 'nginx'
nginx-production     production-6d87f7565f-5xcpt                              1/1     Running   0              89s
nginx-production     production-6d87f7565f-7htzq                              1/1     Running   0              89s
nginx-production     production-6d87f7565f-bjtwz                              1/1     Running   0              89s
nginx-production     production-6d87f7565f-dftp9                              1/1     Running   0              89s
nginx-production     production-6d87f7565f-f6b9z                              1/1     Running   0              89s
nginx-production     production-6d87f7565f-gm49w                              1/1     Running   0              89s
nginx-production     production-6d87f7565f-t4pt8                              1/1     Running   0              89s
nginx-production     production-6d87f7565f-v25v9                              1/1     Running   0              89s
nginx-production     production-6d87f7565f-vsmfr                              1/1     Running   0              89s
nginx-production     production-6d87f7565f-w2v25                              1/1     Running   0              89s
nginx-staging        staging-66f45cd7d5-bwbh2                                 1/1     Running   0              84s
nginx-staging        staging-66f45cd7d5-w7fp2                                 1/1     Running   0              84s

timoni_homework:main* λ timoni bundle delete -f bundle.cue
4:53AM INF b:podinfo > deleting instance staging in namespace nginx-staging
4:53AM INF b:podinfo > Deployment/nginx-staging/staging deleted
4:53AM INF b:podinfo > Service/nginx-staging/staging deleted
4:53AM INF b:podinfo > ConfigMap/nginx-staging/staging-73f6f68f deleted
4:53AM INF b:podinfo > ServiceAccount/nginx-staging/staging deleted
4:53AM INF b:podinfo > all resources have been deleted
4:53AM INF b:podinfo > deleting instance production in namespace nginx-production
4:53AM INF b:podinfo > Deployment/nginx-production/production deleted
4:53AM INF b:podinfo > Service/nginx-production/production deleted
4:53AM INF b:podinfo > ConfigMap/nginx-production/production-96dbbcf9 deleted
4:53AM INF b:podinfo > ServiceAccount/nginx-production/production deleted
4:53AM INF b:podinfo > all resources have been deleted
```
