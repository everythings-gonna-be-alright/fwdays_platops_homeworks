package templates

#KubernetesConfigMap: {
    apiVersion: "v1"
    kind:       "ConfigMap"
    metadata: {
        name: string
        namespace: string | *"default"
    }
    data: {
        [string]: string
    }
}