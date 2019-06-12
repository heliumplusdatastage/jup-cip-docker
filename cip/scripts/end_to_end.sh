DIR=/home/playground
DATA_DIR=/host

[ -d "${DIR}" ] && rm -r ${DIR}
mkdir ${DIR}
cd ${DIR}

SID=$1

ConvertDicom --dir ${DATA_DIR} -o ctfile.nrrd


python /ChestImagingPlatform/cip_python/dcnn/lung_segmenter_dcnn.py \
    --i ctfile.nrrd \
    --t combined \
    --o partialLungLabelMapDNN.nrrd


/scripts/local_histogram_pipeline.sh -i ctfile.nrrd -m partialLungLabelMapDNN.nrrd

mv ctfile_parenchymaPhenotypes.csv /outputs/ctfile_parenchymaPhenotypes_${SID}.csv
