library(dplyr)
library(readr)


# This example code assumes that we want to standardize the country names in 
# the "Location" field of age_dist_data to match the names in the "country_name"
# field of wmd_data

age_dist_data <- read_csv("downloaded_data/age-dist-2021-07-16.csv")

wmd_data <- read_csv("downloaded_data/wmd-2021-07-15.csv")

lonely_countries <- wmd_data %>% 
  anti_join(age_dist_data, by = c(country_name = "Location")) %>% 
  pull(country_name) %>% 
  unique()

print(lonely_countries)

# Then I would do `View(age_dist_data)` and use the "Filter" option in the 
# viewer to manually search for each lonely country
View(age_dist_data)


# Then based on what I find in age_dist_data, create this key (I have to use 
# backticks surrounding the names if they include spaces):
country_name_key <- c(
  # couldn't find Andorra
  `Bolivia (Plurinational State of)` = "Bolivia",
  `Bosnia and Herzegovina` = "Bosnia",
  # couldn't find Gibraltar, Greenland
  `China, Hong Kong SAR` = "Hong Kong"
  # etc., 
  # etc.
)

# Then you can use the key to rename the countries in age_dist_data
age_dist_data <- age_dist_data %>% 
  mutate(
    country_name = if_else(
      Location %in% names(country_name_key),
      country_name_key[Location],
      Location
    )
  )

# This shows the before and after of the countries we renamed:
age_dist_data %>% 
  filter(Location %in% names(country_name_key)) %>% 
  distinct(Location, country_name)
