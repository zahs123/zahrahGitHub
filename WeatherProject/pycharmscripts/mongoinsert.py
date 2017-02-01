import pickle
import pandas as pd
from pandas import DataFrame, Series
import pymongo

with open('./varweathertweets') as p1:
    tweets = pickle.load(p1)

connection = pymongo.MongoClient("mongodb://localhost")
db = connection.tweets
mongtweets = db.tweets
mongtweets.drop()
for item in tweets:
    mongtweets.insert_one(item)