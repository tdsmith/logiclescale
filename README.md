# Logicle scale for ggplot2

This is a thin wrapper around the flowCore functions for logicle scaling that's suitable for use with ggplot2.

To use:

1. Make sure you have devtools installed: `install.packages("devtools")`
1. Make sure you have Bioconductor and flowCore installed: `source("https://bioconductor.org/biocLite.R"); biocLite("flowCore")`
1. Install this package: `devtools::install_github("tdsmith/logiclescale")`
1. Plot like: `ggplot(my_data, aes(CD4)) + geom_density() + scale_x_continuous(trans=logiclescale::logicle_trans())`

You can pass w, t, and m arguments to `logicle_trans` to configure the transformation; see `?flowCore::logicletGml2` for more information.
