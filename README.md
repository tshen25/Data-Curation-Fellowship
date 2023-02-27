# Data-Curation-Fellowship
### Summary:
Dataset published by Kaggle user Gabriel Preda. Collection using the Python package Tweepy on COVID-19 Vaccine related tweets from 2020. The dataset was updated daily (twice a day) up until January 2022. The initial dataset only scraped tweets relating to the Pfizer/BioNTech vaccine. The dataset was later updated to include tweets relating to additional vaccines such as Sinopharm, Sinovac, Moderna, Oxford/AstraZeneca, Covaxin, and Sputnik V vaccines.

Source: https://www.kaggle.com/datasets/gpreda/all-covid19-vaccines-tweets


### Basic Descriptive Statistics:
N - 1825890
Average retweets - 2.49
Average favorites - 10.82


### Metadata:
Author: Gabriel Preda
Contributors: Tom Whelan, Amartya Nambiar
Sources: Twitter
Collection Methodology: Automatic Collection from Twitter


### Types of Projects and further questions:
Similarity model visualizing discourse surrounding vaccination

Combining dataset with location based analysis
Does tweet frequency and geography have any relationship with other factors like political orientation, socioeconomic status, etc.?
Using sentiment analysis, are there some places that tweet exceptionally negative things about vaccines?
Note: location data in this dataset is self-reported, not reliable

Modeling what makes a successful tweet on this subject
Is there a relationship between tweet length and number of likes
Does including hashtags increase the likelihood of a tweet being widely disseminated?

Comparing the frequency of tweets referring to vaccinations with current events
Do these trends match with google trends related to the subject?
Is there a relationship between the frequency of tweets and public health campaigns for booster shots?
Do tweets about vaccines coincide with daily vaccinations administered?


### Shortcomings:
Missing data between 2021-04-22 and 2021-05-13
Location data missing or in inconsistent format


### Tags:
sentiment analysis
time-series analysis
data collection methods
twitter data
API
scraped data
data Visualization
public opinion


### Cleaning Steps:
Power Query Promoted Headers based off first row of data
Change data type for “user_verified” and “is_retweet” into binary variable
Change data type for “user_created” and “date” into date format
Split “hashtag” column by comma delimiter into eight subcolumns
Replace values for “hashtag.x” columns to remove closed brackets and apostrophes
Trimmed “hashtag.x” columns to remove blank spaces
Rename column “user_favourites” to “user_favorites” for consistency
