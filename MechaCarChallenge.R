## dplyr package loaded
library()
library(dplyr)

## Import and read in the MechaCar_mpg.csv file as dataframe
MechaCar_df <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

## Perform linear regression using the lm() function. In the lm() function, pass in all six variables (i.e., columns)
lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_df)

## Using the summary() function, determine the p-value and the r-squared value for the linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_df))

## Import and read in the Suspension_Coil.csv file as a table.
susp_coil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

## Create total summary df using summarize function
total_summary_df <- susp_coil %>% summarize(mean_PSI = mean(PSI), median_PSI = median(PSI), var_PSI = var(PSI), std_PSI = sd(PSI), .groups = 'keep')

## Create lot summary df using group by and summarize function
lot_summary_df <- susp_coil %>% group_by(Manufacturing_Lot) %>%  summarize(mean_PSI = mean(PSI), median_PSI = median(PSI), var_PSI = var(PSI), std_PSI = sd(PSI), .groups = 'keep')


# T-tests on suspension coils
t.test(susp_coil$PSI, mu=1500)

t.test(subset(susp_coil,Manufacturing_Lot=="Lot1")$PSI, mu = 1500)
t.test(subset(susp_coil,Manufacturing_Lot=="Lot2")$PSI, mu = 1500)
t.test(subset(susp_coil,Manufacturing_Lot=="Lot3")$PSI, mu = 1500)


