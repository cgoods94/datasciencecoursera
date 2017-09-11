
## Get data from link and load into R
url <- paste("https://d18ky98rnyall9.cloudfront.net/",
             "_cf0fd3361e05f5be5304b07b771bad48_company_data.csv",
             "?Expires=1504915200&",
             "Signature=Qdm3M7PehiTEHDuSZFHfeHBjEUAjT95PdYpBYTfQrtjd16Ow8~",
             "IJUnGERp-I6aY2MHAIthyTJ4nT7joUKkZXA~4t0r4aqD5yhe9DUAPq~uWpAH~",
             "EQzroUxAZk96cxdjBMCPsLfImFSUc4Biy53g8ucEk0JSBQCWZI3Hybhvwcos_&",
             "Key-Pair-Id=APKAJLTNE6QMUY6HBC5A", sep = '')
download.file(url, dest = "company_data.csv")
company_data <- read.csv('company_data.csv')

## Run a regression on the data and assess y vs. x1
fit <- lm(y ~ ., company_data)
fit_coefs <- summary(fit)$coefficients
signif(fit_coefs["x1", ], 6)

## Report the estimated coefficient for x1 to 6 sig figs.
signif(fit_coefs["x1", "Estimate"], 6)

## Report the 95% confidence interval for x1's coefficient to 6 sig figs.
signif(confint(fit)["x1",], 6)

## Report the p-value associated with coefficient for x1 to 6 sig figs.
signif(fit_coefs["x1", "Pr(>|t|)"], 6)
