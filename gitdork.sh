# This script takes first argument as output folder

for i in `ls`
do
	cd $i

	git log -p | grep -E -o "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b" | sort | uniq >> $1/email.txt

	git log -p | grep Author: | sort | uniq >> $1/name.txt

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
