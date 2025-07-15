#!/bin/bash

# Initialise a shell enviroment to with kubeconifg and
# traps it for removal

KUBECONFIG=/run/user/$UID/k8senv/cfg/$K8SENV_CLUSTER
mkdir -p $(dirname $KUBECONFIG)
export KLOCKPID=$BASHPID
mkdir -p /run/user/$UID/k8senv/locks/$K8SENV_CLUSTER
touch /run/user/$UID/k8senv/locks/$K8SENV_CLUSTER/$KLOCKPID
trap '($K8SENV_LIB_DIR/cleanup.sh)&' 0
# Now trap is setup we can cretae the file; so there
# do race-hardazrd signal path,.
if [ ! -s $KUBECONFIG ]; then
    $GETKUBE $K8SENV_CLUSTER > $KUBECONFIG ;
fi
export KUBECONFIG
