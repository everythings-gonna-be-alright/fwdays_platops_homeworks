package my_nginx

import (
	"github.com/everythings-gonna-be-alright/cue_homework/internal/pkg/templates"

    "strings"
)

// CreateNginx is a module for creating a Kubernetes deployment for nginx based on generic templates
#CreateNginx: {

    // Params is a struct for the parameters of this module
    Params: {
        name: strings.HasPrefix("nginx")
        owner: "devops" | "developer"
        replicas: int & >=1 & <=100
        image: strings.HasPrefix("nginx") & =~".+:(1.[2-9][7-9].*)" & !~".+:latest$"
    }

    // Kubernetes deployment for nginx
    deployment: templates.#KubernetesDeployment & {
        metadata: {
            name: Params.name
            labels: {
                app: Params.name
                owner: Params.owner
            }
        }
        spec: {
            replicas: Params.replicas
            selector: matchLabels: {
                app: Params.name
            }
            template: {
                metadata: labels: {
                    app: Params.name
                    owner: Params.owner
                }
                spec: containers: [{
                    name:  Params.name
                    image: Params.image
                    ports: [{
                        containerPort: 80
                    }]
                    resources: {
                        requests: {
                            cpu: "500m"
                            memory: "256Mi"
                        }
                        limits: {
                            cpu: "500m"
                            memory: "256Mi"
                        }
                    }
                    securityContext: {
                        runAsUser: 1000
                        runAsGroup: 1000
                        runAsNonRoot: true
                        allowPrivilegeEscalation: false
                        capabilities: {
                            drop: ["ALL"]
                        }
                        readOnlyRootFilesystem: true
                    }
                    volumeMounts: [{
                        name: "nginx-config"
                        mountPath: "/etc/nginx/conf.d"
                        subPath: "nginx.conf"
                    }]
                }]
                volumes: [{
                    name: "nginx-config"
                    configMap: {
                        name: configmap.metadata.name
                    }
                }]
            }
        }
    }

    // Kubernetes service for nginx
    service: templates.#KubernetesService & {
        metadata: {
            name: deployment.metadata.name
        }
        spec: {
            selector: matchLabels: {
                name: deployment.metadata.name
            }
            ports: [{
                port: deployment.spec.template.spec.containers[0].ports[0].containerPort
            }]
        }
    }

    // Kubernetes configmap for nginx with nginx.conf
    configmap: templates.#KubernetesConfigMap & {
        metadata: {
            name: deployment.metadata.name
        }
        data: {
            "nginx.conf": "server { listen 8080; server_name localhost; root /usr/share/nginx/html; index index.html; }"
        }
    }
}