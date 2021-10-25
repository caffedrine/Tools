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

## Cryptography attacks

1. Ciphertext-only attacks


2. Adaptive choosen-plaintext attack


3. Chosen plain-text attack


4. Related-Key Attack


5. Dictionary attack


6. Known-plaintext attack


7. Choosen ciphertext attack


8. Rubber hose attack


9. Choosen-key attack


10. Timing attack