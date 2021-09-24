# Steganography

## Whitespace steganography

Append spaces and tabs that have a meaning.

Tools:
1. Snow


## Image steganography

#### Least Significant Bit Insertion

Modify last bit from each pixel. The changes won't be noticable into the image as there is only one bit changed.

Can only add a small amount of data.

#### Masking and filtering

Variation of luminosity to embedd a message. 

Masking technique can be detected using statistical analysis.

#### Anlorithms and Transformation


#### Tools:
1. Open Stego
2. Quick stego
3. SSuite Picsel
4. CryptaPix
5. Gifshuffle
6. PHP-Class Stream Steganography

## Document Steganography

Use an algorithm to embed data in documents (e.g. adding tabs, whitespaces, etc.)

#### Tools
1. Stego Stick
2. StegJ
3. Office XML
4. SNOW
5. Data Stash
6. Texto

## Video steganography

One can use both techniques from image stegano and audio stegano.

#### Tools:
1. OmniHide
2. RT Steganography
3. StegoStick
4. OpenPuff
5. MSU Stego Video

## Audio Steganography

Repleace lsb from samples or use frequencies that are not audible for human eye.

### Audio steganography methods:
1. Echo Data Hiding
2. Spread spectrum method
3. LSB Coding
4. Tonse insertion
5. Phase encoding steganography

#### Audio steganography Tools:
1. DeepSound
2. BitCrypt
3. StegoStick
4. Mp3Stego
5. QuickStego
6. Spectrology

## Folder steganography

Files are encrypted into folders and are not visible to for Windows Explorer (e.g. ADS - Alternative Data Stream)

### Tools:
1. Gilisoft File Lock Pro
2. FolderLock
3. Hide Folders 5
4. Invisible secrets 4
5. Max Folder Secure
6. Quick Crypto

## Spam/Email Stegano

Embedding data into spam emails.

#### Tools:
1. Spam Mimic


## Stegano tools for mobile
1. Steganography master
2. Stegais
3. SPY PIX
4. PixelKnot
5. Pocket Stego
6. Steganography Image
7. Steganography (github)


# Steganalysis

Stego-object = image after message was embedded.
Original cover = original image

1. Stego only attack
2. Known-stego attack
3. Known-message attack
4. Known-cover attack
5. Choosen-message attack
6. Choosen-stego attack
7. Chi-square attack - compare steg-object withoriginal data to observe differences
8. Distinguishing statistical attack - analyze the algorithm used to embed data
9. Blind classifier attack - observe how original data appear in steg-modified object.

# Detecting steganography

1. Text File - look for unusual patterns or extra spaces, etc.
2. Image File - look for distorsions in images, anomalies, quiality changes, exaggerated noise, etc. Statistical analyze to identify differences between random values and real values.
3. Audio File - Analyze LSB modifications, inaudible frequencies, etc.
4. Video File

#### Detection tools
1. zsteg
2. Stego veritas
3. Stegextract
4. StegoHunt
5. Steganography studio
6. Visual Stenographic Laboratory