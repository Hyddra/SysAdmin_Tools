#!/bin/bash

# ===========================================
# Title                 : NoFat
# Description           : Count the nr of (pushups & pullups) / day
# Author                : Hyddra
# Version               : 0.1
# Usage                 : <script.sh --help>
# Bash Version          : 5.0.11(1)-release
# ===========================================

# Vars
total_push=50
total_pulls=25

echo "====================================="
echo " 50 pushups / 25 pullups challenge"
echo "====================================="

# loop until 0 or less
echo "Your total is: $total_push"
echo "Your total is: $total_pulls"

until [[ $total_push -le 0 && $total_pulls -le 0 ]]; do
    if [[ $total_push -gt 0 ]]; then
        echo "How many pushes have you done?"
        read -p '>> ' push
        total_push="$(( $total_push - $push ))"
        echo "Only $total_push pushups to go..."
    fi
    if [[ $total_pulls -gt 0 ]]; then
        echo "How many pulls have you done?"
        read -p '>> ' pull
        total_pulls="$(( $total_pulls - $pull ))"
        echo "Only $total_pulls pullups to go..."
    fi
done

# Did you  complete the exercise? -> add option
# How do we store the previous day data?
# Can we make a pretty graph from it to track progress?

