#!/bin/bash

# Usage: ./shodan_validator.sh <ip_addresses_list>
# The format of IP addresses should be IP:PORT

# nMap is required! > $ sudo apt-get nmap

# Basically this script check whether the ports provided by shodan are still open or not. 
# Optionally nMap fingerprinting scripts can be used to gather data about device!

# Get file name
FILE=$1

# Enable/disable fingerprinting.
# If you are interested for a particular service on all hosts then anable this
FINGERPRINT_ENABLED=1;
NMAP_FINGERPRINT_SCRIPT=modbus-discover.nse

# Output variables
TARGET="-"
HOST_STATE="-"
PORT_STATE="-"
FINGERPRINT_SHORT="-"
FINGERPRINT_FULL="-"

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

	RESULT=$(nmap --script $NMAP_FINGERPRINT_SCRIPT -p $2 $1)

	FINGERPRINT_SHORT=$( grep -oP "(Device identification: )(.*)" <<<"$RESULT")
	FINGERPRINT_SHORT=${FINGERPRINT_SHORT#"Device identification: "}

	FINGERPRINT_FULL="$( tail -n +4 <<< "$RESULT" )"
	FINGERPRINT_FULL="$( sed '$ d' <<< "$FINGERPRINT_FULL" )"

	return 1
}
### END FUNCTIONS ###

# Read file
while IFS= read -r line
do
	IP="$(cut -d':' -f1 <<<"$line")"
	PORT="$(cut -d':' -f2 <<<"$line")"

	# Assign target to global variable
	TARGET=$IP

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

	# Print results or do whatever
	echo -e "$TARGET \t $HOST_STATE \t $PORT_STATE \t $FINGERPRINT_SHORT"

	# Clean variables
	TARGET="-"
	HOST_STATE="-"
	PORT_STATE="-"
	FINGERPRINT_SHORT="-"
	FINGERPRINT_FULL="-"
	
done < $FILE
