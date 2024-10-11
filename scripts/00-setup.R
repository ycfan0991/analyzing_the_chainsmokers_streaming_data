#### Preamble ####
# Purpose: Set up the workspace for the project, including library loading and API credentials.
# Author: Jerry Xia
# Date: 10 October 2024
# Contact: Jerry.xia@mail.utoronto.ca
# License: MIT
# Pre-requisites: Spotify Developer Account with valid Client ID and Client Secret, saved to '.Renviron'
# Any other information needed? Ensure access to Spotify API and necessary packages installed

#### Workspace setup ####
# Load required libraries
# install.packages("spotifyr")
library(here)
library(readr)
library(dplyr)
library(usethis)
library(magrittr)
library(spotifyr)
library(tidyverse)
library(lubridate)
library(kableExtra)

#### Set up API credentials ####
# Ensure your Spotify Client ID and Secret are stored in your .Renviron file
# You can open the .Renviron file with usethis and add credentials if not already done

# Spotify Client ID and Secret should be stored in .Renviron
Sys.setenv(SPOTIFY_CLIENT_ID = Sys.getenv("SPOTIFY_CLIENT_ID"))
Sys.setenv(SPOTIFY_CLIENT_SECRET = Sys.getenv("SPOTIFY_CLIENT_SECRET"))

#### Test Spotify API connection ####
access_token <- get_spotify_access_token()
print(access_token)  # You should see access token 