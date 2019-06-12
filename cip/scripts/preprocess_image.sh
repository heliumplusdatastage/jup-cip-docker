#!/bin/bash

set -e

DIR=/home/playground
DATA_DIR=/host
NUM=$1

[ -d "${DIR}" ] && rm -r ${DIR}
mkdir ${DIR}

cd ${DATA_DIR}
for file in $(ls | head -$NUM)
do
    cp $file ${DIR}
done
cd ${DIR}

ConvertDicom --dir ${DIR} -o output_file.nrrd

GenerateMedianFilteredImage -i output_file.nrrd -o filtered_ct.nrrd