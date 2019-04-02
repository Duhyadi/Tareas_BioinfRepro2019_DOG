# README of "Identification of deleterious alleles in landraces of maize"

Contains data, scripts and figures  for la identification of deleterious alleles in landraces of maize


### `/Data/`

Contains the data obtained from Dryad and the data transformed to vcf.Genetic data were obtained from the repository: https://datadryad.org/resource/doi:10.5061/dryad.n3jk5

The files contained in this folder are described below:

* `Nuevos_final.map` .- This is the map file obtained from the repository.
* `Nuevos_final.ped` .- This is the ped file obtained from the repository.
* `nuevos_final26mar.vcf` .- This is the file resulting from the combination of the previous files using plink v1.90b6.9

### `/Bin/`

The scripts in `/bin/` should be run in the order they are numbered.

Scripts content:

* `1.Transformation_to_vcf.sh`.- transformation of ped and map files to vcf.
* `2.SIF_Prediction.sh`.- to run the SIFT 4G annotator.
* `3.Plot_class.R`.- plots SIFT Predictions results.

### `/Figures/`

Figures content:

* `SIFT_Prediction.png`.- in this graph we can see the prediction made by SIFT 4. Which includes: tolerated, deleterious, and deleterious with low confidence.
* `Variant_type.png`.- in this graph we can see the type of variant identified by SIFT 4. Which includes:stop-gain, synonymous, nonsynonymous and nonconding. 


## Summary and discussion




#### Notes

#####  SIFT

SIFT 4G algorithm is a GPU-optimized version of SIFT (Ng et al. 2003) that allows us to obtain SIFT predictions quickly and to construct prediction databases for a large number of organisms (Vasser et al. 2015).

#####  PLINK

It is important to mention that the command used in plink does not run in the versions 1.7 and 2.
