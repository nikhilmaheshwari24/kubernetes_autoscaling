#!/bin/bash

url="$1"

# Fetch data from the URL
data=$(curl -s "$url")

# Process the data to remove timestamps, format it into a single line, and remove consecutive numbers
output=$(echo "$data" | sed -E 's/^[0-9:.]+ --> [0-9:.]+\s*//' | tr -s '\n' | tr '\n' ' ' | tr -s ' ' | sed -E 's/[[:space:]]+[0-9]+[[:space:]]+/ /g')

# Append the processed output to the README.md file
echo -e "\n\n$output" >> /workspaces/kubernetes_autoscaling/VerticalPodAutoscaling/README.md

# In case Auto-generated subitles are being used.
# curl -s  https://player.vimeo.com/texttrack/170006530.vtt?token=66ca47bb_0x72018351bd1058d762864c42907ceb493a06893f | grep -vE '^[0-9]+$|^[0-9]+:[0-9]+:[0-9]+\.[0-9]+ --> [0-9]+:[0-9]+:[0-9]+\.[0-9]+$|^WEBVTT$|^$' | tr '\n' ' '