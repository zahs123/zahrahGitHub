import pickle
from pandas import DataFrame, Series
import pymongo

connection = pymongo.MongoClient("mongodb://localhost")
db = connection.tweets
mongtweets = db.weatherproject
mongfind = list(mongtweets.find({},{'text':1,'_id':0}))

frame = DataFrame(mongfind)

frame.to_csv('./rawmongotweets.csv',sep=',',encoding = 'UTF-8')