

```python

from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer 
analyzer = SentimentIntensityAnalyzer()

import json
import tweepy
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

```


```python
consumer_key = "tnjNfG713OK9spEtT7IqxNdUR"
consumer_secret = "NJ62QwHyMn2RgAUkwxJRkWz7N2SyUxIM0oBqF6GCy2EHjTBLJ2"

   
access_token = '752314166765981696-2mckoC7MWKp4Us1MJjIkF1xT9Y6c9GO'
access_token_secret =    "XVYXJrPJnnmqVXmSrc6fAR1yfqoIPP4DkpkOIzEsFgF2D"
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth)

```


```python
target_user = ['@BBCNews','@CBSNews','@CNN','@FoxNews','@NYT']
```


```python
accounts_df = pd.DataFrame({'@BBCNews':'',
                   '@CBSNews':'',
                   '@CNN':'',
                   '@FoxNews':'',
                   '@NYT':''}, index=[0])

```


```python
for user in target_user:
    counter = 0
    for page in tweepy.Cursor(api.user_timeline,id=user).items(100):
        tweet = page.text
        compound = analyzer.polarity_scores(tweet)["compound"]
        accounts_df.set_value(counter,user,compound)
        counter=counter+1
accounts_df.head()


```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>@BBCNews</th>
      <th>@CBSNews</th>
      <th>@CNN</th>
      <th>@FoxNews</th>
      <th>@NYT</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>-0.1531</td>
      <td>0</td>
      <td>0.2023</td>
      <td>-0.3182</td>
      <td>-0.5994</td>
    </tr>
    <tr>
      <th>1</th>
      <td>-0.3818</td>
      <td>0.2878</td>
      <td>0</td>
      <td>0.4939</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0</td>
      <td>0</td>
      <td>-0.2382</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0</td>
      <td>0.6369</td>
      <td>-0.4767</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0</td>
      <td>0.2732</td>
      <td>0.4019</td>
      <td>0</td>
      <td>0.4404</td>
    </tr>
  </tbody>
</table>
</div>




```python
x = np.arange(100, 0, -1)

BBCNews_handle = plt.scatter(x, accounts_df['@BBCNews'], alpha=0.5)
CBSNews_handle = plt.scatter(x, accounts_df['@CBSNews'], alpha=0.5)
CNN_handle = plt.scatter(x, accounts_df['@CNN'], alpha=0.5)
FoxNews_handle = plt.scatter(x, accounts_df['@FoxNews'], alpha=0.5)
NYT_handle = plt.scatter(x, accounts_df['@NYT'], alpha=0.5)

plt.title('Sentiment Analysis of Tweets (3/06/2018)')
plt.xlabel('Tweets Ago')
plt.ylabel('Tweet Polarity')

plt.legend(handles=[BBCNews_handle, CBSNews_handle, CNN_handle, FoxNews_handle, NYT_handle ], loc="upper right")
plt.gca().invert_xaxis()
lgd = plt.legend(bbox_to_anchor=(1, 1))
plt.savefig('sentiment_plot.png')
plt.show()


```


![png](output_5_0.png)



```python
avg_account = accounts_df.mean()
avg_account.plot(kind='bar')
plt.title('Overall Media Sentiment based on Twitter 3/06/18')
plt.ylabel('Tweet Polarity')
plt.show()
plt.savefig('Sentiment_avg.png')
```


![png](output_6_0.png)

