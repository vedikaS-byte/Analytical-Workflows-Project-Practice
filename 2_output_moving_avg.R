# source moving_avg() locally from R folder
source(here::here("R", "moving_avg.R"))

#create new variable to store different version of qb_mpr
qb_mpr_rds <- readRDS(here::here("output", "qb_mpr.rds"))

# call moving_avg on qb_mpr and create a new column to store associated moving_avg concentrations with each nutrient in a single column 
qb_mpr_ma <- qb_mpr_rds %>%
  group_by(Sample_ID, nutrients) %>%
  mutate(moving_avg_nutrients = sapply(X = Sample_Date, moving_avg, dates = as.Date(Sample_Date), conc = concentration, window_size = 9)) %>% ungroup()


qb_mpr_ma <- saveRDS(qb_mpr_ma, here::here("output", "qb_mpr_ma.rds"))
