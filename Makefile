# ENVs
export DIR_FLOODGATE=./data/plugins/Floodgate
export DIR_GEYSER=./Geyser/data
export URL_FLOODGATE=https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/lastSuccessfulBuild/artifact/spigot/target/floodgate-spigot.jar
export URL_GEYSER=https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/standalone/target/Geyser.jar
# ------------------------------
deploy: ## deploy minecraft servers with docker
	@make agree-eula
	@make run
agree-eula:
	echo 'eula=true' > data/eula.txt
run:
	docker compose up -d
# ------------------------------
update-geysermc: ## download latest geysermc
	wget -P ${DIR_GEYSER} ${URL_GEYSER}
update-floodgate: ## download latest floodgate
	wget -P ${DIR_FLOODGATE} ${URL_FLOODGATE}

# ------------------------------
help: ## this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
