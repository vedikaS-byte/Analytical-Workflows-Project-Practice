moving_avg <- function(focal_date, dates, conc, window_size) {
  #which dates are in the window? subset these dates 
  #dates <- as.Date(dates)
  is_in_window <- (dates > focal_date - (window_size/2)*7)  & # tell me when dates are greater than focal date offset by half of window 
    (dates < focal_date + (window_size/2)*7)
  
  # find associated concentrations
  window_conc <- conc[is_in_window] # pull out associated concentrations
  
  # calculate mean
  result <- mean(window_conc, na.rm = T)
  return(result)
}