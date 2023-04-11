#!/bin/bash

# __     __     _             _ 
# \ \   / /    | |           (_)
#  \ \_/ /__ _ | |__    __ _  _ 
#   \   // _` || '_ \  / _` || |
#    | || (_| || |_) || (_| || |
#    |_| \__,_||_.__/  \__,_||_|
#                               

# stop yabai
brew services stop yabai

# upgrade yabai
brew upgrade yabai

# start yabai
brew services start yabai
