SECRET_PATH ?= secret/rubin/usdf-rucio-data-backbone/data-backbone
ENV = $(notdir ${CURDIR})

get-secrets-from-vault:
	mkdir -p redis/etc/.secrets/
	vault kv get --field=redis ${SECRET_PATH} > redis/etc/.secrets/redis-secret

clean-secrets:
	rm -rf redis/etc/.secrets/

run-apply:
	kubectl apply -k .

apply: get-secrets-from-vault run-apply clean-secrets


