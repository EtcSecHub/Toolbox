#!/usr/bin/sh
#
# curlbuster v.20220921
# Brought to you by EtcSec
# It's not supposed to be pretty; I did it for the lolz ;p
#
# Usage: curlbuster <URL> <WordList>
#
# Ex: $ curlbuster http://localhost:8080 /path/to/my/fav/list.txt

SHELL="/usr/bin/bash -c"

# This is the base command loop
while read -r line; do
    TEST=$1$line
    $SHELL "echo '' | xargs -P 10 curl '$TEST' -w '%{response_code} %{url_effective}\t\t%{redirect_url}%{content_type}\n' 2>/dev/null | grep -E '^2[0-9]{2} .*|^3[0-9]{2} .*'"
done < $2
