#!/bin/bash

for emptiness_fraction in {2..10};
do
    echo Running larson benchmark with emptiness fraction: $emptiness_fraction
    sed -i "43s/.*/#define EMPTINESS_CLASSES ${emptiness_fraction}/" /home/anthony/mimalloc-bench/extern/hd/src/include/hoard/hoardheap.h
    cd /home/anthony/mimalloc-bench/extern/hd/src
    make
    cd /home/anthony/mimalloc-bench/extern/hd/benchmarks/larson
    ./larson 30 7 8 1000 10000 1 4
done