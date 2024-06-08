#!/bin/bash

# Check if a public key is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 \$PUBLIC_KEY"
    exit 1
fi

# Variables!!
PUBLIC_KEY=$1
AUTHORIZED_KEYS_FILE="$HOME/.ssh/authorized_keys"

# Ensure the user isn't trying to get help
if [[ "$PUBLIC_KEY" == "-h" ]] || [[ "$PUBLIC_KEY" == "--h" ]] || [[ "$PUBLIC_KEY" == "--help" ]] || [[ "$PUBLIC_KEY" == "-help" ]]; then
    echo "Usage: $0 \$PUBLIC_KEY"
    exit 1
fi

# Ensure the .ssh directory exists
mkdir -p "$HOME/.ssh"

# Add the public key to the authorized_keys file
echo "$PUBLIC_KEY" >> "$AUTHORIZED_KEYS_FILE"

# Set the correct permissions
chmod 700 "$HOME/.ssh"
chmod 600 "$AUTHORIZED_KEYS_FILE"

# Let user know we're done
echo "Public key added to $AUTHORIZED_KEYS_FILE!"
