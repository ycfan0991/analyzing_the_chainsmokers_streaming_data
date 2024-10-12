#### Preamble ####
# Purpose: Clean the downloaded data for The Chainsmokers
# Author: Jerry Xia
# Date: 10 October 2024
# Contact: Jerry.xia@mail.utoronto.ca
# License: MIT
# Pre-requisites: 'chainsmokers.rds' saved in 'data/raw_data'

#### Load Raw Data ####
raw_data <- readRDS(here("data", "raw_data", "chainsmokers.rds"))

#### Clean Data ####
cleaned_data <- raw_data %>%
  mutate(album_release_date = ymd(album_release_date)) %>%
  select(album_name, album_release_date, danceability, energy, acousticness, valence, speechiness, tempo) %>%
  filter(!is.na(album_release_date))

# Save the cleaned data
saveRDS(cleaned_data, file = here("data", "analysis_data", "clean_chainsmokers_data.rds"))

# Confirm that the data has been saved
print("Cleaned data saved to 'data/analysis_data/clean_chainsmokers_data.rds'")
