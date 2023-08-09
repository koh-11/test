#!/bin/bash

# Ask the user to enter their name
read -p "Enter your name: " username

# Ask the user to enter group(s)
read -p "Enter your group(s): " group

# Check if the group exists
if grep -q "^$group:" /etc/group; then
	sleep 1
  echo "Group $group exists."
else
  echo "Group $group does not exist. Creating the group..."
  sleep 1
  groupadd $group
fi
#This block of code checks if the group specified by the user exists. It does this by using the grep command to search for an exact match of the group name in the /etc/group file. The ^$group: pattern ensures that the group name is matched from the beginning of the line. If a match is found, it prints a message indicating that the group exists. Otherwise, it prints a message that the group does not exist, creates the group using groupadd, and proceeds to the next step.

# Add the user to the group
usermod -a -G "$group" "$username"

# Show all the groups that the user is in and their permissions
groups "$username"
