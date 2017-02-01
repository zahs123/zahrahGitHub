import pickle
import pandas as pd
from pandas import DataFrame, Series

with open('./varweathertweets') as p1:
    tweets = pickle.load(p1)

frame = DataFrame(tweets)
frame2 = frame.iloc[:, [-3, -4]]
frame2.to_csv('./tweetslist.csv', sep=',', encoding='UTF-8')