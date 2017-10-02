library(ElemStatLearn)
library(caret)
data(vowel.train)
data(vowel.test)

vowel.test$y <- factor(vowel.test$y)
vowel.train$y <- factor(vowel.train$y)

set.seed(33833)

mod1 <- train(y ~., data = vowel.train, method = 'rf')
mod2 <- train(y ~. data = vowel.train, method = 'gbm', verbose = F)

pred1 <- predict(mod1, newdata = vowel.test)
pred2 <- predict(mod2, newdata = vowel.test)

confusionMatrix(pred1, vowel.test$y)$overall['Accuracy']
confusionMatrix(pred2, vowel.test$y)$overall['Accuracy']

mod_both <- pred1 == pred2
confusionMatrix(vowel.test$y[mod_both], pred1[mod_both])$overall['Accuracy']
