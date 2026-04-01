FROM ensemblorg/ensembl-vep:latest

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      bcftools \
      samtools \
      tabix

USER root

WORKDIR /home/ubuntu/workspace

ENTRYPOINT ["bash"]
