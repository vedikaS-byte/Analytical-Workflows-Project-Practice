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


qb_pmr_2 <- qb1 %>% rbind(qb2, qb3, pmr)
view(qb_pmr_2)
view(qb_pmr)
unique(qb_pmr$Sample_ID)
## tidy 
# select variables needed

qb_pmr <-  qb_pmr %>% pivot_longer(cols = c("K", "NO3-N", "Mg", "Ca","NH4-N"), names_to = "nutrients", values_to = "concentration") %>% select(Sample_Date, nutrients, concentration, Sample_ID)
colnames(qb_pmr)
# <<<<<<< HEAD
# ??lubridate
# =======
# ?lubridate
# >>>>>>> 205a1791e73679ea8dd09d7580f14a0724039abe


## groupby nutrients and create moving averages
qb_pmr <- qb_pmr %>% mutate(year_sample = year(Sample_Date), month_year = format(Sample_Date, "%Y-%m"), day_of_year= yday(Sample_Date), week_sample = week(Sample_Date)) 
# view(qb_pmr)


qb_pmr %>% group_by(month_year, year_sample, nutrients) %>%  summarize(monthly_mean_concentration = mean(concentration, na.rm = T), .groups = "drop") %>% ungroup() %>% ggplot(aes(x = year_sample, y = monthly_mean_concentration, col = factor(nutrients))) + geom_line() + geom_point()  +
facet_wrap(~nutrients) + guides(col = "none")

qb_pmr<- qb_pmr %>% filter(year_sample >= 1986 & year_sample <= 1995)
unique(qb_pmr$year_sample)

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
?days()
# function should take nutrient data and intervals to define interval size?
moving_ags <- function(nutrient_data, weeks_param){
  nutrient_data$moving_avg <- vector(mode = "numeric")
  # loop for nutrients? 
  for(i in unique(nutrients)){
    # pull nutrients in a subset
    # also subset dates? or weeks... go row by row?
    #subset_nutrient_data <- nutrient_data %>% filter(nutrient_data == i)
    for(j in seq_along(week_sample)){
      qb_pmr$weeks_param[i]  <- qb_pmr$week_sample[i] + 9
      # current i and i+1
     
      
      
    }
  }
  
}





#install.packages("zoo")
library(zoo)
week_interval(qb_pmr$week_sample)
?rollmean()
?interval()
str(qb_pmr)






str(qb_pmr)



