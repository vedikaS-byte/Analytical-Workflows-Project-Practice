## Read in data
library(tidyverse)
qb1 <- read_csv(here::here("data", "QuebradaCuenca1-Bisley.csv"))
qb2 <- read_csv(here::here("data", "QuebradaCuenca2-Bisley.csv"))
qb3 <- read_csv(here::here("data", "QuebradaCuenca3-Bisley.csv"))
pmr <- read_csv(here::here("data", "RioMameyesPuenteRoto.csv"))

# qb1 <- qb1 %>% mutate(year = year(Sample_Date), month = month(Sample_Date), day = 
#                         day(Sample_Date))
# qb2 <- qb2 %>% mutate(year = year(Sample_Date), month = month(Sample_Date), day = 
#                         day(Sample_Date))
# qb3 <- qb3 %>% mutate(year = year(Sample_Date), month = month(Sample_Date), day = 
#                         day(Sample_Date))
# pmr <- pmr %>% mutate(year = year(Sample_Date), month = month(Sample_Date), day = 
#                         day(Sample_Date))



qb <- qb1 %>% full_join(qb2)
qb <- qb %>% full_join(qb3)
qb_pmr <- qb %>% full_join(pmr)
dim(qb_pmr)

qb_pmr_2 <- qb1 %>% rbind(qb2, qb3, pmr)
view(qb_pmr_2)
view(qb_pmr)
unique(qb_pmr$Sample_ID)
## tidy 
# select variables needed

qb_pmr <-  qb_pmr %>% pivot_longer(cols = c("K", "NO3-N", "Mg", "Ca","NH4-N"), names_to = "nutrients", values_to = "concentration") %>% select(Sample_Date, nutrients, concentration, Sample_ID)
colnames(qb_pmr)
<<<<<<< HEAD
<<<<<<< HEAD
# <<<<<<< HEAD
# ??lubridate
# =======
# ?lubridate
# >>>>>>> 205a1791e73679ea8dd09d7580f14a0724039abe
=======
<<<<<<< HEAD
#?lubridate
=======
<<<<<<< HEAD
??lubridate
=======
?lubridate
>>>>>>> 205a1791e73679ea8dd09d7580f14a0724039abe
>>>>>>> 3c241b635ef63549ffc13c541ba3f42a23f9943b
>>>>>>> 91e299773def2a018847448f35a51fb35e27189d
=======
>>>>>>> db3cc6dedae557074eee702ddb4dacbc75641c43


## groupby nutrients and create moving averages
qb_pmr <- qb_pmr %>% mutate(year_sample = year(Sample_Date), month_year = format(Sample_Date, "%Y-%m"), day_of_year= yday(Sample_Date), week_sample = week(Sample_Date)) 
# view(qb_pmr)

qb_pmr_2 <- qb_pmr %>% mutate(year_sample = year(Sample_Date), month_year = format(Sample_Date, "%Y-%m"), day_of_year= yday(Sample_Date), week_sample = week(Sample_Date)) 
# view(qb_pmr)
str(qb_pmr_2)

qb_pmr_2 <- qb_pmr_2 %>% filter(year_sample >= 1986 | year_sample <= 1995)

qb_pmr %>% group_by(month_year, year_sample, nutrients) %>%  summarize(monthly_mean_concentration = mean(concentration, na.rm = T), .groups = "drop") %>% ungroup() %>% ggplot(aes(x = year_sample, y = monthly_mean_concentration, col = factor(nutrients))) + geom_line() + geom_point()  +
facet_wrap(~nutrients) + guides(col = "none")

qb_pmr<- qb_pmr %>% filter(year_sample >= 1986 & year_sample <= 1995)
unique(qb_pmr$year_sample)

dim(qb_pmr)

k <- qb_pmr %>% group_by(year_sample, Sample_ID, nutrients) %>%  summarize(yearly_mean_concentration = mean(concentration, na.rm = T)) %>% filter( nutrients %in% "K")%>% ggplot(aes(x = factor(year_sample), y = yearly_mean_concentration, col = Sample_ID, group = Sample_ID)) + geom_line() + geom_point()  +
 theme_bw() 

ca <- qb_pmr %>% group_by(year_sample, Sample_ID, nutrients) %>%  summarize(yearly_mean_concentration = mean(concentration, na.rm = T)) %>% filter( nutrients %in% "Ca")%>% ggplot(aes(x = factor(year_sample), y = yearly_mean_concentration, col = Sample_ID, group = Sample_ID)) + geom_line() + geom_point()  +
  theme_bw() 


mg <- qb_pmr %>% group_by(year_sample, Sample_ID, nutrients) %>%  summarize(yearly_mean_concentration = mean(concentration, na.rm = T)) %>% filter( nutrients %in% "Mg")%>% ggplot(aes(x = factor(year_sample), y = yearly_mean_concentration, col = Sample_ID, group = Sample_ID)) + geom_line() + geom_point()  +
  theme_bw() 


nh <- qb_pmr %>% group_by(year_sample, Sample_ID, nutrients) %>%  summarize(yearly_mean_concentration = mean(concentration, na.rm = T)) %>% filter( nutrients %in% "NH4-N")%>% ggplot(aes(x = factor(year_sample), y = yearly_mean_concentration, col = Sample_ID, group = Sample_ID)) + geom_line() + geom_point()  +
  theme_bw() 



no3 <- qb_pmr %>% group_by(year_sample, Sample_ID, nutrients) %>%  summarize(yearly_mean_concentration = mean(concentration, na.rm = T)) %>% filter( nutrients %in% "NO3-N")%>% ggplot(aes(x = factor(year_sample), y = yearly_mean_concentration, col = Sample_ID, group = Sample_ID)) + geom_line() + geom_point()  +
  theme_bw() 


library(ggpubr)
ggarrange(k, ca, mg, nh, no3, ncol = 2,nrow = 3,   
labels = c("K", "Ca", "Mg", "NH", "NO3"), common.legend = TRUE,legend = "bottom"    )



# qb_pmr <- qb_pmr %>% 
#   group_by(nutrients) %>% mutate(day_of_year= yday(Sample_Date)) %>% summarise( mean_concentration = mean(concentration, na.rm = T)) %>% ungroup()

?start()
# yday(qb_pmr$Sample_Date)
str(qb_pmr)
?interval()
unique(qb_pmr$nutrients)


qb_pmr_test <- qb_pmr

# week_interval <-  function(week_of_year){
# nine_wk_interval <- vector(mode = "numeric")
#   for(i in seq_along(week_of_year)){
#     qb_pmr$nine_wk_interval[i]  <- qb_pmr$week_sample[i] + 9
#     print(qb_pmr$nine_wk_interval)
#   }
# }
dim(qb_pmr)
start_date <- qb_pmr$Sample_Date[1]
end_date <- qb_pmr$Sample_Date[9695]
week_interval <- vector(mode = "numeric")
week_interval <- seq(from = start_date, to = end_date, by = "9 week")
# qb_pmr %>% mutate(week_interval = seq(from = start_date, to = end_date, by = "9 week"))
?rollmean()
start_date <- qb_pmr$Sample_Date[1]
end_date <- qb_pmr$Sample_Date[9695]

week_intervals <- vector(mode = "numeric", length = length(qb_pmr$Sample_Date) )

for(i in unique(qb_pmr$nutrients)){
  for(j in seq_along(qb_pmr$Sample_Date)){
    week_interval <- seq(from = start_date, to = end_date, by = "9 weeks")
   #week_interval <- interval(start_date, end_date)/
   qb_pmr$week_intervals[j] <- week_interval
  }
  print(week_intervals)
}

str(qb_pmr)


# function should take nutrient data and intervals to define interval size?
moving_ags <- function(nutrient_data, weeks_break){
  nutrient_data$moving_avg <- vector(mode = "numeric")
  nutrient_data$weeks_param <-  vector(mode = "numeric")
  # loop for nutrients? 
  for(i in unique(nutrient_data$nutrients)){
    # pull nutrients in a subset
    # also subset dates? or weeks... go row by row?
    #subset_nutrient_data <- nutrient_data %>% filter(nutrient_data == i)
    for(j in 2:seq_along(week_break)){
      nutrient_data$weeks_param[j]  <- (nutrient_data$week_sample[j]-1)/9
      # current i and i+1
      print(nutrient_data$weeks_param)
      week_interval <- seq(from = start_date, to = end_date, by = "9 weeks")
      #week_interval <- interval(start_date, end_date)/
      qb_pmr$week_intervals[j] <- week_interval
    }
  }
  
}
str(qb_pmr)
moving_ags(qb_pmr, weeks_break = 9)


# function should take nutrient data and intervals to define interval size?
moving_ags <- function(nutrient_data, weeks_break){
  # nutrient_data$moving_avg <- vector(mode = "numeric", length = nrow(nutrient_data))
  nutrient_data$moving_avg <- NA_real_
  #nutrient_data$weeks_param <-  vector(mode = "numeric")
  # loop through each nutrient
  for(i in unique(nutrient_data$nutrients)){
    # pull nutrients in a subset
    nutrient_data_subset <- nutrient_data %>% filter(nutrients == i)
    # also subset dates? or weeks... go row by row?
    for(j in unique(nutrient_data$Sample_ID)){
      nutrient_data_subset_sample_id <- nutrient_data_subset %>% 
        filter(Sample_ID == j) %>% mutate(moving_ag = rollmean(concentration, k = weeks_break, fill = NA, align = "center"))
      # nutrient_data$moving_avg[j] <- rollmean(nutrient_data$concentration, k = weeks_break, align = "center") 
     # nutrient_data$weeks_param[j]  <- (nutrient_data$week_sample[j]-1)/9
    #  ?rollmean()
      # current i and i+1
     # print(nutrient_data$weeks_param)
     
      # week_interval <- seq(from = start_date, to = end_date, by = "9 weeks")
      #week_interval <- interval(start_date, end_date)/
      #qb_pmr$week_intervals[j] <- week_interval
    }
  }
  nutrient_moving_ags <- rbind(nutrient_data_subset, nutrient_data_subset_sample_id)
}

moving_ags(qb_pmr, weeks_break = 9)


qb_pmr_2 <- qb_pmr  %>%
  arrange(nutrients, Sample_ID, week_sample) %>%
  group_by(nutrients, Sample_ID) %>% 
  mutate(moving_avg = rollmean(concentration, k = 9, align = "center", fill = NA), na.rm = T) %>%
  ungroup()

str(qb_pmr_2)
qb_pmr_2 %>% ggplot(aes(x = Sample_Date, y = moving_avg,  col = Sample_ID, group = Sample_ID)) + geom_line() + facet_wrap(~nutrients)


#install.packages("zoo")
library(zoo)
?rollmean()
?interval()
str(qb_pmr)

library(dplyr)
library(zoo)


