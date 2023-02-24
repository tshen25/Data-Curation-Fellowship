library(tidyverse)
library(stringr)
library(treemap)
source("/Users/adamchazan/Documents/R Stuff/silver_chips_v3.R")

# Load data
tweets <-
  read_csv(
    "/Users/adamchazan/Documents/School/2022-2023/Spring 2023/SOCIAL DATA SCIENCE/vaccination_all_tweets.csv"
  )

# Pull hashtags from text and override hashtags column
hashtag_pat <- "#[a-zA-Z0-9_-ー\\.]+"
tweets$hashtags <- str_extract_all(tweets$text, hashtag_pat)

# Select relevant columns and filter out tweets with no hashtags
tweets <-
  select(
    tweets,
    c(
      "user_name",
      "user_followers",
      "date",
      "user_friends",
      "retweets",
      "favorites",
      "hashtags"
    )
  ) %>% filter(hashtags != "character(0)") %>% unnest(hashtags)

# Standardize hashtags
tweets$hashtags <- tolower(tweets$hashtags)
tweets$hashtags <- gsub("[[:punct:]ー]", "", tweets$hashtags)

# averaged_df <- group_by(tweets, hashtags) %>% summarize(mean = mean(retweets))

# Select the 50 most frequent hashtags
hashtag_count <- table(tweets$hashtags)
hashtag_df <- data.frame(hashtag_count)
hashtag_df <- arrange(hashtag_df, desc(Freq))
hashtag_df <- head(hashtag_df, 50)

treemap <- treemap(
  hashtag_df,
  index = "Var1",
  vSize = "Freq",
  type = "manual",
  palette = "Blues",
  border.col = c("white")
  
)

# Look at data from a single hashtag
single_hashtag_count <-
  filter(tweets, hashtags == "pfizer") %>% mutate(date = as.Date(date, format = "%m/%d/%y")) %>% group_by(date) %>% count(date)

# Create a time series of tweets using the hashtag
time_series <- ggplot(single_hashtag_count, aes(x = date, y = n)) +
  geom_col(fill = "#1DA1F2") +
  # geom_smooth(color = "#657786", size = 2, se = FALSE, method = "gam", formula = y ~ s(log(x))) +
  theme_silver_chips_minimal() +
  theme(plot.background = element_rect(fill = 'white', color = NA_character_)) +
  labs(
    x = NULL,
    y = NULL,
    title = "Daily count of tweets using the #pfizer",
    subtitle = NULL
  )

time_series

# Save plots
ggsave(
  filename = "pfizer_tweets.png",
  plot = time_series,
  width = 9,
  height = 5.5,
  units = "in",
  dpi = 300
)
ggsave(
  filename = "hashtags_treemap.png",
  plot = treemap,
  width = 9,
  height = 5.5,
  units = "in",
  dpi = 300
)
