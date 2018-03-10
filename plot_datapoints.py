import plotly.plotly as py
import plotly.graph_objs as go
import csv
# Create random data with numpy
import numpy as np

bitcoin_sentiments=open('btc_sentiment_annalysis/S4_Table.csv', 'r')
btc_sentiment_reader=csv.reader(bitcoin_sentiments)

#dict of dates to arrays of sentiments
date_sentiments={}
#for each row in the sentiment data
for row in btc_sentiment_reader:
    if row[0] in date_sentiments.keys:
        date_sentiments[row[0]].append(row[2])
    else:
        date_sentiments[row[0]]=[row[2]]

N = 1000
random_x = np.random.randn(N)
random_y = np.random.randn(N)
print(random_x)
# Create a trace
trace = go.Scatter(
    x = random_x,
    y = random_y,
    mode = 'markers'
)

data = [trace]

# Plot and embed in ipython notebook!
py.iplot(data, filename='basic-scatter')
