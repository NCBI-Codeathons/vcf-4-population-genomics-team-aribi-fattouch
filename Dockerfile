FROM szabogtamas/jupy_rocker

RUN sudo apt-get update -y && \
    sudo apt-get install -y libxml2-dev && \
    sudo apt-get install -y libxt-dev && \
    sudo apt-get install -y libx11-dev && \
    sudo apt-get install -y libz-dev && \
    sudo apt-get install -y libbz2-dev && \
    sudo apt-get install -y liblzma-dev && \
    sudo apt-get install -y zlib1g-dev && \
    sudo apt-get install -y libglpk-dev && \
    sudo apt-get install -y libcairo2-dev

RUN pip3 install jupytext && \
    pip3 install numpy && \
    pip3 install pandas && \
    pip3 install matplotlib && \
    pip3 install seaborn

RUN install2.r --error \
    --deps TRUE \
    devtools \
    readxl \
    openxlsx \
    RColorBrewer \
    ggsci \
    ggridges \
    plotly \
    heatmaply \
    pheatmap \
    ggplotify \
    GGally \
    vcfR \
    covid19.analytics

RUN mkdir -p /usr/ncbi/packages && \
    cd /usr/ncbi/packages && \
    wget http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.4.1/sratoolkit.2.4.1-ubuntu64.tar.gz && \
    tar -xzvf sratoolkit.2.4.1-ubuntu64.tar.gz && \
    cd

RUN R -e "BiocManager::install('EnsDb.Hsapiens.v86')"
RUN R -e "BiocManager::install('GenomicFeatures')"
RUN R -e "BiocManager::install('AnnotationHub')"
RUN R -e "BiocManager::install('Gviz')"
# RUN R -e "remotes::install_github('ivanek/Gviz')"

RUN chmod a+rwx -R /home/rstudio

EXPOSE 8050

ENV PATH=/usr/local/bin:$PATH:/directory/sratoolkit.2.4.1-ubuntu64/bin
