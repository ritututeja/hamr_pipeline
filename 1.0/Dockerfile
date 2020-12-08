FROM ubuntu:18.04 
RUN apt-get update --fix-missing && \ 
DEBIAN_FRONTEND="noninteractive" apt-get install -y python \ 
                                                    git \ 
                                                    r-base \ 
                                                    tzdata \ 
                                                    wget \ 
                                                    libcurl4-openssl-dev \ 
                                                    bedtools 
COPY HAMR . 
RUN git clone https://github.com/samtools/htslib.git 
WORKDIR htslib 
RUN autoheader 
RUN autoconf 
RUN ./configure --prefix=/usr/bin 
RUN make 
RUN make install 
WORKDIR / 
ENV PATH="/htslib:${PATH}"   
RUN wget https://github.com/samtools/samtools/releases/download/1.10/samtools-1.10.tar.bz2 
RUN tar -xvjf samtools-1.10.tar.bz2 
WORKDIR samtools-1.10 
RUN ./configure --prefix=/usr/bin 
RUN make 
RUN make install  
ENV PATH="/samtools-1.10:/HAMR:${PATH}" 
WORKDIR /
ENTRYPOINT ["python","/HAMR/hamr.py"]
