#!/usr/bin/python3

from selenium import webdriver
import time


# 'http://www.glastonbury.seetickets.com'

# ------------------------------------------------------------------#
address = input("Where to search > ")
refresh = input("want to choose the refresh rate? [y/n]: ").lower()

refresh_rate = 0
# ------------------------------------------------------------------#

print("Automating money spending....")
# address = 'http://www.glastonbury.seetickets.com'


if not address:
    address = "https://www.glastonbury.seetickets.com"
if refresh == 'y':
    refresh_rate = int(input("How many seconds between refresh? "))

browser = webdriver.Firefox()
browser.get(address)

while True:
    time.sleep(refresh_rate)
    browser.refresh()

