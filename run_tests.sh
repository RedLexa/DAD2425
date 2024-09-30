#!/bin/bash

# Get the absolute path of the script's directory
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
BASE_PORT=8080
mvn clean install

########################################################################################################################
##################################################### SERVERS ##########################################################
########################################################################################################################

# Open terminal 0 with relative path
gnome-terminal --working-directory="$SCRIPT_DIR/server" -- bash -c "mvn exec:java -Dexec.args=\"$BASE_PORT 0\"; exec bash"
# Open terminal 1 with relative path
gnome-terminal --working-directory="$SCRIPT_DIR/server" -- bash -c "mvn exec:java -Dexec.args=\"$BASE_PORT 1\"; exec bash"
# Open terminal 2 with relative path
gnome-terminal --working-directory="$SCRIPT_DIR/server" -- bash -c "mvn exec:java -Dexec.args=\"$BASE_PORT 2\"; exec bash"
# Open terminal 3 with relative path
gnome-terminal --working-directory="$SCRIPT_DIR/server" -- bash -c "mvn exec:java -Dexec.args=\"$BASE_PORT 3\"; exec bash"
# Open terminal 4 with relative path
gnome-terminal --working-directory="$SCRIPT_DIR/server" -- bash -c "mvn exec:java -Dexec.args=\"$BASE_PORT 4\"; exec bash"

########################################################################################################################
##################################################### CONSOLE ##########################################################
########################################################################################################################

# Open terminal for console
#gnome-terminal --working-directory="$SCRIPT_DIR/consoleclient" -- bash -c "mvn exec:java; exec bash && leader on 0;"
gnome-terminal --working-directory="$SCRIPT_DIR/consoleclient" -- bash -c "./run_console_with_command.exp; exec bash"

########################################################################################################################
###################################################### CLIENT ##########################################################
########################################################################################################################

# Open terminal for console
gnome-terminal --working-directory="$SCRIPT_DIR/client" -- bash -c "mvn exec:java; exec bash"