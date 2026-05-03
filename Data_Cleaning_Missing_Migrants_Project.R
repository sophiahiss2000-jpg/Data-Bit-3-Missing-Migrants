# Data cleaning and aggregation — Missing Migrants Project (IOM)
# Output: static/data/map_data_df.csv

library(readxl)
library(dplyr)
library(readr)
library(tidyr)

# ── Load

raw <- read_excel("C:/Users/Sophia Hiss/Desktop/Sophia Daten/AA Uni/Master/MIA/courses/Spring26/Data Journalism/data-bit-3-sophia/static/data/Missing_Migrants_Global_Figures_allData.xlsx")

df <- raw |>
  filter(`Incident Year` >= 2014, `Incident Year` <= 2024)

# ── Aggregate
mediterranean <- df |>
  filter(`Region of Incident` == "Mediterranean") |>
  group_by(year = `Incident Year`) |>
  summarise(mediterranean = sum(`Total Number of Dead and Missing`, na.rm = TRUE),
            .groups = "drop")

northern_africa <- df |>
  filter(`Region of Incident` == "Northern Africa") |>
  group_by(year = `Incident Year`) |>
  summarise(northern_africa = sum(`Total Number of Dead and Missing`, na.rm = TRUE),
            .groups = "drop")

# ── Join & export

map_data_df <- full_join(mediterranean, northern_africa, by = "year") |>
  mutate(
    mediterranean  = ifelse(is.na(mediterranean), 0L, as.integer(mediterranean)),
    northern_africa = ifelse(is.na(northern_africa), 0L, as.integer(northern_africa))
  ) |>
  arrange(year)

write_csv(map_data_df,
          "C:/Users/Sophia Hiss/Desktop/Sophia Daten/AA Uni/Master/MIA/courses/Spring26/Data Journalism/data-bit-3-sophia/static/data/map_data_df.csv")

# ── Summary

cat("\nExported", nrow(map_data_df), "rows to static/data/map_data_df.csv\n\n")
print(map_data_df)

cat("\nTotals (2014-2024):\n")
cat("  Mediterranean:  ", sum(map_data_df$mediterranean), "\n")
cat("  Northern Africa:", sum(map_data_df$northern_africa), "\n")
cat("  Ratio (Med/NAf):", round(sum(map_data_df$mediterranean) /
                                  sum(map_data_df$northern_africa), 1), "\n")
