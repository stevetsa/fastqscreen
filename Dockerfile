#### 
# https://www.bioinformatics.babraham.ac.uk/projects/download.html#fastqscreen
# FastQ Screen A screening application for high througput sequence data
# Test data - https://www.bioinformatics.babraham.ac.uk/projects/fastq_screen/fastq_screen_test_dataset.tar.gz
####

FROM ubuntu:16.04
MAINTAINER Steve Tsang <mylagimail2004@yahoo.com>
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install --yes \
 build-essential \
 gcc-multilib \
 apt-utils \
 git-all \
 perl \ 
 unzip \
 wget

WORKDIR /opt/
RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastq_screen/fastq_screen_v0.12.0.tar.gz
RUN tar xvzf fastq_screen_v0.12.0.tar.gz
RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastq_screen/fastq_screen_test_dataset.tar.gz
RUN tar xvzf fastq_screen_test_dataset.tar.gz
RUN wget https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.3.4.1/bowtie2-2.3.4.1-linux-x86_64.zip
RUN unzip bowtie2-2.3.4.1-linux-x86_64.zip 
RUN cp /opt/fastq_screen_v0.12.0/* /usr/local/bin
RUN cp /opt/bowtie2-2.3.4.1-linux-x86_64/bowtie* /usr/local/bin

RUN apt-get install libgd-perl
RUN perl -MCPAN -e 'install GD::Graph'

