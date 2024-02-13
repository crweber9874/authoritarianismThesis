## Recode data in R ##
library(dplyr)
library(foreign)
library(ggplot2)
library(readstata13)
dat <- read.dta13("/Users/Chris/studentThesis/authoritarianismThesis/data/t2020anes.dta", convert.factors = FALSE)
# Display the first 6 rows of the data frame
head(dat)
## Recode ###
table(dat$V202266) # Please tell me which one you think is more important for a child to have: Independence or respect for elders
# Recode the negatives to missing, and high scores are the authoritarian response
dat$auth1 <- case_when(
  dat$V202266 == 1 ~ 0,
  dat$V202266 == 2 ~ 1,
  TRUE ~ NA
)
dat$auth2 <- case_when(
  dat$V202267 == 1 ~ 0,
  dat$V202267 == 2 ~ 1,
  TRUE ~ NA
)
# Use the "pipe" operator
dat <- dat %>%
  mutate(auth3 = case_when(
    V202268 == 1 ~ 1,
    V202268 == 2 ~ 0,
    TRUE ~ NA
  )) %>%
  mutate(auth4 = case_when(
    V202269 == 1 ~ 0,
    V202269 == 2 ~ 1,
    TRUE ~ NA
  ))

head(dat)
# I've recoded the authoritarianism questions, creating new variables auth1-auth4
# This should be done with the rest of the items on your list.
