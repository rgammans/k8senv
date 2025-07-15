#!/bin/bash

SLEEPTIME=${K8SENV_DWELL:-300}

sleep $SLEEPTIME
rm -f /run/user/$UID/k8senv/locks/$K8SENV_CLUSTER/$KLOCKPID;
LOCKDIR=$9/run/user/$UID/k8senv/locks/$K8SENV_CLUSTER
if [ ! -d "$LOCKDIR" ] || [ -z "$(ls -A "$LOCKDIR")" ]; then
    rm -f $KUBECONFIG
fi
