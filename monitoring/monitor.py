#!/usr/bin/python
#
#   -------------------
#   |   DR Automatron |
#   -------------------
#
# Description:
#  There is 3 phases to this project.
#       1 -> Provide a pretty menu with options the user can choose from
#       2 -> Abolish the menu, use args instead for command line portability
#       3 -> Completely automate this job. 
#           This will either be accomplish by certain triggered events
#               OR on a time schedule basis
#               OR probably the best option will be to have it schedule on the database and run
#               from the db cronjobs
#
#
#
#
#

import os
import time
import subprocess
import getpass

# Functions
def menu():
    os.system('clear')
    choice = ''
    while choice != 'x':
        print('\t\t------------------------------------')
        print("\t\t|\tLazy DR Sequence\t|")
        print('\t\t------------------------------------')
        print("Where are we moving?\n")
        print("[1] - Check services state")
        print("[2] - Move DC1 => DC2")
        print("[3] - Move DC2 => DC1")
        print("[x] - Return to shell\n")
        choice = input("Where: ").lower()
        if choice == "2":
            os.system('clear')
            dc1_to_dc2()
        elif choice == "3":
            os.system('clear')
            dc2_to_dc1()
        elif choice == "x":
            time.sleep(1)
            print("\n[INFO] - Returning to the shell\n")
            time.sleep(2)
            break
        elif choice == "1":
            os.system('clear')
            check_state()
        else:
            choice = "0"
            time.sleep(2)
            print("\n[WARNING] - Invalid choice\n")
            time.sleep(2)
            os.system('clear')


# Move DC1 -> DC2
def dc1_to_dc2():
    ans = '0'
    while not ans:
        print("\t\t======================================================")
        print("\t\t||\tChoose a service you wish to move\t||")
        print("\t\t======================================================")
        print("[1] - Move apacheService")
        print("[2] - Move Nginx")
        print("[3] - Move python")
        print("[4] - Move bash")
        print("[b] - Back to previous menu")
        print("[x] - Return to shell")
        ans = raw_input("Pick one: ").lower()
        print("")
        if ans == "1":
            print("[INFO] - Forcing apache to move...")
            time.sleep(3)
            subprocess.call(['bash', '-c', '. move_apache.sh; swap_to_dc2'])
            time.sleep(2)
        elif ans == '2':
            print("[INFO] - Swapping Nginx")
            time.sleep(3)
            subprocess.call(['bash', '-c', '. nginx.sh; swap_bo2_to_dc2'])
        elif ans == '3':
            time.sleep(3)
            print('[INFO] - Invoking bash')
            subprocess.call(['bash', '-c', '. python; swap_to_dc1'])
        elif == '4':
            time.sleep(3)
            print(['bash', '-c', '. bash; swap_to_dc2'])
        elif ans == "b":
            return menu()
        elif ans == "x":
            print("[INFO] - Back to the shell")
            os.system('clear')

# Move DC2 -> DC1
def dc2_to_dc1():
    ans = '0'
    while not ans:
        print("\t\t======================================================")
        print("\t\t||\tChoose a service you wish to move\t||")
        print("\t\t======================================================")
        print("[1] - Move apacheService")
        print("[2] - Move Nginx")
        print("[3] - Move python")
        print("[4] - Move bash")
        print("[b] - Back to previous menu")
        print("[x] - Return to shell")
        ans = raw_input("Pick one: ").lower()
        print("")
        if ans == "1":
            print("[INFO] - Forcing apache to move...")
            time.sleep(3)
            subprocess.call(['bash', '-c', '. move_apache.sh; swap_to_dc1'])
            time.sleep(2)
        elif ans == '2':
            print("[INFO] - Swapping Nginx")
            time.sleep(3)
            subprocess.call(['bash', '-c', '. nginx.sh; swap_bo2_to_dc1'])
        elif ans == '3':
            time.sleep(3)
            print('[INFO] - Invoking bash')
            subprocess.call(['bash', '-c', '. python; swap_to_dc12'])
        elif == '4':
            time.sleep(3)
            print(['bash', '-c', '. bash; swap_to_dc1'])
        elif ans == "b":
            return menu()
        elif ans == "x":
            print("[INFO] - Back to the shell")
            os.system('clear')


# Check the current active state
def check_state():
    time.sleep(1)
    print("\t\tChecking Hosts: ")
    print("----------------------------------------------")
    time.sleep(2)
    subprocess.call(['bash', '-c', '. check_services.sh; jn_guards'])
    print("\n\n\t\Checking Services")
    print("----------------------------------------------")
    time.sleep(2)
    subprocess.call(['bash', '-c', '. check_services.sh; apache; nginx'])
    ans = ''
    while ans != 'b':
        ans = raw_input("\nPress 'b' to return to main menu=n>>").lower()
        if ans == 'b':
            return menu()
        else:
            continue
# No "jnwatch", no joy
user = getpass.getuser()
if user != 'jnwatch':
    print("[INFO] - Checking user")
    time.sleep(2)
    print("[ERROR] - Invalid user detected.")
    print("[INFO] - Run script as [user].")
else:
    menu()
