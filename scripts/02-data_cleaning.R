library(tidyverse)
library(ggplot2)
library(dplyr)

the_chainsmokers <- readRDS(here("data/00-raw_data/the_chainsmokers.rds"))
the_chainsmokers <- as_tibble(the_chainsmokers)

the_chainsmokers |>
  mutate(album_release_date = ymd(album_release_date)) |>
  ggplot(aes(
    x = album_release_date,
    y = duration_ms,
    group = album_release_date
  )) +
  geom_boxplot() +
  geom_jitter(alpha = 0.5, width = 0.3, height = 0) +
  theme_minimal() +
  labs(
    x = "Album release date",
    y = "Duration of song (ms)"
  )

audio_features <- c('danceability', 'energy', 'speechiness', 'acousticness', 
                    'instrumentalness', 'liveness', 'valence')
album_comparison <- the_chainsmokers %>%
  group_by(album_name) %>%
  summarise(across(all_of(audio_features), mean, na.rm = TRUE))
album_comparison_long <- tidyr::pivot_longer(album_comparison, 
                                             cols = audio_features, 
                                             names_to = "feature", 
                                             values_to = "mean_value")
ggplot(album_comparison_long, aes(x = album_name, y = mean_value, fill = feature)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Album Name", y = "Mean Value", 
       title = "Comparison of Audio Features by Album (Excluding Loudness and Tempo)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  theme_minimal()
