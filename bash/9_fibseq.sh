#!/bin/bash

function fibonacci() {
  local n=$1
  local a=0
  local b=1

  for (( i=0; i<n; i++)) {
    echo $a
    local c=$((a+b))
    a=$b
    b=$c
  }
}

fibonacci 93