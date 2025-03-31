package templates

#KubernetesService: {
    apiVersion: "v1"
    kind:       "Service"
    metadata: {
        name: string
        namespace: string | *"default"
    }
    spec: {
        selector: matchLabels: {
            name: string
        }
        ports: [...{
            port: int & >=1 & <=65535
        }]
    }
}