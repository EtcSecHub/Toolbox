#!/bin/sh

# Run standard nmap scans w/ notifications

# Log files:
INITIAL=nmap.initial
QUICK_FULL=nmap.quick_full

if [ -f $INITIAL -o -f $FULL ];
	then
		echo "[!] $INITIAL and/or $QUICK_FULL already exists in $PWD.\n[!] Teminating Scan."
	else
		if [ $# -eq 0 ];
			then
				echo "[!] Missing target hostname or IP.\n[-] Usage: qscan.sh <target>"
			else
				notify-send "Initial Scan Started" "Host: $1"
				nmap -Pn -sC -sV -oN $INITIAL $1 >/dev/null
				notify-send "Initial Scan Compelte/Begin Full Scan" "Host: $1"
				nmap -Pn -p- -oN $QUICK_FULL $1 >/dev/null
				notify-send "Quick Full Scan Complete!" "Host: $1"
		fi
fi
