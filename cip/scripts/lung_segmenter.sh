#!/bin/bash

set -e

DIR=/home/playground

cd ${DIR}

GeneratePartialLungLabelMap --ict filtered_ct.nrrd -o partialLungLabelMap.nrrd

python /ChestImagingPlatform/cip_python/phenotypes/parenchyma_phenotypes.py \
    --in_ct filtered_ct.nrrd \
    --in_lm partialLungLabelMap.nrrd \
    --cid 1 \
    -r WholeLung \
    --out_csv parechyma_phenotypes_file.csv
    
mv parechyma_phenotypes_file.csv /outputs/

/scripts/local_histogram_pipeline.sh -i filtered_ct.nrrd -m partialLungLabelMap.nrrd
mv filtered_ct_parenchymaPhenotypes.csv /outputs/filtered_ct_parenchymaPhenotypes.csv