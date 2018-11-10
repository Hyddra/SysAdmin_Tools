#!/usr/bin/env python

import webbrowser

sites = ['https://shodan.io',
         'https://archive.org/web/web.php',
         'https://netcraft.com']

for i in sites:
    webbrowser.open_new_tab(i)
