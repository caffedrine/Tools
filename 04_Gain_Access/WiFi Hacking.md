## WiFi Hacking

Util: https://github.com/ethicalhackeragnidhra/Wifi-arsenal/blob/master/README.md

#### WiFi Standards:
| Standard 			| Description															|
|-------------------|-----------------------------------------------------------------------|
| 802.11a/b/g/n     | Standard communications, 6-600Mbps, 2.4-5Ghz, 36-600m					|
| 802.11d 			| improvements for a and b 												|
| 802.11i           | Security improvements for a b g. Added WPA2							|
| 802.15.1			| Bluetooth																|
| 802.15.4			| ZigBee																|
| 802.16			| WiMax																	|
| 802.11e 			| Voice, video, realtime apps.											|
| 802.11x           | Provide centralized authentication (RADIUS)							|
|					|																		|
| 802.11ah 			| IoT, 2.4 and 5 GHz													|
| 802.11ac 			| 5GHz 																	|
| 802.11ad 			| 60Ghz spectrum														|


#### WiFi Encryptions
| Encryption		| Description												|
|-------------------|-----------------------------------------------------------|
| 802.11i			| Security improvements for a/b/g networks.					|
| WEP 				| Old encryption algorithm for 802.11 networks that can be easily cracked. Uses 24 bits IV for form strem cipher for *RC4 (confidentiality)* that will encrypt data and *32 bit checksum for integrity*.|
| WPA				| Advanced wireless encription standard protocol using **TKIP** (Temporary key integrity protocol) and **MIC** (Message integrity check) to provide better security. It uses TKIP 128-bit for data encryption which changes for every packet. It also introduces PSK (pre-shared key) or EAP authentication.|
| WAP2				| An upgraded WPA using **AES** and **CCMP** for data encryption. WPA2-Personal uses a preshared key (PSK) while WPA2-Enterprise uses a **RADIUS** server or EAP for centralized authentication.|
| WPA2-Enterprise   | Intrgrate **EAP** (Extensible Authentication Protocol) protocol that support multiple auth methods such as cards, Kerberos, etc) within WPA2 encryption|
| WPA3				| Latest wifi encryption protocol using **GCMP-256** for data encryption and **HMAC-SHA-384** for message authentication. |
| PEAP				| Protocol that encapsulate EAP (Extensible Authentication Protocol) into TLS.

#### Encryption methods comparison
| Encryption	| Algorithm	| IV size		| Key Length	| Key Management	| Integrity check 		|
|---------------|-----------|---------------|---------------|-------------------|-----------------------|
| WEP			| RC4		| 24-bit		| 40/104-bits	| None				| CRC-32				|
| WPA			| RC4, TKIP | 48-bit		| 128-bit		| 4-way handshake	| CRC32 and Michael Ango|
| WPA2			| AES-CCMP	| 48-bit		| 128-bit		| 4-way handshake	| CBC-MAC				|
| WPA3			| AES-GCMP 256| arbitrary	| 192-bit		| ECDH and ECDSA	| BIP-GMAC-256			|


## Wireless threats

#### Access control attacks

| Method	        | Description																			|
|-------------------|---------------------------------------------------------------------------------------|
| WarDriving		| Searching WiFi networks, usually from a car											|
| Rogue AP			| Instal an open AP inside secure perimeter waiting for users to connect.				|
| MAC Spoofing 		| Use a accepted MAc to bypass ACL														|
| AP Misconfiguration| Exploit misconfigured APs															|
| Ad-Hoc Associations| Connect to unsecured Ad-Hox networks.												|
| Promiscuous client| Place an AP with stronger signal with attractive name									|
| Client mis-association| Client that is associating to wrong AP											|
| Unauthorized association| 																				|


#### Integrity attacks

| Attack type		| Description													| Tools					|
|-------------------|---------------------------------------------------------------|-----------------------|
| Data-frame injection| Send forged 802.11 frames to network						| wnet dinject, WEPedgie, void11, Wperf, File2air, Airpwn|
| WEP Injection		| Send forget WEP keys											| WEP creacking tools, wep injection tools|
| Bit-flipping attacks | Flip bits in data payload									| 						|
| Extensible AP reply | Capture 802.11 EAP for reply attacks						| wireless capture tools, wireless injection tools |
|Data reply 		| Capture 802.11 data for later reply							| Wifi capture tools, wifi injection tools|
| IV Reply 			| Derive key stram from text									|						|
| RADIUS Reply		| Capture RADIUS messages for later reply						|						|
| Trojans			| Use trojans to read WiFi passwords							|						|


#### Confidentiality attacks

| Attack type		| Description													| Tools					|
|-------------------|---------------------------------------------------------------|-----------------------|
| Eavesdropping		| Capture and decode traffic									| airtools, wireshrk, ettercap, kismet|
| Traffic analyssis	| Analyse traffic for potential flaws							| any caturing tool		|
| WEP creacking		| capture data and recover wep key								| aircrack-ng, airsnort, WepDecrypt|
| Evil Twin			| Create a fake AP with the same SSID as original				| EvilTwinFramework, CquareAP, HostAP, WifiPhisher|
| Honeypot AP		| Set an AP identical to target AP								| 						|
| Session Hijacking | Manipulate IP so that host seems to be from a legitimate user | 						|
| Masquerading		| Pretend to be an authorized user								| 						|
| MitM Attacks		| Runt MitM to intercept sessions, data, etc.					| dsniff, ettercap		|


#### Availability attacks

| Attack type			| Description												| Tools					|
|-----------------------|-----------------------------------------------------------|-----------------------|
| Access Point Theft	| Steal phisical AP											| 						|
| Disassociation		| Destroy connection to AP									| wireless jammer		|
| EAP Exploitation		| Sending forged 802.11 EAP packetd							| Airtool, File2air		|
| Beacon flood			| Generate multiple fake APs to make difficult finding legitimate AP | FakeAP		|
| DoS					| Exploit multiple access collision avoidance CSMA/CA mechanism to make a channel appear busy | Network adapter with CW Tx mode |
| De-authenticate Flood | Flood clients with forged deauthentication packets		| AirJack, Omerta, void11|
| Routing Attacks 		| Distrinbuting forget routing info across the network		| 						|
| Authentication flood 	| Send forget auth requests to AP to fill up association table| void11. AirJack, File2air|
| ARP Cache Poisoning 	| Poison ARP cache to redirect traffic through attacker's host | Cainand Abel		|
| Power Saving Attack	| Send spoofed TIM to a client in power-saving mode.		| 						|
| TKIP MIC Exploit		| Generate invalid TKIP data to to exceed  MIC error threshold | File2air, wnet dinject|


#### Authentication attacks

| Attack Type			| Description												| Tools					|
|-----------------------|-----------------------------------------------------------|-----------------------|
| PSK Cracking			| Recover WPA-PSK from captured key handshake				| KisMAC, Fern WiFi Cracker, coWPAtty|
| LEAP Cracking			| Recover credentials from captured 801.11 LEAP				| Anwrap, Asleap, THC-LeapCracker|
| VPN Login Cracking	| Crack VPN protocol passwords via brouteforece				| ike_scan, IKECrack, Anger, THC-ppt-bruter|
| Domain login			| Crack NetBIOS 											| JtR, L0phtCrack, THC-Hydra|
| Key Reinstallation	| Exploit 4-way handshake in WPA2							| Nonce reuse			|
| Identity theft		| Capture user identity from cleartext 802.11 Identity Resposnse packet| 			|
| Shared Key Guessing	| Use default credentials to gein acces.					| 						|
|Password Speculation	| 															|						|
| Application Login Theft | Capture user credentials from cleartext apps protocols	| Ace Passw Sniffer, dsniff, Wi-Jacking|

















