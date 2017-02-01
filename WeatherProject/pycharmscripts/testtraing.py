from pandas import DataFrame
import pandas as pd
import csv
import nltk
from nltk import word_tokenize, wordpunct_tokenize
from nltk.tokenize import wordpunct_tokenize
from nltk.probability import FreqDist, DictionaryProbDist, ELEProbDist, sum_logs
from nltk.classify.api import ClassifierI
import pickle
from pandas import DataFrame, Series
import pymongo

with open(r"C:\Users\Student20\PycharmProjects\weatherproject\trainingsetw.csv") as t:
    treader = csv.reader(t)
    twlist = []
    for i in treader:
        twlist.append(i)


    #print tweets
#using list oomprehension to put tweets in tuple format
 # turn nested list of lists into list of tuples
twtokens = []

for (text, type) in twlist:
    text_filtered = [e.lower() for e in str(text).split() if len(e) >= 3]
    twtokens.append((text_filtered, type))
print twtokens

#print twlist

def get_words_in_tweets(tweets):
    all_words = []
    for x in tweets:
        all_words.extend(x[0])

def get_word_features(wordlist):
    freqlist = nltk.FreqDist(wordlist)
    word_features = freqlist.keys()
    return word_features

word_features = get_word_features(get_words_in_tweets(twtokens)) #printing words which have highest visilibility
print word_features

# The Classifier
def extract_features(document):
    document_words = set(document) #whatever doc comes in set as document_words
    features = {}
    for word in word_features:
        features['contains(%s)' % word] = (word in document_words)
    return features

training_set = nltk.classify.apply_features(extract_features, twtokens)

#print training_set

classifier = nltk.NaiveBayesClassifier.train(training_set)
#print classifier.show_most_informative_features(100) #not reading tweets correctly

connection = pymongo.MongoClient("mongodb://localhost")
db = connection.tweets
wp = db.weatherproject
mongfind = list(wp.find({},{'text':1,'_id':0}))


positivetweets = []

tweet = 'it\'s sunny in london. even a little hot. you will need sun cream if you don\'t want to die a horrible painfull death by sunburn.' # This comes out Positive
print classifier.classify(extract_features(tweet.split()))

#for tweet in mongfind:
    #if classifier.classify(tweet) == "y":
        #print tweet
