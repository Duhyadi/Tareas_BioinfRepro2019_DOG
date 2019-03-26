# README of "Identification of deleterious alleles in landraces of maize and his wild relative"

This README explains the origin
of the data and the comparative methodology
to follow for the identification
of deleterious alleles.

## Mak directories

To organize the project,
the following directories will be created
mkdir -p ./{data,scripts,analysis}

You will have a README to data, scripts
and analysis

## Origin of the data

### Maize

+ The data for the maize were obtained
in the data and meta repository of
Arteaga et al. (2016):

Arteaga MC, Moreno-Letelier A, Mastretta-Yanes A,
Vázquez-Lobo A, Breña-Ochoa A, Moreno-Estrada A,
Eguiarte LE, Piñero D (2015) Data from: Genomic variation
in recently collected maize landraces from Mexico.
Dryad Digital Repository. https://doi.org/10.5061/dryad.4t20n

+ The genetic data were obtained from the data / SNPs folder.
The characteristics of genotype call and processing in plink
are specified in the filenew_final_README.md

### Teosinte

+ The data for teosinte were obtained
from Aguirre-Liguori et al. (2017)
in the file SNPdata_Aguirre_Liguori_etal.txt:

Aguirre-Liguori J, Tenaillon M, Vázquez-Lobo A,
Gaut B, Jaramillo-Correa J, Montes-Hernandez S,
Souza V, Eguiarte L (2017) Data from: Connecting genomic
patterns of local adaptation and niche suitability in teosintes.
Dryad Digital Repository. https://doi.org/10.5061/dryad.tf556

+ The characteristics of genotype call and processing
in plink are specified in the paper.

## Analysis of deleterious alleles

SIFT (Mezmouk and Jeffrey Ross-Ibarra,2013)
and PROVEAN (Ferchuad et al.2018) will be used
to identify deleter alleles,
which may use data from GBS.

### SIFT

SIF will be used (Ng et al. 2003) and SIFT 4G,
algorithm is a GPU-optimized version of SIFT
that allows us to obtain SIFT predictions
quickly and to construct prediction databases
for a large number of organisms (Vasser et al. 2015).


Input file: vcf

#### Input and transformation of Arteaga data "Transformation to .vcf"

+ For the transformation to vcf files were used .ped (contains the SNPs) and .map (location of the SNPs) in PLINK v1.90b6.9.
+ Transformation to vcf was tried in different ways, being plink v1.90b6.9. the easiest way.
+ *Pgdspider 2.1.1.5* : the .ped and .map files were integrated in addition to expanding the
 memory to a maximum of -Xmx2048m by following the instructions in the manual: java -Xmx1024m -Xms512M -jar. However, the transformation never took place. The software never finished running.
+ *Python* : The git hub instructions were followed (https://github.com/chapmanb/bcbb/blob/master/nextgen/scripts/plink_to_vcf.py) However, libraries were needed.
+ *PLINK v1.90b6.9* : the command used was **./plink --ped nuevos_final.ped --map nuevos_final.map --recode vcf**. It is important to mention that this command does not work in versions 1.7 and 2.


#### Input and transformation of Aguirre-Liguori data
+ For teosinte: first convert txt to ped and map in R. Then to vcf in in PLINK  v1.90b6.9

**At the moment there is only the vcf file for the Arteaga data, the Aguirre-Liguori data have not yet been converted**

### PROVEAN
Translated codon
genotypes to amino acid
genotypes using the R package Biostrings
and the use PROVEAN (Cont et al. 2017)

#### Note

At the moment the type of input data is not specified.
