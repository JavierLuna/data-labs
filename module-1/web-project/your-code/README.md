# WEB API AND DATA SCRAPING PROJECT :thinking:

## Overview:

In this project we are going to use what we learn on the past learnings for Web and API scraping.
To do so we are going to perform the basis of what we learn and go from there.

## Process:

All the project is going to be created on Jupyter Notebook. We have create a .env doc where we put the Keys and tokens to be able to hide from the public.

### Spotify API :loud_sound:

- First Step: get public API, I'm going to use Spotify API. We need to accesss to the credentials that consist of an API key, API secret key. They can be found by viewing the details of your app and clicking on the Keys.

here you can access to the api: https://developer.spotify.com/

- Once we have create the connection between your code and the Spotify you can look for anything you need.

-We can look for all the albums from any Artist and look at there data from Spotify. We are going to use and Italian piano player call "Ludovico Einaudi". 

![Resultado de imagen de ludovico einaudi](http://www.ludovicoeinaudi.com/new/wp-content/uploads/2018/05/05.jpg)



To be able to access this type of content you must import a few libreries:

`import sys`

`from spotipy.oauth2 import SpotifyClientCredentials`

`import spotipy`

`import spottily.util as util`

`import pprint`

`import pandas as pd`

`from doting import load_dotenv`

`load_dotoenv()`

`import os`

### WEB SCRAPING :black_nib:

- First you need to look for and eassy website to scrapped from we are going to use the newspaper website (El Español) https://www.elespanol.com/.
    We are going to scrapped the list of main subject that the newspaper has.
    
- Secondly we are going to get all the GIF and Videos from https://9gag.com/

