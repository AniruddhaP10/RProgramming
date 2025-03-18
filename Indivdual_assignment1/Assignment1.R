# Load necessary libraries
library(tidyverse)
library(dplyr)
library(plotly)




# Read dataset
cybersecurity_attacks <- read.csv("./Aniruddha/Indivdual_assignment1/Cybersecurity_attacks.csv")

# Select a random sample of 10 rows
sample_data <- sample_n(cybersecurity_attacks, 10)

# Display column names
colnames(sample_data)

# Select specific columns (without quotes)
selected_Coloumn <- sample_data %>%
  select(Source.IP.Address, Destination.IP.Address, Attack.Type)

# Rename columns
selected_Coloumn <- selected_Coloumn %>%
  rename(Attack_type = Attack.Type)

# View first few rows
print(selected_Coloumn)

# Count occurrences of each attack type
attack_counts <- selected_Coloumn %>%
  group_by(Attack_type) %>%
  summarise(count = n())

# Plot using plotly
fig <- plot_ly(
  attack_counts, 
  x = ~Attack_type,  # Corrected column name
  y = ~count, 
  type = 'bar',
  marker = list(color = 'blue')
) %>%
  layout(title = "Frequency of Attack Types", 
         xaxis = list(title = "Attack Type"), 
         yaxis = list(title = "Count"))

fig
