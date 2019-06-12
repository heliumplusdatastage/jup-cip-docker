######### Dockerfile He+ Chest Imaging Platform Notebook with read-write ###########
FROM jupyter/minimal-notebook:latest

ENV NB_USER=$NB_USER \
    NB_UID=$NB_UID

WORKDIR /home/$NB_USER

COPY cip /home/$NB_USER/cip
COPY requirements.txt /tmp/

USER root

RUN chmod -R 777 /home/$NB_USER/cip/

RUN conda install --quiet --yes \
    'tensorflow=1.13*' \
    'keras=2.2*' && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
RUN conda install --yes --file /tmp/requirements.txt && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
RUN apt-get update && apt-get -y install \
  docker.io 

WORKDIR /home/$NB_USER/cip 

RUN mkdir /home/$NB_USER/efs

VOLUME ['/home/$NB_USER/efs']

EXPOSE 8888

