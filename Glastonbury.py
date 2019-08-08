#!/usr/bin/python3

from selenium import webdriver
import webbrowser

import time

print("We are automating this shit")
url=input("url to open: ")

# This is not bad, but we want to handle the refresh and not extra tabs
# it can be a real pain to manage the dozens of tabs spawn per min

'''
if url == '':
    url = 'http://www.glastonbury.seetickets.com'
else:
    webbrowser.open(url)
    '''

browser = webdriver.Firefox()
browser.get(url)

# Refresh the page?!
driver.refresh()


    #webbrowser.open(url)

    # <insert> vpn hoping to avoid being detected as spam?
    # it is possible that the ip is locked, and by hoping we end up getting back to the beginning of the fkn queue
    # What about 10 machines doing the same shit and reporting back when sucessful login?

time.sleep(2)

