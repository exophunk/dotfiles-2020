#!/bin/sh

echo "Cloning repositories..."

PROJECTS=$HOME/workspace/freelancing/projects
TOOLS=$HOME/workspace/freelancing/tools
PERSONAL=$HOME/workspace/personal

# Projects
cd $PROJECTS
hub clone bz02-bzlt
hub clone cg01-guye
hub clone gb01-gbw
hub clone hc01-hundecodex
hub clone jm01-jungfraumaps
hub clone jm03-jungfrau-geotool
hub clone ku01-kzu
hub clone lm01-letsmuseeum
hub clone mi07-migrosmuseum
hub clone nc01-ncd-sucht-prototype
hub clone sb13-onlinespiel2020
hub clone sp01-sp
hub clone tl01-timelines

# Tools
cd $TOOLS
hub clone y7ksoftware/cli

# Personal Projects
cd $PERSONAL
hub clone ch01-charades
hub clone y7k-smashbros
hub clone robertkrieg