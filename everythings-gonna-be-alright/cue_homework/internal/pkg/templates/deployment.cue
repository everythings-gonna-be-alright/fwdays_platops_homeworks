package templates

#KubernetesDeployment: {
    apiVersion: "apps/v1"
    kind:       "Deployment"
    metadata: {
        name:      string
        namespace: string | *"default"
        labels?: {
            [string]: string
        }
    }
    spec: {
        replicas: int
        selector: matchLabels: {
            [string]: string
        }
        template: {
            metadata: labels: {
                [string]: string
            }
            spec: containers: [...{
                name:  string
                image: string
                ports?: [...{
                    containerPort: int & >=1 & <=65535
                }]
                resources: {
                    requests: {
                        cpu: string
                        memory: string
                    }
                    limits: {
                        cpu: string
                        memory: string
                    }
                }
                securityContext: {
                    runAsUser: int & >0
                    runAsGroup: int & >0
                    runAsNonRoot: bool & true
                    allowPrivilegeEscalation: bool & false
                    capabilities: {
                        drop: [...string]
                    }
                    readOnlyRootFilesystem: bool
                },
                volumeMounts?: [...{
                    name: string
                    mountPath: string
                    subPath?: string
                }],
            }]
            volumes?: [...{
                name: string
                configMap: {
                    name: string
                }
            }]
        }
    }
}