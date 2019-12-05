#!/usr/bin/python

############################################3####################
# Author: Ricardo Gil		        			#
#								#
# Description:							#
#    As part of the planned DR Events, some configuration on	#
#    monitoring toolds needs to be amended manually.		#
#    This script attemps to solve that problem by automating	#
#	the tedious manual process.				#
############################################3####################

import os
import time
import subprocess

def menu():
	choice = 0
	while choice == 0:
		print("------------------------------------")
		print("\tClever DR Sequence")
		print("------------------------------------")
		print("Where are we moving?")
		print("[1] - Move DC1 => DC2")
		print("[2] - Move DC2 => DC1")
		print("[3] - Return to shell")
		choice = input("Pick an option>> ")
		if choice == 1:
			print(choice)
		elif choice == 2:
			print(choice)
		elif choice == 3:
			time.sleep(1)
			print("Quitting to the shell")
			time.sleep(2)
			break
		else:
			time.sleep(2)
			print("[WARNING] - Invalid Choice")
			choice = 0
			time.sleep(3)
			os.system('clear')
def dc1_to_dc2():
	print("[1] - jnwatch_guards move")
	print('[2] - CronServerNfs move')
	print("[3] - Cen05 move")
	print('[4] - Cen07 move')
	print('[b] - Back to previous menu')
	ans = input("what now > ")
	if ans == "1":
		guards="/opt/Scripts/DR_Event/jnwatch_guards"
		subprocess.call(guards)
	elif ans == "b".lower():
		menu()
	else:
		print("Goodbye")


def dc2_to_dc1():

	print("[1] - jnwatch_guards move")
	print('[2] - CronServerNfs move')
	print("[3] - Cen05 move")
	print('[4] - Cen07 move')
	print('[b] - Back to previous menu')
	ans = input("what now > ")


'''
def jnwatch_guards():
	guards="/opt/Scripts/DR_Event/jnwatch_guards"
	print("[INFO] - Calling jnwatch_guards.sh")
	time.sleep(1)
	print("[INFO] - Executing....")
	subprocess.call(guards, shell=True)
	time.sleep(2)
	print("[INFO] - Completed!!")


'''


menu()
