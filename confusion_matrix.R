# Precision  : TP / (TP + FP)
# Recall     : TP / (TP + FN) = Sensitivity = TPR = 1 - FNR
# Specificity: TN / (TN + FP)
# FPR        : FP / (FP + TN) = false alarm = 1 - specificity
# Accuracy   : (TP + TN) / (TP + FP + TN + FN)

# F1-measure     - 2 * (precision * recall) / (precision + recall)
# F0.5-measure   - 1.25 * (precision * recall) /(0.25 * precision) +recall
# F2 -           -  5  * (precision * recall) /(4 * precision) +recall

library(ROCR)
predicted <- c(1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1)
actual    <- c(1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1)
xtabs( ~ predicted + actual)
sum(predicted == actual) / NROW(actual)
confusionMatrix(factor(predicted), factor(actual))
pred <- prediction(predicted, actual)
plot(performance(pred, "tpr", "fpr"))
abline(a=0, b= 1)
performance(pred, "auc")
#plot(performance(pred, "acc", "cutoff"))





