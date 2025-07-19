#!/bin/bash

k8senv_cmd() {
 (
     . $K8SENV_LIB_DIR/runcmd.sh;
       "$@";
      # Close stdout/stdin as the are held open
      # by the cleanup; but shell subst and eval need
      # to know the output is complete. (which is need)
      # to make completions work amogst other things
      exec 2>&-
      exec 1>&-
  )

}
