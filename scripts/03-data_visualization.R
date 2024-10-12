#### Preamble ####
# Purpose: Visualize key features of The Chainsmokers' data for analysis
# Author: Jerry Xia
# Date: 10 October 2024
# Contact: Jerry.xia@mail.utoronto.ca
# License: MIT
# Pre-requisites: 'clean_chainsmokers_data.rds' saved in 'data/analysis_data'

#### Load Cleaned Data ####
clean_data <- readRDS(here("data", "analysis_data", "clean_chainsmokers_data.rds"))

#### Visualizations ####

# 1. Energy Over Time
energy_plot <- clean_data %>%
  ggplot(aes(x = album_release_date, y = energy, color = album_name)) +
  geom_line(stat = "summary", fun = "mean", size = 1.2) +
  geom_point(alpha = 0.5) +
  theme_minimal() +
  labs(
    x = "Album Release Date",
    y = "Energy",
    color = "Album"
  ) +
  theme(legend.position = "bottom")

ggsave(here("other", "figures", "energy_plot.png"), plot = energy_plot)

# 2. Valence Over Time
valence_plot <- clean_data %>%
  ggplot(aes(x = album_release_date, y = valence, color = album_name)) +
  geom_line(stat = "summary", fun = "mean", size = 1.2) +
  geom_point(alpha = 0.5) +
  theme_minimal() +
  labs(
    x = "Album Release Date",
    y = "Valence",
    color = "Album"
  ) +
  theme(legend.position = "bottom")

ggsave(here("other", "figures", "valence_plot.png"), plot = valence_plot)

# 3. Danceability vs. Acousticness Over Time
dance_acoustic_plot <- clean_data %>%
  ggplot(aes(x = album_release_date)) +
  geom_line(aes(y = danceability, color = "Danceability"), stat = "summary", fun = "mean", size = 1.2) +
  geom_line(aes(y = acousticness, color = "Acousticness"), stat = "summary", fun = "mean", size = 1.2) +
  theme_minimal() +
  labs(
    x = "Album Release Date",
    y = "Score",
    color = "Feature"
  ) +
  theme(legend.position = "bottom")

ggsave(here("other", "figures", "dance_acoustic_plot.png"), plot = dance_acoustic_plot)

# Confirm that figures have been saved
print("Energy, Valence, and Danceability vs Acousticness plots saved to 'other/figures'")
