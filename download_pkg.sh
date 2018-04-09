#!/bin/bash

source /cvmfs/hep.pnnl.gov/project8/katydid/${KATYDIDBRANCH}/setup.sh

########################################################################
#
# collect source distributions for all submodules
#
########################################################################

export SCARAB_BRANCH=master
export NYMPH_BRANCH=master
export MONARCH_BRANCH=master
export KATYDID_BRANCH=master
export CICADA_BRANCH=master
export RAPIDJSON_BRANCH=5de06bfa37495b529dc00139f1b138a526fff27a
export YAMLCPP_BRANCH=3757b2023b71d183a341677feee693c71c2e0766

export SCARAB_URL=https://github.com/project8/scarab/archive/${SCARAB_BRANCH}.zip
export NYMPH_URL=https://github.com/project8/nymph/archive/${NYMPH_BRANCH}.zip
export MONARCH_URL=https://github.com/project8/monarch/archive/${MONARCH_BRANCH}.zip
export KATYDID_URL=https://github.com/project8/katydid/archive/${KATYDID_BRANCH}.zip
export CICADA_URL=https://github.com/project8/cicada/archive/${KATYDID_BRANCH}.zip
export RAPIDJSON_URL=https://github.com/Tencent/rapidjson/archive/${RAPIDJSON_BRANCH}.zip
export YAMLCPP_URL=https://github.com/jbeder/yaml-cpp/archive/${YAMLCPP_BRANCH}.zip

# get into the parent directory for all the source code and build proucts
cd ${P8KATYDIDDIR}
mkdir src
cd src/
pwd

# Because Git does not exist, we have to download manually all items and put them at the right place. 
# How annoying...
echo "Prepare Katydid"
wget -O katydid-${KATYDID_BRANCH}.zip ${KATYDID_URL} --output-file=wget_log.txt --tries=3
unzip -q katydid-${KATYDID_BRANCH}.zip
rm katydid-${KATYDID_BRANCH}.zip
mv katydid-${KATYDID_BRANCH} Katydid
mkdir -p Katydid/Source/Time

echo "Prepare Scarab"
wget -O scarab-${SCARAB_BRANCH}.zip ${SCARAB_URL} --output-file=wget_log.txt --tries=3
unzip -q scarab-${SCARAB_BRANCH}.zip
rm scarab-${SCARAB_BRANCH}.zip
mv scarab-${SCARAB_BRANCH} Scarab
echo "Rapidjson for Scarab"
wget -O rapidjson-${RAPIDJSON_BRANCH}.zip ${RAPIDJSON_URL} --output-file=wget_log.txt --tries=3
unzip -q rapidjson-${RAPIDJSON_BRANCH}.zip
rm rapidjson-${RAPIDJSON_BRANCH}.zip
mv rapidjson-${RAPIDJSON_BRANCH} rapidjson
mkdir -p Scarab/library/param/codec/json
mv rapidjson Scarab/library/param/codec/json
rm -rf rapidjson
echo "yaml-cpp for Scarab"
wget -O yaml-cpp-${YAMLCPP_BRANCH}.zip ${YAMLCPP_URL} --output-file=wget_log.txt --tries=3
unzip -q yaml-cpp-${YAMLCPP_BRANCH}.zip
rm yaml-cpp-${YAMLCPP_BRANCH}.zip
mv yaml-cpp-${YAMLCPP_BRANCH} yaml-cpp
mkdir -p Scarab/library/param/codec/yaml
mv yaml-cpp Scarab/library/param/codec/yaml
rm -rf yaml-cpp
echo "Scarab is ready!"

echo "Prepare Monarch"
wget -O monarch-${MONARCH_BRANCH}.zip ${MONARCH_URL} --output-file=wget_log.txt --tries=3
unzip -q monarch-${MONARCH_BRANCH}.zip
rm monarch-${MONARCH_BRANCH}.zip
mv monarch-${MONARCH_BRANCH} Monarch
cp -r Scarab Monarch
mv Monarch Katydid/Source/Time/.
echo "Monarch is done!"

echo "Prepare Nymph"
wget -O nymph-${NYMPH_BRANCH}.zip ${NYMPH_URL} --output-file=wget_log.txt --tries=3
unzip -q nymph-${NYMPH_BRANCH}.zip
rm nymph-${NYMPH_BRANCH}.zip
mv nymph-${NYMPH_BRANCH} Nymph
cp -r Scarab Nymph
mv Nymph Katydid/.
echo "Nymph is done!"

echo "Prepare Cicada"
wget -O cicada-${CICADA_BRANCH}.zip ${CICADA_URL} --output-file=wget_log.txt --tries=3
unzip -q cicada-${CICADA_BRANCH}.zip
rm cicada-${CICADA_BRANCH}.zip
mv cicada-${CICADA_BRANCH} Cicada
cp -r Scarab Cicada
mv Cicada Katydid/.
echo "Cicada is done!"

echo "Cleaning up Scarab..."
rm -rf Scarab



