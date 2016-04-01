#!/bin/bash

git clean -xfd

# Build ERT
git checkout ert/master

pushd .
mkdir build-ert
cd build-ert
cmake ../devel -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$WORKSPACE/install
make install
popd

# Build opm-common
git checkout opm-common/master
source jenkins/build-opm-module.sh

pushd .
mkdir build-common-serial
cd build-common-serial
build_opm_module "-DCMAKE_INSTALL_PREFIX=$WORKSPACE/install" 0
popd

# Build opm-parser
git checkout opm-parser/master
pushd .
mkdir build-parser-serial
cd build-parser-serial
build_opm_module "-DCMAKE_PREFIX_PATH=$WORKSPACE/install -DCMAKE_INSTALL_PREFIX=$WORKSPACE/install" 0
popd

# Build opm-material
git checkout opm-material/master
pushd .
mkdir build-material-serial
cd build-material-serial
build_opm_module "-DCMAKE_PREFIX_PATH=$WORKSPACE/install -DCMAKE_INSTALL_PREFIX=$WORKSPACE/install" 0
popd

# Build opm-core
git checkout opm-core/master
pushd .
mkdir build-core-serial
cd build-core-serial
build_opm_module "-DCMAKE_PREFIX_PATH=$WORKSPACE/install -DCMAKE_INSTALL_PREFIX=$WORKSPACE/install" 0
popd

# Build opm-verteq
git checkout origin/master
pushd .
mkdir build-verteq-serial
cd build-verteq-serial
build_opm_module "-DCMAKE_PREFIX_PATH=$WORKSPACE/install -DCMAKE_INSTALL_PREFIX=$WORKSPACE/install" 1
popd

cp build-verteq-serial/testoutput.xml .
