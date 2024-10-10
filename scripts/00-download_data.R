#### Preamble ####
# Purpose: 
# Author: 
# Date: 
# Contact: 
# License: MIT


#### Workspace setup ###

# install.packages("devtools")
# devtools::install_github('charlie86/spotifyr', force = TRUE)
# install.packages("here")

library(spotifyr)
library(usethis)
library(here)

edit_r_environ()

#### Download data ####

radiohead <- get_artist_audio_features("radiohead")
taylor_swift <- get_artist_audio_features("06HL4z0CvFAxyc27GXpf02")
the_national <- get_artist_audio_features("the national")


#### Save data ####

saveRDS(radiohead, "C:/UofT 2022/STA304/TP1/spotify_api/data/00-raw_data/radiohead.rds")
saveRDS(taylor_swift, "taylor_swift.rds")
saveRDS(the_national, "C:/UofT 2022/STA304/TP1/spotify_api/data/00-raw_data/the_national.rds")
