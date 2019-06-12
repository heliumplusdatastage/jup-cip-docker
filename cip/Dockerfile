FROM acilbwh/chestimagingplatform:latest

RUN wget https://s3.amazonaws.com/acil-deep-learning-data/models/lung_segmentation/lung_segmentation_axial.hdf5 \
    -P /ChestImagingPlatform-build/CIP-build/cip_python/dcnn/dcnn_models_cache/lung_segmentation/
    
RUN wget https://s3.amazonaws.com/acil-deep-learning-data/models/lung_segmentation/lung_segmentation_coronal.hdf5 \
    -P /ChestImagingPlatform-build/CIP-build/cip_python/dcnn/dcnn_models_cache/lung_segmentation/