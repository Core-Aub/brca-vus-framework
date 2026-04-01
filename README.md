# An Equity-Driven Framework for BRCA1/2 Variant Interpretation in Data-Limited Populations: Integrating Global Supervised Learning with Population-Aware Anomaly Detection

## Usage

- The `Dockerfile` provided can be used to quickly setup a linux container that contains the VEP tool along with a few other tools used for indexing like bcftools.
- Then the annotation script `annotate_full.sh` can be used on your local VCF files to annotate them with VEP along with `dbNSFP` plugin. Note that you still need to install the `FASTA` genome file: `Homo_sapiens.GRCh37.dna.primary_assembly.fa.gz`, and the `dbNSFP` plugin file: `dbNSFP4.9a_grch37.gz`.
- The BRCA Exchange VCF files do not need to be annotated as they are already annotated with the features we need.

- Once the annotation script concludes you are left with annotated VCF files that you can process with the provided processing notebooks. Note that VCF files from BRCA Exchange have a different format from the ones we annotated with VEP so each one of them has its own processing script. 

- The processing notebooks will generate multiple `csv` files in `.txt` format which are then loaded in the `model.ipynb` file where the model training/inference will take place.