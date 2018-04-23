#!/usr/bin/python

# caffedrine@github.com

import sys          # to pass arguments
import os.path      # to check whether file exists or not
import socket       # used to send crafted packets
import urllib2
from contextlib import closing
from dns import reversename, resolver

if len(sys.argv) < 2:
    print("Usage: cisco_smart_install_scanner.py input_file.txt")
    print("File must contain PI:PORT one per line!")
    sys.exit(1)

# Check whether input file is valid or not
input_file = sys.argv[1]
if not (os.path.isfile(input_file) and os.path.isfile(input_file)):
    print("Invalid file!\n")
    sys.exit(1)

# Load file in memory
targets = []                    # Store input ip addresses
with open(input_file) as lines:
    for line in lines:
        targets.append(line.replace("\n", ""))

### FUNCTIONS ###
def getRDNS(ip):
    try:
        rev_name = reversename.from_address(ip)
        reversed_dns = str(resolver.query(rev_name, "PTR")[0])
    except:
        reversed_dns = "Unknown"

    return reversed_dns

def getISP(ip):
    try:
        response = urllib2.urlopen("https://ipinfo.io/" + ip + "/org?token=1ea4cc9d6b0493")
        html = response.read().replace("\n", "")
        return html
    except:
        return "ERR"
def isHostUp(ip):
    HOST_UP = True if os.system("ping -c 1 " + IP + ">>/dev/null") is 0 else False
    if HOST_UP:
        return "HOST_UP"
    else:
        return "HOST_DOWN"

def getPortState(host, port):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(15)
    result = sock.connect_ex((host, int(port)))
    if result == 0:
        return "open"
    else:
        return "closed"

### END FUNCS ###

# Create name for output file
# if ("~" or "/") in input_file:  # input filecontains full path
# No fancy checks for now
output_file = os.path.splitext(input_file)[0] + "_checked.csv"

# Append header to file
header = "INDEX\tTARGET\tHOST_STATE\tPORT_STATE\tCISCO_SMI\tVULN_STATE\tIP_RDNS\tIP_ISP\n"
header += "\t\t\t\t\t\t\t"
with open(output_file, "a+") as f:
    f.write(header + "\n")

# Loop through every ip address and check SMI
INDEX = 0
for target in targets:
    IP = target.split(":")[0]
    PORT = int(target.split(":")[1])

    TARGET = IP + ":" + str(PORT)
    HOST_STATE = isHostUp(IP)

    PORT_STATE = getPortState(IP, str(PORT))
    CISCO_SMI = "Unknown"
    VULN_STATE="Unknown"
    IP_RDNS = "Unknown"
    IP_RDNS = getRDNS(IP)
    IP_ISP = getISP(IP)

    ######### Vulnerability check #########
    CONN_TIMEOUT = 10

    conn = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    conn.settimeout(CONN_TIMEOUT)

    UP = 1;
    try:
        conn.connect((IP, PORT))
    except socket.gaierror:
        VULN_STATE = "ERROR"
        CISCO_SMI = "ERROR"
        UP=0
    except socket.error:
        HOST_STATE = "HOST_DOWN"
        PORT_STATE = "closed"
        UP=0

    if conn and UP is 1:
        req = '0' * 7 + '1' + '0' * 7 + '1' + '0' * 7 + '4' + '0' * 7 + '8' + '0' * 7 + '1' + '0' * 8
        resp = '0' * 7 + '4' + '0' * 8 + '0' * 7 + '3' + '0' * 7 + '8' + '0' * 7 + '1' + '0' * 8

        conn.send(req.decode('hex'))

        while True:
            try:
                data = conn.recv(512)

                if (len(data) < 1):
                    CISCO_SMI = "Present"
                    VULN_STATE = "NOT affected"
                    break
                elif (len(data) == 24):
                    if (data.encode('hex') == resp):
                        CISCO_SMI = "Present"
                        VULN_STATE = "AFFECTED"
                        break
                    else:
                        CISCO_SMI = "Unclear"
                        VULN_STATE = "Unclear"
                        break
                else:
                    CISCO_SMI = "Unclear"
                    VULN_STATE = "Unclear"
                    break

            except socket.error:
                CISCO_SMI = "No response"
                VULN_STATE = "Unclear"
                break

            except KeyboardInterrupt:
                break

        conn.close()

    ######### END VUlerability check#######

    with open(output_file, "a+") as f:
        OUTPUT_STR = "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t" % (INDEX,TARGET,HOST_STATE,PORT_STATE,CISCO_SMI,VULN_STATE,IP_RDNS,IP_ISP.replace("\t", ""))
        print OUTPUT_STR            # Also display on console for debugging purposes
        f.write(OUTPUT_STR + "\n")
    INDEX = INDEX+1




