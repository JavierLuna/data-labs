import requests
import json
import csv
import pandas as pd
from pandas.io.json import json_normalize
from api_key import API_KEY 

login = 'ele_hopper'
footprint_url = 'https://api.footprintnetwork.org/v1/'

headers = {'User-Agent': "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) "
                         "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Mobile Safari/537.36"}

def get_relative_endpoints(root_url, path, head, token):
    relative_url = root_url + path
    response = requests.get(relative_url, headers=head,  auth=('username', token))
    return response.json()

spain_data = get_relative_endpoints(footprint_url, 'data/203/all',  headers, API_KEY)
usa_data = get_relative_endpoints(footprint_url, 'data/231/all',  headers, API_KEY)
china_data = get_relative_endpoints(footprint_url, 'data/351/all',  headers, API_KEY)
india_data = get_relative_endpoints(footprint_url, 'data/100/all',  headers, API_KEY)
africa_data = get_relative_endpoints(footprint_url, 'data/2000/all',  headers, API_KEY)
asia_data = get_relative_endpoints(footprint_url, 'data/2001/all',  headers, API_KEY)
aus_and_nz_data = get_relative_endpoints(footprint_url, 'data/1000/all',  headers, API_KEY)
caribbean_data = get_relative_endpoints(footprint_url, 'data/1001/all',  headers, API_KEY)
central_america_data = get_relative_endpoints(footprint_url, 'data/1002/all',  headers, API_KEY)
central_asia_data = get_relative_endpoints(footprint_url, 'data/1003/all',  headers, API_KEY)

normalized_spain_data = json_normalize(spain_data)
normalized_usa_data = json_normalize(usa_data)
normalized_china_data = json_normalize(china_data)
normalized_india_data = json_normalize(india_data)
normalized_spain_data.to_csv('spain_all_data.csv', sep=",")
normalized_usa_data.to_csv('usa_all_data.csv', sep=",")
normalized_china_data.to_csv('china_all_data.csv', sep=",")
normalized_india_data.to_csv('india_all_data.csv', sep=",")

spain_df = pd.read_csv('spain_all_data.csv')
usa_df = pd.read_csv('usa_all_data.csv')
china_df = pd.read_csv('china_all_data.csv')
india_df = pd.read_csv('india_all_data.csv')


