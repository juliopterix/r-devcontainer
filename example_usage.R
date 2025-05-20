library(tidyverse)
library(arrow)

dir.create("data", showWarnings = FALSE)
curl::multi_download(
  "https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional-size-bands.csv",
  "data/Annual-enterprise-survey.csv",
  resume = TRUE
)

seattle_csv <- open_dataset(
  sources = "data/Annual-enterprise-survey.csv",
  format = "csv"
)

seattle_csv |> glimpse()