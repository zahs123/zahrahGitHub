import pickle
import pymongo
import pandas as pd
from pandas import DataFrame, Series


connection = pymongo.MongoClient("mongodb://localhost")
db = connection.tweets
wp = db.weatherproject #create database
# drop existing collection
wp.drop() #if we want to append in future remove this

#pickle when you open to it
with open("C:\\Users\\Student20\\PycharmProjects\\weatherproject\\weatherfromldn", 'rb') as p1:
    importing = pickle.load(p1)
# iterate through every item
for item in importing:
# put it in mongo
    wp.insert_one(item) #insert item into wp