#!/bin/sh
#
# Rename the computer to first initial last name dash serial.
#
#gets current logged in user
getUser=$(ls -l /dev/console | awk '{ print $3 }')

#gets serial number of device
serialNumber=$(ioreg -c IOPlatformExpertDevice -d 2 | awk -F\" '/IOPlatformSerialNumber/{print $(NF-1)}')

#gets named
firstInitial=$(dscl . -read /Users/"$getUser" RealName | grep ^\ | awk '{print tolower($1)}' | cut -c 1)
lastName=$(dscl . -read /Users/"$getUser" RealName | grep ^\ | awk '{print tolower($2)}')
computerName=$firstInitial$lastName"-"$serialNumber

#set all the name in all the places
scutil --set ComputerName "$computerName";
scutil --set LocalHostName "$computerName";
scutil --set HostName "$computerName";
jamf setComputerName -name $computerName;

exit 0
exit 1
