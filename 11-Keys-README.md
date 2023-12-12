## Key Generation

This module generates an RSA private-public key pair using the TLS provider in Terraform. It includes the following components:

**Private Key Generation:**
   - Generates an RSA private key with 2048 bits using the TLS provider.
   - Named "seoul_key" for reference.

**Public Key Derivation:**
   - Derives the corresponding public key from the generated private key.

 **Outputs:**
   - **Private Key Output:**
     - Outputs the private key value.
     - Sets the output to "sensitive" to prevent accidental exposure.

   - **Public Key Output:**
     - Outputs the public key value in OpenSSH format.

**Files Downloaded to Your Directory:**
   - **Private Key TXT File:**
     - Writes the private key to a text file named "Seoul_private_key.txt."

   - **Public Key TXT File:**
     - Writes the public key to a text file named "Seoul_public_key.txt."

   - **Private Key PEM File:**
     - Writes the private key to a PEM file named "Seoul_private_key.pem."

***Note: The consistent "Seoul" naming convention is applied to the output files for easy identification***

