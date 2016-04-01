#!/bin/bash

git clean -xffd

source `dirname $0`/build-opm-verteq.sh

OPM_COMMON_REVISION=master
OPM_PARSER_REVISION=master
OPM_MATERIAL_REVISION=master
OPM_CORE_REVISION=master
OPM_VERTEQ_REVISION=master

build_opm_verteq

cp serial/build-opm-verteq/testoutput.xml .
