set.seed(3523)

library(AppliedPredictiveModeling)
data(concrete)

inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

model5 <- svm(CompressiveStrength ~ ., data = training)
pred <- predict(model5, newdata = testing)
rmse(testing$CompressiveStrength, pred)
