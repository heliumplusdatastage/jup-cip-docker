#!/bin/bash

set -e

DIR=/home/playground

cd ${DIR}

python /ChestImagingPlatform/cip_python/dcnn/lung_segmenter_dcnn.py \
    --i filtered_ct.nrrd \
    --t combined \
    --o partialLungLabelMapDNN.nrrd

python /ChestImagingPlatform/cip_python/phenotypes/parenchyma_phenotypes.py \
    --in_ct filtered_ct.nrrd \
    --in_lm partialLungLabelMapDNN.nrrd \
    --cid 1 \
    -r WholeLung \
    --out_csv parechyma_phenotypes_file_DNN.csv
    
mv parechyma_phenotypes_file_DNN.csv /outputs/

/scripts/local_histogram_pipeline.sh -i filtered_ct.nrrd -m partialLungLabelMapDNN.nrrd
mv filtered_ct_parenchymaPhenotypes.csv /outputs/filtered_ct_parenchymaPhenotypesDNN.csv