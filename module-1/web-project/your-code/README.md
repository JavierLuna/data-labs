# WEB API AND DATA SCRAPING PROJECT :thinking:

## Overview:

In this project we are going to use what we learn on the past learnings for Web and API scraping.
To do so we are going to perform the basis of what we learn and go from there.

## Process:

All the project is going to be created on Jupyter Notebook. We have create a .env doc where we put the Keys and tokens to be able to hide from the public.

### Spotify API :loud_sound:

- First Step: get public API, I'm going to use Spotify API. We need to accesss to the credentials that consist of an API key, API secret key. They can be found by viewing the details of your app and clicking on the Keys.

  For the Keys you must create a .env documento and copy the data you want to hide from the world, but that gets you into the API.  

  You can find how to do it here: https://github.com/theskumar/python-dotenv

  Here you can access to the Spotify API: https://developer.spotify.com/

- Once we have create the connection between your code and the Spotify you can look for anything you need.

- We can look for all the albums from any Artist and look at there data from Spotify. We are going to use and Italian piano player call "Ludovico Einaudi". 

![Resultado de imagen de ludovico einaudi](http://www.ludovicoeinaudi.com/new/wp-content/uploads/2018/05/05.jpg)



To be able to access this type of content you must import a few libreries:

`import sys
from spotipy.oauth2 import SpotifyClientCredentials
import spotipy
import spottily.util as util
import pprint
import pandas as pd
from doting import load_dotenv
load_dotoenv()
import os`

### WEB SCRAPING :black_nib:

- To be able to scrape a website you have to import some libraries as well as with the API:

  `import requests

  from sprint import pprint

  from bs4 import BeautifulSoup

  import urllib.request as urllib2

  import webbrowser`

- First you need to look for and eassy website to scrapped from we are going to use the newspaper website (El Español) https://www.elespanol.com/. We are going to scrapped the list of main subject that the newspaper has.
  
  ![Resultado de imagen de el espaÃ±ol](http://www.brandemia.org/sites/default/files/sites/default/files/cabecera-el_espanol_nuevo_logo.jpg)
  
  We are going to try to get the main news from this newspaper everyday:
  
  1. You must first build the connection between the code and the website.
  2. Then you take the main 'href' from the website and try to get the news from those links.
  3. And now we do a loop to open all the pages in the browser.
  
- Secondly we are trying going to get all the GIF and image from https://9gag.com/

  ![Resultado de imagen de 9gag logo](https://www.stickpng.com/assets/images/5900c73c16ae4b3fc58f4822.png)

1. Now we are going to try to access all the images from the website.
2. So this why we can access the data and follow the path to try to make cool staff.
3. Exactly!!!