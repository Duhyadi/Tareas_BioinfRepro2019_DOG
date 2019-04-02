#### Plot structure

## Libraries
library(ggplot2)

## Load genetic data file
setwd("/home/duhyadi/Desktop/Proyecto_alelos_deletereos/SIFT4_Results")
datos <- read.csv(file = "nuevos_final26mar_SIFT.csv", header = TRUE, sep = ",")

# PLot for VARIANT_TYPE

g <- ggplot(data = datos, aes(CHROM))
g + geom_bar(aes(fill= VARIANT_TYPE), width = 0.5) +
  theme(axis.text.x = element_text(angle=0, vjust=0.6)) +
  labs(title="Histogram on on CHROMO ",
       subtitle="VARIANT TYPE")

# PLot for SIFT_PREDICTION

g + geom_bar(aes(fill=SIFT_PREDICTION), width = 0.5) +
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
  labs(title="Histogramon on CHROMO",
       subtitle="SIFT_PPREDICTION") 
