#!/bin/bash

k8senv_cmd() {
 (
     . $K8SENV_LIB_DIR/runcmd.sh;
       "$@";
  )

}
