TARGET ?= concourse
SECRETS_FILE ?= ../cloudfoundry/secure/concourse-secrets.yml

all: pipeline-check

pipeline-check:
	yes | fly -t ${TARGET} set-pipeline -c fissile-stemcell-ubuntu-check.yml -p fissile-stemcell-ubuntu-check -l ${SECRETS_FILE}
	fly -t ${TARGET} unpause-pipeline -p fissile-stemcell-ubuntu-check

