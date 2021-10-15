#!/bin/bash

# Usefull for number of results < 1k as it is not multithreading
# Usage: ./shodan_validator.sh <ip_addresses_list>
# The format of IP addresses should be IP:PORT

# nMap is required! > $ sudo apt-get nmap

# Basically this script check whether the ports provided by shodan are still open or not. 
# Optionally nMap fingerprinting scripts can be used to gather data about device!

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

NSLOOKUP_INSTALLED=$(command -v 'nslookup')
if [ $NSLOOKUP_INSTALLED == "" ]; then
	echo -e "ERROR: nslookup needs to be installed!"
	exit 1
fi

# Check if arguments are passed or not
if [ -z "$1" ]; then
    echo "Usage: ./shodan_validator.sh <ip_addresses_list>"
    echo "The format of IP addresses should be IP:PORT"
    exit 1
fi

# Get file name
FILE=$1

# Enable/disable fingerprinting.
# If you are interested for a particular service on all hosts then anable this
FINGERPRINT_ENABLED=0;
NMAP_FINGERPRINT_SCRIPT=$2

# Output variables
TARGET="-"
HOST_STATE="-"
PORT_STATE="-"
FINGERPRINT_SHORT="-"
FINGERPRINT_FULL="-"
TARGET_IP_RDNS="-"
TARGET_IP_ISP="-"

# Store results in this array then print to a file
RESULTS_ARRAY=()

# Set file header
RESULTS_ARRAY=("${RESULTS_ARRAY[@]}" "COUNTER\tTARGET\tHOST STATE\tPORT STATE\tIP_RDNS\tIP_ISP\tDEVICE\tFINGERPRINT")
#RETULTS_ARRAY+=", , , , , , ,"

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
		HOST_STATE='HOST DOWN'
		return 0
	fi
}

# Check if port is really open
function is_port_open()
{
	# nMap command
	RESULT=$(nmap -p $2 $1 | awk '/Host is up/ {getline;getline; printf $1; printf "_"; printf $2; printf "_"; print $3}')
	
	# Assign result to globa as it is already parsed with awk
	PORT_STATE=$RESULT

	# Return 0 if closed
	if [[ $RESULT == *"closed"* ]]; then
		return 0
	else
		return 1
	fi
}

# Return service fingerprint
function get_service_fingerprint()
{
	# Perform nMap scan with the desired script!
	# This assume that you target a specific service on all ip addresses. 
	# For example, you grab all shodan IP addresses with Modbus (port 502) open. Then you can use
	# an nmap script to fingerprint all hosts returned by shodan!

	#RESULT=$( (nmap --script $NMAP_FINGERPRINT_SCRIPT  -p $2 $1) & sleep 20 ; kill $! ) )	# 15 seconds timeout for scrpt

	RESULT=$(timeout 20 nmap --script $NMAP_FINGERPRINT_SCRIPT -p $2 $1 )

	FINGERPRINT_SHORT=$( grep -oP "(Device identification: )(.*)" <<<"$RESULT")
	FINGERPRINT_SHORT=${FINGERPRINT_SHORT#"Device identification: "}

	FINGERPRINT_FULL="$( tail -n +4 <<< "$RESULT" )"
	FINGERPRINT_FULL="$( sed '$ d' <<< "$FINGERPRINT_FULL" )"

	return 1
}

# Get ip rDNS
function get_rdns()
{
	# Use nslookup for this task
	RESULT=$( nslookup $1 | awk '/name = / {print $4;}' )
	
	# Assign to global variable
	TARGET_IP_RDNS=$RESULT
}

# Get ISP
function get_ISP()
{
	# Use ipinfo.io to get isp
	RESULT=$( curl -s https://ipinfo.io/$1/org?token=1ea4cc9d6b0493 )

	# Assign result to global
	TARGET_IP_ISP=$RESULT
}

# Save to file
function save_csv()
{
	_DIR=${FILE%/*}
	_NAME="$(cut -d'.' -f1 <<<"${FILE##*/}")_checked.csv"
	_FULL="$DIR/$NAME"

	# print results array
	#printf '%s\n' "${RESULTS_ARRAY[@]}" >> $FULL

	#for each in ${RESULTS_ARRAY[@]}; do
	#	printf "%s\n" "$each"
	#done

	#echo -e $RESULTS_ARRAY

	#DAMN! Arrrrrrrrrrays are freaky stuff on this field!
}
### END FUNCTIONS ###

# Append header to file
if [[ "${FILE:0:1}" == / || "${FILE:0:2}" == ~[/a-z] ]]; then	# Handle relative and absolute paths
	_DIR=${FILE%/*}	# The given path is absolute
else
	_DIR=$(pwd)		# The given path is relative
fi
_NAME="$(cut -d'.' -f1 <<<"${FILE##*/}")_checked.csv"
_FULL="$_DIR/$_NAME"

printf '%s\n' "COUNTER,TARGET,HOST STATE,PORT STATE,IP_RDNS,IP_ISP,DEVICE,FINGERPRINT" > $_FULL
printf '%s\n' ",,,,,,," >> $_FULL

# Init counter
COUNTER=0

# Read file
while IFS= read -r line
do
	IP="$(cut -d':' -f1 <<<"$line")"
	PORT="$(cut -d':' -f2 <<<"$line")"

	# Assign target to global variable
	TARGET=$IP

	# resolve rDNS
	get_rdns $IP

	# try to get ISP
	get_ISP $IP

	# Call function to check whether host is up or not and grab result with $?
	is_host_up $IP

	
	if [ $? = 1 ]; then 	# If host is up.
		# Proceed with scanning port function
		is_port_open $IP $PORT

		if [ $? = 1 ] && [ $FINGERPRINT_ENABLED = 1 ]; then # If port is open
			# Proceed with fingerprinting
			get_service_fingerprint $IP $PORT
		fi
	fi

	# Print results in short
	echo -e "$COUNTER \t $TARGET \t $HOST_STATE \t $PORT_STATE \t $TARGET_IP_RDNS \t $TARGET_IP_ISP \t $FINGERPRINT_SHORT"
	
	# Save result to array
	RESULT_STR="\"$COUNTER\",\"$TARGET\",\"$HOST_STATE\",\"$PORT_STATE\",\"$TARGET_IP_RDNS\",\"$TARGET_IP_ISP\",\"$FINGERPRINT_SHORT\",\"$FINGERPRINT_FULL\""
	printf '%s\n' "$RESULT_STR" >> $_FULL

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

done < $FILE

