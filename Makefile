build:
	docker build --tag debian-vault .

run: build
	@docker run \
		--mount type=bind,source=$$(pwd),target=/code \
		--publish 8200:8200 \
		-it debian-vault sh
