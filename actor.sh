#!/usr/bin/bash

set -x

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


# read actnumber
actnumber=""
while true; do
	actor=""
	actor="$(curl https://www.imdb.com/name/nm$(printf "%07d" ${actnumber})/ 2>/dev/null | grep meta.property..og.image | tr '"' '\n' | grep https | grep -v logos)"
		if [[ "$actor" == "" ]]; then
			actnumber="$(randomActorNumber)"
		else
			break
		fi
	done
	google-chrome $actor 2>/dev/null
done

