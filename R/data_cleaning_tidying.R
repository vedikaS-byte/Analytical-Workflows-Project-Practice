#load the tidyverse for data cleaning 
library(tidyverse)

#load each data set individually
qb1 <- read_csv(here::here("data", "QuebradaCuenca1-Bisley.csv"))
qb2 <- read_csv(here::here("data", "QuebradaCuenca2-Bisley.csv"))
qb3 <- read_csv(here::here("data", "QuebradaCuenca3-Bisley.csv"))
mpr <- read_csv(here::here("data", "RioMameyesPuenteRoto.csv"))

# use a full_join() to join data sets. No unique ID is needed since the data sets are joined on shared columns to avoid duplicates
qb <- qb1 %>% full_join(qb2)
qb <- qb %>% full_join(qb3)
qb_mpr <- qb %>% full_join(mpr)

head(qb_mpr, head = 5) # what do the first five rows look like?

# select variables needed
qb_mpr <-  qb_mpr %>% pivot_longer(cols = c("K", "NO3-N", "Mg", "Ca","NH4-N"), names_to = "nutrients", values_to = "concentration") %>% select(Sample_Date, nutrients, concentration, Sample_ID)
colnames(qb_mpr)


## create new variable year_sample to pull year from sample_date for easy filtering later
qb_mpr <- qb_mpr %>% mutate(year_sample = year(Sample_Date))



