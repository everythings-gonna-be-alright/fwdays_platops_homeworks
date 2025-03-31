bundle: {
    apiVersion: "v1alpha1"
    name:       "podinfo"
    instances: {
      "production": {
        module: {
          url: "file://./my-web-app"
        }
        namespace: "nginx-production"
        values: {
          message:  "Production nginx server"
          replicas: 10
          image: {
            repository: "nginxinc/nginx-unprivileged"
            tag:        "1.27-alpine3.21"
          }
        }
      }
      "staging": {
        module: {
          url: "file://./my-web-app"
        }
        namespace: "nginx-staging"
        values: {
          message:  "Staging nginx server"
          replicas: 2
          image: {
            repository: "nginxinc/nginx-unprivileged"
            tag:        "1.27-alpine3.21"
          }
        }
      }
    }
}
