
test: test_hisat

test_hisat:
	nextflow run -profile test,docker main.nf -ansi-log false -resume --aligner hisat2

docker: docker_build docker_push

docker_build:
	@docker build \
		--build-arg VCS_REF=`git rev-parse --short HEAD`  \
		--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
		-t czbiohub/rnaseq .

docker_push:
	sudo docker login
	sudo docker push czbiohub/rnaseq
	docker images
