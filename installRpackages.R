install.packages(c(
"shiny",
"shinyjs",
"gamlss",
"rhandsontable",
"tidyverse",
"reshape2",
"gridExtra",
"pastecs",
"knitr"),
repos="https://cran.ma.imperial.ac.uk/",quiet=TRUE)
install.packages("devtools")
require(devtools)
install_version("RcmdrMisc", version="2.5-0", repos="https://cloud.r-project.org")
