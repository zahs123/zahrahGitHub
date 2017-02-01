from pandas import DataFrame
import pandas as pd
import csv
from nltk import word_tokenize, wordpunct_tokenize
from nltk.tokenize import wordpunct_tokenize
from nltk.probability import FreqDist, DictionaryProbDist, ELEProbDist, sum_logs
from nltk.classify.api import ClassifierI

twlist = []
with open(r"C:\\Users\\Student23\\PycharmProjects\\twitterproject\\trainingsetw.csv", "r") as t:
    tweets_raw = pd.read_csv(t)

tweets = tweets_raw[['text', 'type']].values.tolist()
twlist = [tuple(l) for l in tweets] # turn nested list of lists into list of tuples
twtokens = []
for (words, sentiment) in twlist:
    words_filtered = [e.lower() for e in words.split() if len(e) >= 3]
    twtokens.append((words_filtered, sentiment))

import nltk
def get_words_in_tweets(tweets):
    all_words = []
    for (words, sentiment) in tweets:
        all_words.extend(words)
        return all_words

def get_word_features(wordlist):
    wordlist = nltk.FreqDist(wordlist)
    word_features = wordlist.keys()
    return word_features

word_features = get_word_features(get_words_in_tweets(twtokens))
def extract_features(document):
    document_words = set(document)
    features = {}
    for word in word_features:
        features['contains(%s)' % word] = (word in document_words)
    return features

training_set = nltk.classify.apply_features(extract_features, tweets)
classifier = nltk.NaiveBayesClassifier.train(training_set)
print classifier.show_most_informative_features(50)