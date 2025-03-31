package my_custom_nginx

import (
	module "github.com/everythings-gonna-be-alright/cue_homework/internal/pkg/my_nginx"
)

my_nginx_module: module.#CreateNginx & {
    Params: {
        name: "nginx_new"
        owner: "devops"
        replicas: 10
        image: "nginxinc/nginx-unprivileged:1.27.4"
    }
}
