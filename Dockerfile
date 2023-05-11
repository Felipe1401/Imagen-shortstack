################# BASE IMAGE #####################
FROM continuumio/miniconda3:4.10.3

################## METADATA #######################
LABEL base_image="continuumio/miniconda3"
LABEL version="4.0.1"
LABEL software="shortstack"
LABEL software.version="1"
LABEL about.summary="Container image containing all requirements for SALSA"
LABEL about.home="https://github.com/Felipe1401/"
LABEL about.documentation="https://github.com/Felipe1401/Imagen-shortstack/README.md"
LABEL about.license_file="https://github.com/Felipe1401/Imagen-shortstack/LICENSE.txt"
LABEL about.license="GNU-3.0"

################## MAINTAINER ######################
MAINTAINER Felipe Gómez <feliubkn@gmail.com>
################## INSTALLATION ######################
#RUN conda create --name ShortStack4 shortstack 
#RUN conda activate ShortStack4

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p /miniconda
ENV PATH /miniconda/bin:$PATH

COPY environment-Imagen-Shortstack.yml /
RUN conda env create -n shortstack -f /environment-Imagen-Shortstack.yml && conda clean -a
ENV PATH /miniconda/envs/shortstack/bin:$PATH



#RUN apt-get update && apt-get install -y git build-essential libboost-all-dev python2.7
#RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
#RUN python2.7 get-pip.py
#RUN pip2 install networkx
#RUN mkdir /opt/salsa 
#RUN cd /opt/salsa/ && git clone https://github.com/marbl/SALSA.git && cd SALSA && make
#RUN ln -s /opt/salsa/SALSA/run_pipeline.py /opt/salsa/SALSA/salsa
#ENV PATH /opt/salsa/SALSA/:$PATH

###
