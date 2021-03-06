#!/bin/bash

# It's assumed that you've already sourced the relevant setup.sh

########################################################################
#
# collect source distributions for all submodules
#
########################################################################

export SCARAB_BRANCH=216a11c7831817550201709514ba9fae126f1586 # v1.6.2
export NYMPH_BRANCH=aa5e18b449f9947c46bc26aa7c34052d85baeb90 # v1.4.6
export MONARCH_BRANCH=b8be9476936b43dd1bbf2c0d8c2b59d6da102121 # v3.5.3
export KATYDID_BRANCH=0e1e8badc0aa05cd266a42551124a4b277c415c8 # v2.14.0
export CICADA_BRANCH=9b3bf22244263e01701484186c3fb18f6ef26e67 # v1.2.1
export RAPIDJSON_BRANCH=5de06bfa37495b529dc00139f1b138a526fff27a
export YAMLCPP_BRANCH=3757b2023b71d183a341677feee693c71c2e0766

export SCARAB_URL=https://github.com/project8/scarab/archive/${SCARAB_BRANCH}.zip
export NYMPH_URL=https://github.com/project8/nymph/archive/${NYMPH_BRANCH}.zip
export MONARCH_URL=https://github.com/project8/monarch/archive/${MONARCH_BRANCH}.zip
export KATYDID_URL=https://github.com/project8/katydid/archive/${KATYDID_BRANCH}.zip
export CICADA_URL=https://github.com/project8/cicada/archive/${CICADA_BRANCH}.zip
export RAPIDJSON_URL=https://github.com/Tencent/rapidjson/archive/${RAPIDJSON_BRANCH}.zip
export YAMLCPP_URL=https://github.com/jbeder/yaml-cpp/archive/${YAMLCPP_BRANCH}.zip

# get into the parent directory for all the source code and build proucts
cd ${P8KATYDIDDIR}
mkdir -p ${P8KATYDIDDIR}/src
cd ${P8KATYDIDDIR}/src
pwd

# Because Git does not exist, we have to download manually all items and put them at the right place. 
# How annoying...
echo "Prepare Katydid"
wget -O katydid-${KATYDID_BRANCH}.zip ${KATYDID_URL} --output-file=wget_log.txt --tries=3
unzip -q katydid-${KATYDID_BRANCH}.zip
mv katydid-${KATYDID_BRANCH} ${P8KATYDIDDIR}/src/Katydid
mkdir -p ${P8KATYDIDDIR}/src/Katydid/Source/Time

echo "Prepare Scarab"
wget -O scarab-${SCARAB_BRANCH}.zip ${SCARAB_URL} --output-file=wget_log.txt --tries=3
unzip -q scarab-${SCARAB_BRANCH}.zip
mv scarab-${SCARAB_BRANCH} ${P8KATYDIDDIR}/src/Scarab
echo "Rapidjson for Scarab"
wget -O rapidjson-${RAPIDJSON_BRANCH}.zip ${RAPIDJSON_URL} --output-file=wget_log.txt --tries=3
unzip -q rapidjson-${RAPIDJSON_BRANCH}.zip
mv rapidjson-${RAPIDJSON_BRANCH} ${P8KATYDIDDIR}/src/rapidjson
mkdir -p ${P8KATYDIDDIR}/src/Scarab/library/param/codec/json
mv rapidjson ${P8KATYDIDDIR}/src/Scarab/library/param/codec/json
echo "yaml-cpp for Scarab"
wget -O yaml-cpp-${YAMLCPP_BRANCH}.zip ${YAMLCPP_URL} --output-file=wget_log.txt --tries=3
unzip -q yaml-cpp-${YAMLCPP_BRANCH}.zip
mv yaml-cpp-${YAMLCPP_BRANCH} ${P8KATYDIDDIR}/src/yaml-cpp
mkdir -p ${P8KATYDIDDIR}/src/Scarab/library/param/codec/yaml
mv yaml-cpp ${P8KATYDIDDIR}/src/Scarab/library/param/codec/yaml
echo "Scarab is ready!"

echo "Prepare Monarch"
wget -O monarch-${MONARCH_BRANCH}.zip ${MONARCH_URL} --output-file=wget_log.txt --tries=3
unzip -q monarch-${MONARCH_BRANCH}.zip
mv monarch-${MONARCH_BRANCH} ${P8KATYDIDDIR}/src/Monarch
cp -r Scarab ${P8KATYDIDDIR}/src/Monarch
mv Monarch ${P8KATYDIDDIR}/src/Katydid/Source/Time
echo "Monarch is done!"

echo "Prepare Nymph"
wget -O nymph-${NYMPH_BRANCH}.zip ${NYMPH_URL} --output-file=wget_log.txt --tries=3
unzip -q nymph-${NYMPH_BRANCH}.zip
mv nymph-${NYMPH_BRANCH} ${P8KATYDIDDIR}/src/Nymph
cp -r Scarab ${P8KATYDIDDIR}/src/Nymph
mv Nymph ${P8KATYDIDDIR}/src/Katydid
echo "Nymph is done!"

echo "Prepare Cicada"
wget -O cicada-${CICADA_BRANCH}.zip ${CICADA_URL} --output-file=wget_log.txt --tries=3
unzip -q cicada-${CICADA_BRANCH}.zip
mv cicada-${CICADA_BRANCH} ${P8KATYDIDDIR}/src/Cicada
cp -r Scarab ${P8KATYDIDDIR}/src/Cicada
mv Cicada ${P8KATYDIDDIR}/src/Katydid
echo "Cicada is done!"
