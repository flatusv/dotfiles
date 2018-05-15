#!/usr/bin/env python3
#
# author:   Ablakim Giray Üstün
# date:     Tue 15 May 2018 02:01:13 PM CEST
#
# descr:    Retrieve and download the most recent tracks from "weareone.fm"

#  TODO:  <15-05-18, make program aware of tracks that have already been downloaded> #



import os
import youtube_dl
import requests
import re
import urllib.request
import urllib.parse
from bs4 import BeautifulSoup


class Tracklist():

    def __init__(self, url):
        self.url = url
        self.tracks = []


    def getListOfTracks(self):


        # processing and parsing
        r = requests.get(self.url)
        html_content = r.text
        soup = BeautifulSoup(html_content, 'html5lib')
        links = soup.findAll('a', href=re.compile('^/release/'))
        self.tracks = list(set(list(filter(None,[ x.text for x in links ]))))

    def ytDownTracks(self):

        for track in self.tracks: # gvsearch uses google video, change it to "ytsearch" to use youtube
            os.system('youtube-dl --extract-audio --audio-format mp3 "gvsearch1:{}"'.format(track))


if __name__== "__main__":
    tracklist = Tracklist("https://www.trancebase.fm/tracklist/")
    tracklist.getListOfTracks()
    tracklist.ytDownTracks()
