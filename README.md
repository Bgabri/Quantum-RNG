# Quantum-RNG
Generates "true random numbers" from a lab in the Australian national university which measeurs the quantum fluctions of a vacumn, more info at [ANU QRNG](https://qrng.anu.edu.au)

## generating new numbers
Add ``qRNG.lua`` to your project folder 

Insert ``local qRNG = require("qRNG")`` into your project

Use ``qRNG.getNumber()`` to generate a new value between 0 and 1

For other types
- hexadecimal: ``qRNG.getHex16(length)``
- 0 - 256: ``qRNG.getUint8(length)``
- 0 - 65536: ``qRNG.getUint16(length)``

## notes
establishes a conection with ANU's [api](https://qrng.anu.edu.au/contact/api-documentation/) every 1024 numbers generated and generates 1024 numbers
  - good idea to preload a number first to intially get the 1024 numbers
  - will lag for every 1024 numbers genrated
  
if there was an error with getting the QRNG values psuedo random numbers are generated instead
