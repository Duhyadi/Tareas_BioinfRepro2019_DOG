#####

#### Transformation to .vcf

cd ../data


## Creación de carpetas

# recode plink to needed formats

plink --ped nuevos_final.ped --map nuevos_final.map --recode vcf*
