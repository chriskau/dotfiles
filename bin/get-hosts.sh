#!/bin/sh
#
# This code is GPLv3
# Source: http://chr4.org/blog/2016/04/26/homebrew-betrayed-us-all-to-google/
#

HOSTSFILE=hosts
TMPFILE=/tmp/aosp-hosts-file

echo "Updating adblocking hosts file..."

curl "http://winhelp2002.mvps.org/hosts.txt" > $TMPFILE
curl "http://pgl.yoyo.org/adservers/serverlist.php?mimetype=plaintext&hostformat=hosts" >> $TMPFILE
curl "http://someonewhocares.org/hosts/hosts" >> $TMPFILE

echo "# This is a generated hostfile for adblocking.
# Sources:
# - http://www.mvps.org/winhelp2002/hosts.txt
# - http://pgl.yoyo.org/adservers/serverlist.php?mimetype=plaintext&hostformat=hosts
# - http://someonewhocares.org/hosts/hosts

# Localhost entries
127.0.0.1 localhost
::1 ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ff02::3 ip6-allhosts
" > $HOSTSFILE

# Streamline all entries to use 0.0.0.0
sed -i.tmp 's/127\.0\.0\.1/0\.0\.0\.0/' $TMPFILE

# Remove other localhost entries
sed -i.tmp '/localhost/d' $TMPFILE

# Remove comments
sed -i.tmp 's/#.*$//g' $TMPFILE

# Replace tabs with spaces
sed -i.tmp 's/\t/ /g' $TMPFILE

# Also block ipv6
sed -i.tmp 's/\(0\.0\.0\.0\)\(.*\)/\1\2\n::0\2/' $TMPFILE

# Sort and remove duplicates and empty lines
sort -u $TMPFILE | grep -v '^\s*$' >> $HOSTSFILE

dos2unix $HOSTSFILE

rm $TMPFILE
rm $TMPFILE.tmp

