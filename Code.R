#Building a simple Linear Regression Model

#Importing the dataset

#Slpitting our dataset into training ang testing data sets

#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(Predicting_Salaries$AnnualSalary, SplitRatio = 3/4)
training_set = subset(Predicting_Salaries, split == TRUE)
testing_set = subset(Predicting_Salaries, split == FALSE)

#Fitting simple regression to traing and testing sets.
linearregressor = lm(formula = AnnualSalary ~ YearsOfExperience, data = training_set)

#Predicting Test set results
Y_pred = predict(linearregressor, newdata = testing_set)

#Visualising the training set results
#install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$YearsOfExperience, y=training_set$AnnualSalary),
             colour = 'red') +
  geom_line (aes( x= training_set$YearsOfExperience, y=predict(linearregressor, newdata= training_set)),
             colour = 'navy') +
  ggtitle ('Annual Salaries of Data Scientists vs Experience in Years (Training Set)') +
  xlab ('Years of Experience') +
  ylab ('Annual Salary') +
  scale_x_continuous(limits = c(0, 12)) + 
  scale_y_continuous(limits = c(0, 150000)) 
  
# Visualising the Test set results
library(ggplot2)
  ggplot() +
    geom_point(aes(x=testing_set$YearsOfExperience, y=testing_set$AnnualSalary),
               colour = 'red') +
    geom_line (aes( x= training_set$YearsOfExperience, y=predict(linearresgressr, newdata= training_set)),
               colour = 'navy') +
    ggtitle ('Annual Salaries of Data Scientists vs Experience in Years (Test Set)') +
    xlab ('Years of Experience') +
    ylab ('Annual Salary') +
    scale_x_continuous(limits = c(0, 12)) + 
    scale_y_continuous(limits = c(0, 150000)) 

