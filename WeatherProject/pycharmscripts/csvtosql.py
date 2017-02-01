import pyodbc

cnxn = pyodbc.connect('DSN=KubrickSQLServer')
query = cnxn.cursor()
path = './tweets.csv'
query.execute('''bulk insert [twitterdata].dbo.dirtytweets
from ?
with
(
fieldterminator=','
)''',path)
cnxn.commit()