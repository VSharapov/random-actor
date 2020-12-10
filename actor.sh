#!/usr/bin/bash

# set -x

BROWSER_COMMAND="google-chrome"
BROWSER_COMMAND="firefox"

function randomActorNumber {
	range=10000
	lastFour=$RANDOM
	let "lastFour %= $range"
	range=1000
	firstThree=$RANDOM
	let "firstThree %= $range"
	echo "${firstThree}${lastFour}"
	return
}

function randomActorWithImage {
  while true; do
    actorNumber="$(randomActorNumber)"
    actorIMDBURL="https://www.imdb.com/name/nm$(printf "%07d" ${actorNumber})/"
    # TODO: grep for title.404 - most common issue
    potentialPhotoURL="$(curl ${actorIMDBURL} 2>/dev/null | grep meta.property..og.image | tr '"' '\n' | grep https | grep -v logos)"
    if [[ "$potentialPhotoURL" == "" ]]; then
      echo Actor $actorNumber at $actorIMDBURL is either 404 or some other issue occured
      continue
    fi
    if [[ "$potentialPhotoURL" == *"imdb_logo"* ]]; then
      echo Actor $actorNumber at $actorIMDBURL has "imdb_logo" in their photoURL
      continue
    fi
    $BROWSER_COMMAND $potentialPhotoURL
    echo '^C to exit'
    read
  done
}

