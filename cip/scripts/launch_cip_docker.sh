#!/bin/sh

OUTPUT_DIR=/home/$NB_USER/cip/outputs/

[ -d "${OUTPUT_DIR}" ] || mkdir ${OUTPUT_DIR}

sudo docker rm -f cip-docker
echo "docker launched"
sudo docker run -it \
    --name cip-docker \
    -v /home/efs/:/host/ \
    -v /home/$NB_USER/cip/scripts/:/scripts/ \
    -v ${OUTPUT_DIR}:/outputs/ \
    -e PYTHONUNBUFFERED="1" \
    -d \
    acilbwh/chestimagingplatform
