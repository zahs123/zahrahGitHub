import pickle
import json
import urllib
import pandas as pd
url = 'http://datapoint.metoffice.gov.uk/public/data/val/wxfcs/all/json/352409?res=3hourly&key=a93fa1c3-3b36-4438-990a-13b9dd6f1783'
response = urllib.urlopen(url)
data = json.load(response)
with open('./varmetoffice2', 'wb') as p1:
    pickle.dump(data,p1)
