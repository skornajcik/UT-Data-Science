

```python
from bs4 import BeautifulSoup as bs
from splinter import Browser
import requests
import shutil
import pandas as pd
```


```python
executable_path = {'executable_path': '/usr/local/bin/chromedriver'}
browser = Browser('chrome', **executable_path, headless=True)
url = "https://mars.nasa.gov/news/"
browser.visit(url)

```


```python
#get page 
html = browser.html
soup = bs(html, 'html.parser')
```


```python
article = soup.find('div', class_="list_text")
news_p = article.find('div', class_='article_teaser_body').text
news_title = article.find('div', class_='content_title').text
news_date = article.find('div',class_='list_date').text
print(news_date)
print(news_title)
print(news_p)

```

    April  6, 2018
    Bound for Mars: Countdown to First Interplanetary Launch from California
    On May 5, millions of Californians may witness the historic first interplanetary launch from America’s West Coast.



```python
#get images 
url2 = "https://jpl.nasa.gov/spaceimages/?search=&category=Mars"
browser.visit(url2)
html = browser.html
soup = bs(html, 'html.parser')
image = soup.find("img", class_="thumb")["src"]
img_url = "https://jpl.nasa.gov"+image
featured_image_url = img_url
response = requests.get(img_url, stream=True)
with open('img.jpg','wb') as out_file:
    shutil.copyfileobj(response.raw, out_file)
from IPython.display import Image
Image(url='img.jpg')

```




<img src="img.jpg"/>




```python
#twitter
import tweepy
consumer_key = "tnjNfG713OK9spEtT7IqxNdUR"
consumer_secret = "NJ62QwHyMn2RgAUkwxJRkWz7N2SyUxIM0oBqF6GCy2EHjTBLJ2"

   
access_token = '752314166765981696-2mckoC7MWKp4Us1MJjIkF1xT9Y6c9GO'
access_token_secret =    "XVYXJrPJnnmqVXmSrc6fAR1yfqoIPP4DkpkOIzEsFgF2D"
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth, parser=tweepy.parsers.JSONParser())
target_user = "MarsWxReport"
full_tweet = api.user_timeline(target_user, count = 1)
mars_weather = full_tweet[0]['text']
mars_weather
```




    'Sol 2022 (April 14, 2018), Sunny, high -4C/24F, low -73C/-99F, pressure at 7.19 hPa, daylight 05:27-17:21'




```python
#factpage
url3 = 'http://space-facts.com/mars/'
browser.visit(url3)
grab=pd.read_html(url3)
data_mar = pd.DataFrame(grab[0])
data_mar.columns = ['Mars','Data']
table = data_mar.set_index("Mars")
marsdata = table.to_html(classes='marsdata')
marsdata = marsdata.replace('\n',' ')
marsdata
```




    '<table border="1" class="dataframe marsdata">   <thead>     <tr style="text-align: right;">       <th></th>       <th>Data</th>     </tr>     <tr>       <th>Mars</th>       <th></th>     </tr>   </thead>   <tbody>     <tr>       <th>Equatorial Diameter:</th>       <td>6,792 km</td>     </tr>     <tr>       <th>Polar Diameter:</th>       <td>6,752 km</td>     </tr>     <tr>       <th>Mass:</th>       <td>6.42 x 10^23 kg (10.7% Earth)</td>     </tr>     <tr>       <th>Moons:</th>       <td>2 (Phobos &amp; Deimos)</td>     </tr>     <tr>       <th>Orbit Distance:</th>       <td>227,943,824 km (1.52 AU)</td>     </tr>     <tr>       <th>Orbit Period:</th>       <td>687 days (1.9 years)</td>     </tr>     <tr>       <th>Surface Temperature:</th>       <td>-153 to 20 °C</td>     </tr>     <tr>       <th>First Record:</th>       <td>2nd millennium BC</td>     </tr>     <tr>       <th>Recorded By:</th>       <td>Egyptian astronomers</td>     </tr>   </tbody> </table>'




```python
#get pics
url4 = 'https://astrogeology.usgs.gov/search/results?q=hemisphere+enhanced&k1=target&v1=Mars'
browser.visit(url4)
import time
html = browser.html
soup = bs(html, 'html.parser')
mars_hem = []
for i in range (4):
    time.sleep(4)
    images = browser.find_by_tag('h3')
    images[i].click()
    html = browser.html
    soup = bs(html, 'html.parser')
    partial = soup.find('img', class_='wide-image')['src']
    img_tit = soup.find('h2',class_='title').text
    img_url = 'https://astrogeology.usgs.gov' + partial
    dic = {'title':img_tit,'img_url':img_url}
    mars_hem.append(dic)
    browser.back()
    print(mars_hem)
```

    [{'title': 'Cerberus Hemisphere Enhanced', 'img_url': 'https://astrogeology.usgs.gov/cache/images/cfa62af2557222a02478f1fcd781d445_cerberus_enhanced.tif_full.jpg'}]
    [{'title': 'Cerberus Hemisphere Enhanced', 'img_url': 'https://astrogeology.usgs.gov/cache/images/cfa62af2557222a02478f1fcd781d445_cerberus_enhanced.tif_full.jpg'}, {'title': 'Schiaparelli Hemisphere Enhanced', 'img_url': 'https://astrogeology.usgs.gov/cache/images/3cdd1cbf5e0813bba925c9030d13b62e_schiaparelli_enhanced.tif_full.jpg'}]
    [{'title': 'Cerberus Hemisphere Enhanced', 'img_url': 'https://astrogeology.usgs.gov/cache/images/cfa62af2557222a02478f1fcd781d445_cerberus_enhanced.tif_full.jpg'}, {'title': 'Schiaparelli Hemisphere Enhanced', 'img_url': 'https://astrogeology.usgs.gov/cache/images/3cdd1cbf5e0813bba925c9030d13b62e_schiaparelli_enhanced.tif_full.jpg'}, {'title': 'Syrtis Major Hemisphere Enhanced', 'img_url': 'https://astrogeology.usgs.gov/cache/images/ae209b4e408bb6c3e67b6af38168cf28_syrtis_major_enhanced.tif_full.jpg'}]
    [{'title': 'Cerberus Hemisphere Enhanced', 'img_url': 'https://astrogeology.usgs.gov/cache/images/cfa62af2557222a02478f1fcd781d445_cerberus_enhanced.tif_full.jpg'}, {'title': 'Schiaparelli Hemisphere Enhanced', 'img_url': 'https://astrogeology.usgs.gov/cache/images/3cdd1cbf5e0813bba925c9030d13b62e_schiaparelli_enhanced.tif_full.jpg'}, {'title': 'Syrtis Major Hemisphere Enhanced', 'img_url': 'https://astrogeology.usgs.gov/cache/images/ae209b4e408bb6c3e67b6af38168cf28_syrtis_major_enhanced.tif_full.jpg'}, {'title': 'Valles Marineris Hemisphere Enhanced', 'img_url': 'https://astrogeology.usgs.gov/cache/images/7cf2da4bf549ed01c17f206327be4db7_valles_marineris_enhanced.tif_full.jpg'}]

