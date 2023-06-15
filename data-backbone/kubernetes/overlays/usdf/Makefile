SECRET_PATH ?= secret/rubin/usdf-rucio-data-backbone
ENV = $(notdir ${CURDIR})

get-secrets-from-vault:
	mkdir -p etc/.secrets/
	# internal redis password and Ceph notification secret
	set -e; for i in redis; do vault kv get --field=$$i ${SECRET_PATH}/${ENV} > etc/.secrets/$$i ; done

clean-secrets:
	rm -rf etc/.secrets/
	rmdir ./etc

run-dump:
	kubectl kustomize .

dump: get-secrets-from-vault run-dump clean-secrets

run-apply:
	kubectl apply -k .

apply: get-secrets-from-vault run-apply clean-secrets


