#!/bin/bash

STRIMZI_RELEASE="strimzi-0.35.1"
OPERATOR="${STRIMZI_RELEASE}/install/cluster-operator"
OUTPUT_YAML="${STRIMZI_RELEASE}.yaml"
NAMESPACE="usdf"

find ${OPERATOR} -name "*.yaml" | xargs -I{} sh -c 'cat {} && echo "---"' >> ${OUTPUT_YAML}

sed -i "s/namespace: .*/namespace: ${NAMESPACE}/" ${OUTPUT_YAML}
