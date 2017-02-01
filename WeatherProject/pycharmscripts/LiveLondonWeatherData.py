from twython import TwythonStreamer
import pickle
tweets = [] #where  the tweets go we append it here
CONSUMER_KEY = 't88xZ5en7nbhK2AivergQIsZy'
CONSUMER_SECRET = 'rzGAJfpwcA0t9enlSTA4j2NB9Mimn7AiiR6iF2iEe4Vzt94WoQ'
ACCESS_TOKEN = '803229887867789317-WJVz3SMvbizs7QWqsJWsNb7Lr3phXVf'
ACCESS_TOKEN_SECRET = 'G3YVHTWTwtvGcnxyirswU0MkImdIEKxNQdQx9feRQLGWM'

class MyStreamer(TwythonStreamer):

    def on_success(self, data):
        if data ['lang'] == 'en':
            tweets.append(data)
            print 'recieved tweet no ' , len(tweets)

        if len(tweets) >= 3000:
            self.disconnect()
    def on_error(self, status_code, data):
        self.disconnect()
#MyStreamer is the class call variable stream which inherits from mystreamer

stream = MyStreamer(CONSUMER_KEY, CONSUMER_SECRET, ACCESS_TOKEN, ACCESS_TOKEN_SECRET)
stream.statuses.filter(locations= '-0.490266 ,51.351111,0.118101,51.681834')
#the stream above is filtered by the tracks and is is defined using the class MyStreamer above
#Pickle (serialize) object to input file path.
with open('./weatherfromldn', 'wb') as w1: #tweets is variable we write to wb then after ab
    pickle.dump(tweets, w1 )

