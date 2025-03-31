package my_custom_nginx

import (
	module "github.com/everythings-gonna-be-alright/cue_homework/internal/pkg/my_nginx"
)

my_old_nginx_module: module.#CreateNginx & {
    Params: {
        name: "nginx_old"
        owner: "developer"
        replicas: 1
        image: "nginxinc/nginx-unprivileged:1.27.1"
    }
}
