library(lubridate) # For year() function below

dat = read.csv("~/Desktop/gaData.csv")

training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]

tstrain = ts(training$visitsTumblr)

mdl.ts <- bats(tstrain)

pred.ts <- forecast(mdl.ts, level = 95, nrow(testing))

table((testing$visitsTumblr > pred.ts$lower) & (testing$visitsTumblr < pred.ts$upper))

