import requests
import pandas as pd
import re
from fuzzywuzzy import process
from keys import username, password

get_url = 'https://api.imgflip.com/get_memes'
post_url = 'https://api.imgflip.com/caption_image'
api_request = requests.get(get_url).json()

memes = pd.DataFrame(api_request['data']['memes'])
memes = memes[memes['box_count'] == 2]
meme_names = [meme for meme in memes['name']]

def get_meme_id(meme_name):
    while True:
        try:
            global meme_id
            best_match = process.extractOne(meme_name, meme_names)
            if best_match[1] >= 60:
                meme_name = best_match[0]
            index = int(memes.index[memes.name == meme_name].values)
            meme_id = memes.loc[index]['id']
            break
        except TypeError:
            meme_name = input('Not a valid meme name! Please insert another one: ')
    return meme_id
def get_text_input():
    global text0
    global text1
    text0 = input('Insert text 1 out of 2: ')
    text1 = input('Insert text 2 out of 2: ')
    return text0, text1
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
def calling_the_api(data):
    global result
    result = requests.post(post_url, data)
    return result
def getting_the_image_url(result):
    global image_url
    for picture_filename in re.findall(r'\w+\.jpg', result.text):
        image_url = 'https://i.imgflip.com/' + picture_filename
    return image_url
def saving_the_image(image_url):
    image = requests.get(image_url, allow_redirects=True)
    open('meme.jpg', 'wb').write(image.content)

def meme_generator(meme_name):
    get_meme_id(meme_name)
    get_text_input()
    data_generator(meme_id, text0, text1)
    calling_the_api(data)
    getting_the_image_url(result)
    saving_the_image(image_url)
    print('Great meme! It has been saved locally.')
    pass


if __name__ == "__main__":
    print('Welcome to the meme generator!')
    print('To start, you need to introduce the name of a meme, like, for example, any of this four: ', [random_meme for random_meme in memes['name'].sample(4)])
    meme_generator(input('Input the name of the meme you want to generate: '))


