#### Preamble ####
# Purpose: Download data about The Chainsmokers from Spotify API and save it as .rds
# Author: Jerry Xia
# Date: 10 October 2024
# Contact: Jerry.xia@mail.utoronto.ca
# License: MIT
# Pre-requisites: Spotify API access and credentials, '00-setup.R' executed
# Any other information needed? 

#### Download Chainsmokers Data ####
# Use the spotifyr package to download data about The Chainsmokers
# use Spotify artist ID to retrieve the data

chainsmokers_data <- get_artist_audio_features('the chainsmokers')

# Save the raw data
saveRDS(chainsmokers_data, file = here("data", "raw_data", "chainsmokers.rds"))

# Confirm that the data has been saved
print("Raw data has been saved to data/raw_data/chainsmokers.rds")
