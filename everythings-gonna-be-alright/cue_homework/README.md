# CUE homework

Cue project with nginx module.
Please use `cue export *.cue --out yaml` to render templates.
You can reuse package `templates`. It contains deployment, configmap and service. I want to import all Kubernetes schemas from a remote repo and inherit them, but don't have enough time to understand how it is possible.

Also `my_nginx` package contain logic for some additional validation connected specific to my nginx app and you can also reuse it.

## Logs

```bash
cue_homework:main* λ cue export *.cue --out yaml |grep image
    image: nginxinc/nginx-unprivileged:1.27.4
              image: nginxinc/nginx-unprivileged:1.27.4
    image: nginxinc/nginx-unprivileged:1.27.1
              image: nginxinc/nginx-unprivileged:1.27.1
```
