#!/bin/bash

git clean -xffd

source `dirname $0`/build-opm-verteq.sh

OPM_COMMON_REVISION=master
OPM_PARSER_REVISION=master
OPM_MATERIAL_REVISION=master
OPM_CORE_REVISION=master
OPM_VERTEQ_REVISION=$sha1

if grep -q "opm-common=" <<< $ghprbCommentBody
then
  OPM_COMMON_REVISION=pull/`echo $ghprbCommentBody | sed -r 's/.*opm-common=([0-9]+).*/\1/g'`/merge
fi

if grep -q "opm-parser=" <<< $ghprbCommentBody
then
  OPM_PARSER_REVISION=pull/`echo $ghprbCommentBody | sed -r 's/.*opm-parser=([0-9]+).*/\1/g'`/merge
fi

if grep -q "opm-material=" <<< $ghprbCommentBody
then
  OPM_MATERIAL_REVISION=pull/`echo $ghprbCommentBody | sed -r 's/.*opm-material=([0-9]+).*/\1/g'`/merge
fi

if grep -q "opm-core=" <<< $ghprbCommentBody
then
  OPM_CORE_REVISION=pull/`echo $ghprbCommentBody | sed -r 's/.*opm-core=([0-9]+).*/\1/g'`/merge
fi

echo "Building with opm-common=$OPM_COMMON_REVISION opm-parser=$OPM_PARSER_REVISION opm-material=$OPM_MATERIAL_REVISION opm-core=$OPM_CORE_REVISION opm-verteq=$OPM_VERTEQ_REVISION"

build_opm_verteq

cp serial/build-opm-verteq/testoutput.xml .
