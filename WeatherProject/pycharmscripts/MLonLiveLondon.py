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

connection = pymongo.MongoClient("mongodb://localhost")
db = connection.tweets
wp = db.weatherproject
mongfind = list(wp.find({},{'text':1,'_id':0}))



    #print tweets
#using list oomprehension to put tweets in tuple format
 # turn nested list of lists into list of tuples
twtokens = []

for (text) in mongfind:
    text_filtered = [e.lower() for e in str(text).split() if len(e) >= 3]
    twtokens.append((text_filtered))

#print twlist

def get_words_in_tweets(tweets):
    all_words = []
    for (text) in tweets:
        all_words.extend(text) #extend the list all_words with text
        return all_words

def get_word_features(wordlist):
    wordlist = nltk.FreqDist(wordlist)
    word_features = wordlist.keys()
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
classifier = nltk.NaiveBayesClassifier.train(mongfind)






