# ENVs
export FLOODGATE_DIR=./data/plugins/Floodgate
export FLOODGATE_URL=https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/lastSuccessfulBuild/artifact/spigot/target/floodgate-spigot.jar
export GEYSER_DIR=./Geyser/data
export GEYSER_URL=https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/standalone/target/Geyser.jar
# --------------------------------------------------
deploy: ## deploy minecraft servers with docker
	@make agree-eula
	@make run
agree-eula:
	echo 'eula=true' > data/eula.txt
run:
	docker compose up -d
# --------------------------------------------------
update-geysermc: ## download latest geysermc
	wget -P ${GEYSER_DIR} ${GEYSER_URL}
update-floodgate: ## download latest floodgate
	wget -P ${FLOODGATE_DIR} ${FLOODGATE_URL}
# --------------------------------------------------
help: ## this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
