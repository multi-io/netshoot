REPO=oklischat
IMAGE=$(REPO)/netshoot

GITTAG=$(shell git describe --tags --always $$(git log --format=format:%H -1 -- Dockerfile))

docker-build:
	docker build -t $(IMAGE):$(GITTAG) .

docker-run: docker-build
	docker run --rm -p 8080:8080 --name netshoot $(IMAGE):$(GITTAG)

docker-push: docker-build
	docker push $(IMAGE):$(GITTAG)

docker-push-with-latest: docker-push
	docker tag $(IMAGE):$(GITTAG) $(IMAGE):latest
	docker push $(IMAGE):latest
