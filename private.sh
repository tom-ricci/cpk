#!/bin/bash

# Check if a private key is provided as an argument
if [ -z "$1" ] && [ -z "$2" ]; then
    echo "Usage: $0 \$PRIVATE_KEY \$PUBLIC_KEY"
    exit 1
fi

# Variables!!
PRIVATE_KEY=$1
PUBLIC_KEY=$( echo $2 cut -c 5-)
PRIVATE_KEY_FILE="$HOME/.ssh/id_$( echo $PUBLIC_KEY | awk '{print $1}' )"

# Ensure the user isn't trying to get help
if [[ "$PRIVATE_KEY" == "-h" ]] || [[ "$PRIVATE_KEY" == "--h" ]] || [[ "$PRIVATE_KEY" == "--help" ]] || [[ "$PRIVATE_KEY" == "-help" ]]; then
    echo "Usage: $0 \$PRIVATE_KEY"
    exit 1
fi

# Ensure the .ssh directory exists
mkdir -p "$HOME/.ssh"

# Determine if the input is a file or string
if [ -f $PRIVATE_KEY ]; then

    # Copy the private key to the id_rsa file
    cp "$PRIVATE_KEY_FILE" "$DEST_PRIVATE_KEY"

else

    # Write the private key to the id_rsa file
    echo "$PRIVATE_KEY" > "$PRIVATE_KEY_FILE"

fi

# Set the correct permissions
chmod 700 "$HOME/.ssh"
chmod 600 "$PRIVATE_KEY_FILE"

# Let user know we're done
echo "Private key updated at $PRIVATE_KEY_FILE"
