FROM ppc64le/debian:latest

MAINTAINER Olga Botvinnik <olga.botvinnik@czbiohub.org>

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libgomp1 libxext6 libsm6 libxrender1 \
    git mercurial subversion

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-4.3.14-Linux-ppc64le.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh

ENV PATH /opt/conda/bin:$PATH

CMD [ "/bin/bash" ]

# FROM czbiohub/miniconda3
LABEL authors="olga.botvinnik@czbiohub.org" \
      description="Docker image containing base requirements for the nfcore pipelines"

# Install procps so that Nextflow can poll CPU usage
RUN apt-get update && apt-get install -y procps && apt-get clean -y
RUN conda install conda=4.3.27

RUN conda install -c BioBuilds bedtools
RUN echo $PATH
RUN wget https://github.com/shenwei356/csvtk/files/3438197/csvtk-ppc64le.gz 
RUN gunzip csvtk-ppc64le.gz
RUN chmod ugo+x csvtk-ppc64le && \
    mv csvtk-ppc64le /usr/bin/csvtk && \
    which -a csvtk

RUN conda install --yes pandas

RUN conda install --yes -c biobuilds samtools
RUN apt-get -y upgrade && apt-get -y install r-base r-base-dev
