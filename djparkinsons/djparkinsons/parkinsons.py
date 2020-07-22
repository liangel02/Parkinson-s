import numpy as np
import pandas as pd
import os, sys
from sklearn.preprocessing import MinMaxScaler
from xgboost import XGBClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
from django.http import HttpResponse

user = []

#read data
df=pd.read_csv('/Users/angelli/Documents/parkinsonsdata/parkinsons.data')
df.head() #pandas

#get features and labels
#features (columns in input set), labels (output)
features = df.loc[:,df.columns!='status'].values[:,1:] #pandas
label = df.loc[:,'status'].values

#get the counts of each label in label
print(label[label == 1].shape[0], label[label == 0].shape[0])

#init minmaxscaler and scale features to between -1 and 1
#scale features so that it takes a shorter amount of time for the residuals to converge
scaleVar = MinMaxScaler((-1,1)) #sklearn
x = scaleVar.fit_transform(features)
y = label

#splits data into random testing and training sets
#20% of data will be used for testing
#seed for the random number generator is 7 (providing a seed guarantees the generation of the same sequence of numbers each time)
xTrain, xTest, yTrain, yTest = train_test_split(x, y, test_size=0.2, random_state=7) #sklearn

#train model using xgboost
model = XGBClassifier()
model.fit(xTrain,yTrain)

XGBClassifier(base_score=0.5, booster='gbtree', colsample_bylevel=1,
              colsample_bynode=1, colsample_bytree=1, gamma=0,
              learning_rate=0.1, max_delta_step=0, max_depth=3,
              min_child_weight=1, missing=None, n_estimators=100,
              n_jobs=1, nthread=None, objective="binary:logistic",
              random_state=0, reg_alpha=0, reg_lambda=1, scale_pos_weight=1,
              seed=None, silent=None, subsample=1, verbosity=1) #xgboost

userInput = [[214.28900,260.27700,77.97300,0.00567,0.00003,0.00295,0.00317,0.00885,
              0.01884,0.19000,0.01026,0.01161,0.01373,0.03078,0.04398,21.20900,
              0.462803,0.664357,-5.724056,0.190667,2.555477,0.148569]]
xx = scaleVar.transform(userInput)

#find accuracy of model
#pyprint(accuracy_score(yTest, yPredict)*100)#sklearn
#print(yPredict[0])

def final():
    yPredict = model.predict(xx)  # xgboost
    return yPredict

