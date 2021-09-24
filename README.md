# Building a dataset of confounders for analysis of excess mortality

This repository contains R code to download country-level data on confounders 
to be used in analysis of excess mortality during the COVID19 pandemic.

The file "countrylist.csv" lists the countries to be included in our analysis.

The folder "scripts_that_download_data" contains RMarkdown files with code to 
download the following data:

* Age distribution (from World Population Prospects)
* Annual GDP per capita growth (from the World Bank)
* Gini index (World Bank)
* Life expectancy (World Bank)
* Maternal mortality (World Bank)
* Percent of population living on less than $1.90 per day (World Bank)
* Under 5 mortality (World Bank)
* All cause mortality data (from the World Mortality Dataset)

Each of those scripts, when knit and rendered (using either the "Knit" button in
RStudio, or `rmarkdown::render("path/to/script")` in the Console), downloads and 
saves a .csv dataset to the folder "downloaded_data".

The folder "scripts_to_manipulate_data" contains the beginnings of an RMarkdown
file that will eventually build a country-level dataset of confounders. The 
"archived" subfolder contains some exploratory RMarkdown scripts that may no 
longer be useful.
