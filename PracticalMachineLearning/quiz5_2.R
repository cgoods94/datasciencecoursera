library(caret)
library(gbm)
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)

adData = data.frame(diagnosis,predictors)

inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

set.seed(62433)

rf.mod <- train(diagnosis ~ ., method = 'rf', data = training)
gbm.mod <- train(diagnosis ~ ., method = 'gbm', data = training, verbose = F)
lda.mod <- train(diagnosis ~ ., method = 'lda', data = training, verbose = F)

rf.pred <- predict(rf.mod, newdata = testing)
gbm.pred <- predict(gbm.mod, newdata = testing)
lda.pred <- predict(lda.mod, newdata = testing)

confusionMatrix(rf.pred, testing$diagnosis)$overall['Accuracy']
confusionMatrix(gbm.pred, testing$diagnosis)$overall['Accuracy']
confusionMatrix(lda.pred, testing$diagnosis)$overall['Accuracy']

stackDF <- data.frame(pred1 = rf.pred, pred2 = gbm.pred, 
                      pred3 = lda.pred, diagnosis = testing$diagnosis)
stack.mod <- train(diagnosis ~ ., method = 'rf', data = stackDF)
stack.pred <- predict(stack.mod, stackDF)

confusionMatrix(stack.pred, testing$diagnosis)$overall['Accuracy']
