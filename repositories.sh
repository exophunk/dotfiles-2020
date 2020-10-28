#!/bin/sh

echo "Cloning repositories..."

PROJECTS=$HOME/workspace/freelancing/projects
TOOLS=$HOME/workspace/freelancing/tools
PERSONAL=$HOME/workspace/personal

# Projects
cd $PROJECTS
hub clone bz02-bzlt
hub clone cg01-guye
hub clone climeworks/cw02-climeworkscom
hub clone dz01-daizy
hub clone gb01-gbw
hub clone hc01-hundecodex
hub clone ku01-kzu
hub clone lm01-letsmuseeum
hub clone mi07-migrosmuseum
hub clone sb13-onlinespiel2020
hub clone sp01-sp
hub clone su01-schneider-mulden
hub clone tl01-timelines

# Gitlab
git clone git@gitlab.com:jungfrau/website/frontend/frontend.git jm05-frontend
git clone git@gitlab.com:jungfrau/website/maps/jungfrau-mobile-wintermaps.git jm01-jungfraumaps
git clone git@gitlab.com:jungfrau/website/maps/jungfrau-maps-geo-tool.git jm03-jungfrau-geotool
git clone git@gitlab.com:jungfrau/website/maps/jungfrau-grindelwald-stele.git jm06-jungfrau-stele

# Tools
cd $TOOLS
hub clone y7ksoftware/cli

# Personal Projects
cd $PERSONAL
hub clone ch01-charades
hub clone y7k-smashbros
hub clone robertkrieg