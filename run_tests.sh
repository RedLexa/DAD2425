#!/bin/bash
# Get the absolute path of the script's directory
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
BASE_PORT=8080
mvn clean install
########################################################################################################################
##################################################### SERVERS ##########################################################
########################################################################################################################
# Open terminal 0 with relative path
gnome-terminal --working-directory="$SCRIPT_DIR/server" -- bash -c "mvn exec:java -Dexec.args=\"$BASE_PORT 0\""
# Open terminal 1 with relative path
gnome-terminal --working-directory="$SCRIPT_DIR/server" -- bash -c "mvn exec:java -Dexec.args=\"$BASE_PORT 1\""
# Open terminal 2 with relative path
gnome-terminal --working-directory="$SCRIPT_DIR/server" -- bash -c "mvn exec:java -Dexec.args=\"$BASE_PORT 2\""
# Open terminal 3 with relative path
gnome-terminal --working-directory="$SCRIPT_DIR/server" -- bash -c "mvn exec:java -Dexec.args=\"$BASE_PORT 3\""
# Open terminal 4 with relative path
gnome-terminal --working-directory="$SCRIPT_DIR/server" -- bash -c "mvn exec:java -Dexec.args=\"$BASE_PORT 4\""
########################################################################################################################
##################################################### CONSOLE ##########################################################
########################################################################################################################
# Open terminal for console
#gnome-terminal --working-directory="$SCRIPT_DIR/consoleclient" -- bash -c "mvn exec:java && leader on 0;"
gnome-terminal --working-directory="$SCRIPT_DIR/consoleclient" -- bash -c "./run_console_with_command.exp"
########################################################################################################################
###################################################### CLIENT ##########################################################
########################################################################################################################
# Open terminal for console
gnome-terminal --working-directory="$SCRIPT_DIR/client" -- bash -c "mvn exec:java"