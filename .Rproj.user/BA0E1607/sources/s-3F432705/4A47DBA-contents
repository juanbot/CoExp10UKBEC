
# Brief instructions for the package CoExp1oUKBEC.

Braineac is a project you can access from here <http://braineac.org/> for microarray based gene expression and eQTL in 10 brain regions and also here <http://braineacv2.inf.um.es/> for the study of two regions, substantia nigra and putamen, with RNA-seq based transcriptomics. It includes transcriptomics from more than 600 samples. Using the package <https://github.org/CoExpNets> we created 10 co-expression networks for the micrarray profiling.

# Introduction

This package can be used through the `CoExpNets` package to access and analyze these networks and to create new ones. 

In the package you will find networks for the following tissues
```r
library(CoExpNets)
library(CoExp10UKBEC)
CoExpUKBEC::initDb()
getAvailableNetworks()
```

Each network is compound of
* An RDS file with the network itself. When reading the object you obtain a list with `moduleColors` and `MEs`, the clustering of nodes and the module eigengenes respectively.
* A csv with the enrichment for the modules from the Gene Ontology, REACTOME and KEGG pathway annotation databases.
* The residuals (corrected by PMI, Age, Gender and Batch, with ComBat) and Surrogate variables with SVA.

## Install the development version from GitHub:

Recommended that you install first CoExpNets
```r
devtools::install_github('juanbot/CoExpNets')
```
And then this package

```r
devtools::install_github('juanbot/CoExp10UKBEC')
```
