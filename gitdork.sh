#!/bin/bash

for i in `ls`
do
	cd $i
	
	# Finding Emails
	git log -p | grep -E -o "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b" | sort | uniq >> $1/email.txt
	
	# Finding Linked users
	git log -p | grep Author: | sort | uniq >> $1/name.txt

	# Finding URLs
	git log -p | grep -E -o '\b(https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]*[-A-Za-z0-9+&@#/%=~_|]' | sort | uniq >> $1/link.txt

	cd ..
done

# Finalizing

sort $1/email.txt | uniq > $1/emails.txt
rm $1/email.txt
sort $1/name.txt | uniq > $1/names.txt
rm $1/name.txt
sort $1/link.txt | uniq > $1/links.txt
rm $1/link.txt
