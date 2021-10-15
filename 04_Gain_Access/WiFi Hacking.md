# WiFi Hacking

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

#### Encryption methord comparison
| Encryption	| Algorithm	| IV size		| Key Length	| Key Management	| Integrity check 		|
|---------------|-----------|---------------|---------------|-------------------|-----------------------|
| WEP			| RC4		| 24-bit		| 40/104-bits	| None				| CRC-32				|
| WPA			| RC4, TKIP | 48-bit		| 128-bit		| 4-way handshake	| CRC32 and Michael Ango|
| WPA2			| AES-CCMP	| 48-bit		| 128-bit		| 4-way handshake	| CBC-MAC				|
| WPA3			| AES-GCMP 256| arbitrary	| 192-bit		| ECDH and ECDSA	| BIP-GMAC-256			|


