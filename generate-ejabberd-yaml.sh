#!/usr/bin/env bash

CHART=ejabberd
NAMESPACE=ejabberd

declare -a ENVS=(dev)

# Check the number of parameters
if [[ $# -ne 1 ]]; then
  echo -e "\e[1;31mUsage\e[0m: $0 <ENVIRONMENT>"
  echo -e "\e[34mEnvironment:\e[0m ${ENVS[*]}"
  exit 1
else
  ENV=$1
fi

release_name=$(date +%s)

yaml_file=${CHART}-${ENV}.yaml
echo -e "\e[32mCreate ${yaml_file}\e[0m"

# helm2 template . -f values-${ENV}.yaml --name ${release_name} --namespace ${NAMESPACE} >${yaml_file}
helm3 template ${release_name} . -f values-${ENV}.yaml --namespace ${NAMESPACE} >${yaml_file}
