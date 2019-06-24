![drake](https://i.imgur.com/7607zxv.png)

# Web Project: Playing with memes

## Overview

**meme-generator** - a function that posts information to the imgflip API to generate a JPG file with a custom meme and downloads the file.

*Learning objective*: Get some hands on experience on working with APIs trough Python: getting, transforming and exporting data.

# meme-generator

## Results

The resulting function is **`meme_generator(meme_name)`**

```python
def meme_generator(meme_name):
    get_meme_id(meme_name)
    get_text_input()
    data_generator(meme_id, text0, text1)
    calling_the_api(data)
    getting_the_image_url(result)
    saving_the_image(image_url)
    print('Great meme! It has been saved locally.')
    pass
```

**Input** - 

1. A string with the  name of the desired meme template.

   Example: `Drake Hotline Bling`

2. Two strings with the content of each of the text boxes.

   Examples: `Editing memes on Photoshop` `Generating them via API`			

**Output** - 

1. A JPG file containing the meme.

   Example:

   <p align="center">
     <img width="250" height="250" src="https://i.ibb.co/Hpt7y9k/meme.jpg">
   </p>

   ##  Step 1: Getting data from the API

   Using requests, we get imgflip's meme database data and format it as a JSON; which acts like dictionary in Pyhton.

   ```python
   import requests
   get_url = 'https://api.imgflip.com/get_memes'
   api_request = requests.get(get_url).json()
   ```

   Once done, api_request is a JSON with the following structure:

   ```python
   {'success': True, 'data' : {'memes' : [{('''list of dictionaries with the values of each meme''')}]}
   ```

   Actually, we only want the information of each meme, so create a DataFrame containing it:

   ```python
   import pandas as pd
   memes = pd.DataFrame(api_request['data']['memes'])
   ```

   We limit the DataFrame to those memes with two text boxes:

   ```python
   memes = memes[memes['box_count'==2]]
   ```

   Also, we define `meme_names` as the list of elements in `memes['name']`:

   ```python
   meme_names = [meme for meme in memes['name']]
   ```

   ## Step 2: Collecting data required for meme generation

   To obtain the custom meme, we have to send to the API the following:

   1. The **meme template ID**
   2. Our **API keys**
   3. The **content of the two text blocks**

   First thing we need to obtain is the meme template ID (one of the columns in `memes`). As the one inputting the information to the function will be a human being, we want the input to be as human as possible - this is why we chose `memes['name']` as the required paramenter, to then translate it into `memes['id'].`

   This is how **`get_meme_id`** looked at the beggining:

   ```python
   def get_meme_id(meme_name):
       global meme_id
       index = int(memes.index[memes.name == meme_name].values)
       meme_id = memes.loc[index]['id']
       return meme_id
   ```

   This function works; but has two major inconveniences:

   1. If you don't input a string matching <u>exactly</u> an element in `memes['name']`, it will return a TypeError. 

      We used error handling to solve this: our program will ask again for input if doesn't find a coincidence.

   2. Requiring to input exactly matching string is not the ideal scenario. It's an inconvenience that the program doesn't run if I input `grumpy cat` instead of `Grumpy Cat`.

      We used `fuzzywuzzy`, a library based on Levenshtein Distance, to use the best match for the input given it has more than a certain score (60 points).

   After this adjustments, code looks like this:

   ```python
   from fuzzywuzzy import process
   def get_meme_id(meme_name):
       while True:
           try:
               global meme_id
               best_match = process.extractOne(meme_name, meme_names)
               # best_match is a tuple like this: (best match, score)
               if best_match[1] >= 60:
                   meme_name = best_match[0]
               index = int(memes.index[memes.name == meme_name].values)
               meme_id = memes.loc[index]['id']
               break
           except TypeError:
               meme_name = input('Not a valid meme name! Please insert another one: ')
       return meme_id
   ```

   Once we know the meme template we will be working with, we collect the content of each box of text with a simple function called **`get_text_input`**:

   ```python
   def get_text_input():
       global text0
       global text1
       text0 = input('Insert text 1 out of 2: ')
       text1 = input('Insert text 2 out of 2: ')
       return text0, text1
   ```

## Step 3: Posting the data to the API

Following the imgflip API documentation, we need to run a `request.post(post_url, data)` function calling their API; where `data` is  a dictionary with all the required meme information.

The function  **`data_generator(meme_id, text0, text1)`** does it for us:

```python
from keys import username, password # we don't want our API keys to be public!
def data_generator(meme_id, text0, text1):
    global data
    data = {
        'template_id': meme_id,
        'username': username,
        'password': password,
        'text0': text0,
        'text1': text1
    }
    return data
```

Once we have the required data structure, we can call the API with the **`calling_the_api(data)`** function:

```python
post_url = 'https://api.imgflip.com/caption_image'
def calling_the_api(data):
    global result
    result = requests.post(post_url, data)
    return result
```

With this function, we got imgflip to generate our meme and host it online. if we printed `result.text` , this would be the output:

```python
{"success":true,"data":{"url":'''url of the image''',"page_url":'''url of a page containing the meme'''}}
```

## Step 4: Getting the image file and saving it locally

The URL of the image is contained in `result.text`; so we use regular expressions to get it with the function **`getting_the_image_url(result)`**:

```python
import re
def getting_the_image_url(result):
    global image_url
    for picture_filename in re.findall(r'\w+\.jpg', result.text):
        image_url = 'https://i.imgflip.com/' + picture_filename
    return image_url
```

And then get and write the file using the function **`saving_the_image`**:

```python
def saving_the_image(image_url):
    image = requests.get(image_url, allow_redirects=True)
    open('meme.jpg', 'wb').write(image.content)
```

... et voilà!