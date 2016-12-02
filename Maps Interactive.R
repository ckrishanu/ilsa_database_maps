# ------------------------------------------------------------------------------------
##################################### Meta ##########################################
# Country wise representation : ILSA Database (http://scholar.harvard.edu/alejandro_ganimian/datasets)
# Contributors: Krishanu Chakraborty
# 01 December November 2016
# Version of code : 1.0.0
# R version : R version 3.3.2 (Sincere Pumpkin Patch)
# Last edited by : Krishanu Chakraborty
# ------------------------------------------------------------------------------------
#install libraries
library(ggplot2)
library(googleVis)
library(plyr)
library(haven)

# Setting working directory
setwd("D:/R/Maps/ilsa_dataset.dta")

# download the file

download.file("http://scholar.harvard.edu/files/alejandro_ganimian/files/ilsa_dataset.dta_.zip", dest="dataset.zip", mode="wb")

# unzip into the present working directory
unzip ("dataset.zip", exdir = getwd())

# load the ilsa dataset

ilsa_dataset <- read_dta("ilsa_dataset.dta")

# using WB population data

Population$schoolsys <- Population$Country

# merging across country names. Please note that this merging is technically wrong

Mergedtable <- merge(Population, ilsa_dataset , by="schoolsys")

# generating and plotting interactive map

G <- gvisGeoChart(Mergedtable, locationvar = "Country", colorvar = "pisa_read_a15_m_2003")
plot(G)

# end
