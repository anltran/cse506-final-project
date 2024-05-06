#!/bin/bash

for emptiness_fraction in {2..10};
do
    echo Running espresso benchmark with emptiness fraction: $emptiness_fraction
    sed -i "43s/.*/#define EMPTINESS_CLASSES ${emptiness_fraction}/" /home/anthony/mimalloc-bench/extern/hd/src/include/hoard/hoardheap.h
    cd /home/anthony/mimalloc-bench/extern/hd/src
    make
    cd /home/anthony/mimalloc-bench/out/bench
    ../../bench.sh hd espresso
done