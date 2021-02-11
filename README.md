# Quantum-RNG
Generates "true random numbers" from a lab in the Australian national university which measeurs the quantum fluctions of a vacumn, more info at [ANU QRNG](https://qrng.anu.edu.au)

## generating new numbers
Add ``quantumRandom.lua`` to your project folder 

Insert ``random = require "quantumRandom"`` into your project

Use ``getQuantumRandom()`` to generate a new value

## notes
establishes a conection with ANU's [api](https://qrng.anu.edu.au/contact/api-documentation/) every 1024 numbers generated
  - good idea to preload a number first to intially get 1024 numbers
  - will lag for every 1024 numbers genrated
  
if there was an error with getting the QRNG values psuedo random numbers are generated instead
