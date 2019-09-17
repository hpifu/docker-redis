version=$(shell git describe --tags)
repository=redis
user=hatlonely

.PHONY: deploy remove build push

deploy:
	mkdir -p /var/docker/${repository}/data
	docker stack deploy -c stack.yml ${repository}

remove:
	docker stack rm ${repository}

build:
	docker build --tag=${user}/${repository}:${version} .
	sed 's/image: ${user}\/${repository}:.*$$/image: ${user}\/${repository}:${version}/g' stack.tpl.yml > stack.yml

push:
	docker push ${user}/${repository}:${version}
