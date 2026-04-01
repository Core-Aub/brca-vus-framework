#!/usr/bin/env bash
set -euo pipefail

VEP_CACHE=/root/vep_cache
VEP_PLUGINS=/root/vep_cache/Plugins
DBNSFP_FILE=$VEP_PLUGINS/dbNSFP4.9a_grch37.gz
FASTA=$VEP_CACHE/homo_sapiens/114_GRCh37/Homo_sapiens.GRCh37.dna.primary_assembly.fa.gz

mkdir -p annotated_vcf_files

for in_vcf in files/*.vcf files/*.vcf.gz; do
  [ -e "$in_vcf" ] || continue
  base=$(basename "$in_vcf")
  name="${base%.vcf}"
  name="${name%.vcf.gz}"
  out_vcf="annotated_vcf_files/${name}.full.vcf"

  vep \
    --format vcf \
    --assembly GRCh37 \
    --cache \
    --canonical \
    --dir_cache "$VEP_CACHE" \
    --dir_plugins "$VEP_PLUGINS" \
    --fasta "$FASTA" \
    --offline \
    --fork 4 \
    --pick \
    --vcf \
    --plugin dbNSFP,$DBNSFP_FILE,ALL \
    --input_file "$in_vcf" \
    --output_file "$out_vcf"
done
