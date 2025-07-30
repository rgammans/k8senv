#!/bin/bash

k8s_cmd() {
 (
     . $K8SENV_LIB_DIR/runcmd.sh;
       "$@";
  )

}
