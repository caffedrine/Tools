## Cryptography

#### Symmetric algorithms
- AES
- RC4, RC5, RC6 - symetric key-stream algorithms.
- Blowfish - symmetric algo designed to replace DES.  Key ranges from 32 to 448 bits.
- Twofish - onf of finalists to replace DES. 128-bit block cipher. Key up to 256 bits. 
- Threefish - block and key sizes are equal, 256, 512, 1024. It involves three operations: **addition-rotation-xor**
- Serpent - key sizes  128, 192, 256 and it is free-of-use
- TEA (Tiny Encryption Algorithm) - 64-bit block and 128-bit key.
- CAST-128/256
- GHOST block Cipher (Magma)
- Camiellia

#### Signature related schemes

- DSA (Digital Signature Algorithm)
- RSA
- ECC

#### Key-exchange

- DH
- YAK

#### Hasing Algorithms

- RIPEMD-160
- HMAC
- CHAP

#### Other concepts
- Quantum cryptography
- Homomorphic encryption - use data without decrypting it
- Hardware-based encryption

Hardware encryption devices:
1. TPM
2. HSM
3. USB Encryption
4. HDD Encryption


#### PKI - Public Key Infrastructure

- Certificates management system
- Digital certificates
- Validation authority (VA) - store certificates
- Certification Authority (CA)
- End-user
- Registration authority (RA) - verify CA

## Cryptanalysis

#### Cryptanalysis methods:
1. Linear cryptanalysis - commonly used on block ciphers. Given sufficient pairs of plaintext and corresponding cipher text, information about the key can be obtained.
2. Differential Cryptanalysis - applicable on symmetric keys. Observe how input affects the output
3. Integral Cryptanalysis - analyze pairs of inputs that differs in only one position


#### Code breacking methodologies
1. Brute-force
2. Frequency analysis
3. Trickery and Deceit
4. One-time Pad

## Cryptography Attacks

#### 1. Ciphertext-only Attacks
Attacker have encrypted data and have to deduce plain-text or the key. Most common and most difficult.

#### 2. Adaptive choosen-plaintext Attack
Attacker have control over plain text message including encryption algorithm and encrypted text. Is can interactively modify the content of the message.

#### 3. Chosen plain-text Attack
Attacker obtains encrypted-text for choosed plain-text.

#### 4. Related-Key Attack
Attacked obtain ciphertext encrypted by two different keys.

#### 5. Dictionary Attack
Attacker build a dictionawy of plain-text and their corresponding ciphers and use it later to crack data.

#### 6. Known-plaintext Attack
In this attack, an attacker have access to plain-text, ciphertext and encryption algorithm. The only missing piece here is the encryption key.

#### 7. Choosen ciphertext Attack
Attacker obtain cipher text from arbitrary plain-text. The this information is used to recover the encryption key.

#### 8. Rubber Hoe Attack
Use torture to obtain encryption key (dafuq????)

#### 9. Choosen-key Attack
Attacker intend to break the entire system that rely on given cipher/key.

#### 10. Side-channel attack
1. Timing and Delay
2. Power consumption
3. Electromagnetic field
4. Light emission
5. Sound

#### 11. Brute-force

#### 12. Birthday Attack

#### 13. MitM (Meet-in-the-Middle) on DS schemes

#### 14. Hash collision attack

#### 15. DUHK (Don't Use Hardcoded Keys) Attack

#### 16. Rainbow table attacks

#### 17. Padding Oracle Attack
Exploit padding validationn of an encrypted message.

#### 18. DROWN Attack
Decrypt RSA with Obsolete and Weakened eNcryption

