#!/bin/bash

# Scans a given IP addresses list for Cisco Smart Install Protocol RCE Vulnerability
# https://cert.ro/citeste/cisco-smart-install-protocol-rce-vulnerability

# Usage: ./scisco_smart_install_validator.sh <ip_addresses_list>
# The format of IP addresses should be IP:PORT

# nMap is required! > $ sudo apt-get nmap

# Check wether all requirements are meet or not
NMAP_INSTALLED=$(command -v nmap)
if [ -z "$NMAP_INSTALLED" ]; then
	echo -e "ERROR: nMap needs to be installed!"
	exit 1
fi

CURL_INSTALLED=$(command -v curl)
if [ $CURL_INSTALLED == "" ]; then
	echo -e "ERROR: cURL needs to be installed!"
	exit 1
fi


# Check if arguments are passed or not
if [ -z "$1" ]; then
    echo "Usage: ./cisco_smart_install_validator.sh <ip_addresses_list>"
    echo "The format of IP addresses should be IP:PORT"
    exit 1
fi

# Get file name
INPUT_FILE=$1

#Variables used
HOST_STATE="-"
PORT_STATE="-"
VULN_STATE="-"
TARGET_RDNS="-"
TARGET_ISP="-"
SCI_INSTALLED="-"		# Cisco Smart Client Install service

### FUNCTIONS ###
# Function to check whether host is UP or not
function is_host_up()
{
	# nMap command
	RESULT=$(nmap -sP $1)

	# Process result
	if [[ $RESULT == *"1 host up"* ]]; then
		HOST_STATE='HOST UP'
		return 1
	else
		HOST_STATE='HOST_DOWN'
		return 0
	fi
}

# Check if port is really open
function is_port_open()
{
	# nMap command
	RESULT=$(nmap -p $2 $1 | awk '/Host is up/ {getline;getline; printf $1; printf "_"; printf $2;}')
	
	# Assign result to globa as it is already parsed with awk
	PORT_STATE=$RESULT

	# Return 0 if closed
	if [[ $RESULT == *"closed"* ]]; then
		return 0
	else
		return 1
	fi
}

# Get ip rDNS
function get_rdns()
{
	# Use nslookup for this task
	RESULT=$( nslookup $1 | awk '/name = / {print $4;}' )
	
	# Assign to global variable
	TARGET_RDNS=$RESULT
}

# Get ISP
function get_ISP()
{
	# Use ipinfo.io to get isp
	RESULT=$( curl -s https://ipinfo.io/$1/org?token=1ea4cc9d6b0493 )

	# Assign result to global
	TARGET_ISP=$RESULT
}

# Check whether target is vulnerable or not
function is_vulnerable()
{
	# To be finished this function
	# Eventually call python implementation to make things easier :)

	# Assign state to global variable
	VULN_STATE="Unknown"

	return 0	
}
### END FUNCTIONS ###

# Get file directory and file name
if [[ "${INPUT_FILE:0:1}" == / || "${INPUT_FILE:0:2}" == ~[/a-z] ]]; then	# Handle relative and absolute paths
	_FILE_DIR=${INPUT_FILE%/*}	# The given path is absolute
else
	_FILE_DIR=$(pwd)		# The given path is relative
fi

_FILE_NAME="$(cut -d'.' -f1 <<<"${INPUT_FILE##*/}")_checked.csv"
_FULL_FILE_PATH="$_FILE_DIR/$_FILE_NAME"

# Append header to file
printf '%s\n' "COUNTER,TARGET,HOST STATE,PORT STATE,CISCO SMART INSTALL CLIENT,VULN STATE,IP_RDNS,IP_ISP" > $_FULL_FILE_PATH
printf '%s\n' ",,,,,,," >> $_FULL_FILE_PATH		# Also append a blank line

# Init counter
COUNTER=0

# Read file
while IFS= read -r line
do
	IP="$(cut -d':' -f1 <<<"$line")"
	PORT="$(cut -d':' -f2 <<<"$line")"

	# Assign target to global variable
	TARGET=$IP

	# Additional data
	get_rdns $IP
	get_ISP $IP


	# Call function to check whether host is up or not and grab result with $?
	is_host_up $IP

	if [ $? = 1 ]; then 	# If host is up.
		# Proceed with scanning port function
		is_port_open $IP $PORT

		if [ $? = 1 ]; then # If port is open
			# Proceed with fcheckig vulnerbility state
			is_vulnerable $IP $PORT
		fi
	fi

	# Print results in short
	echo -e "$COUNTER \t $TARGET:$PORT \t $HOST_STATE \t $PORT_STATE \t $SCI_INSTALLED \t $VULN_STATE \t $TARGET_RDNS \t $TARGET_ISP"
	
	# Save result to array
	RESULT_STR="\"$COUNTER\",\"$TARGET:$PORT\",\"$HOST_STATE\",\"$PORT_STATE\",\"$SCI_INSTALLED\",\"$VULN_STATE\",\"$TARGET_RDNS\",\"$TARGET_ISP\""
	printf '%s\n' "$RESULT_STR" >> $_FULL_FILE_PATH

	# Clean variables
	TARGET="-"
	HOST_STATE="-"
	PORT_STATE="-"
	FINGERPRINT_SHORT="-"
	FINGERPRINT_FULL="-"
	TARGET_IP_RDNS="-"
	TARGET_IP_ISP="-"
	
	# increment counter 
	((COUNTER++))

done < $INPUT_FILE

