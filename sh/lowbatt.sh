#!/usr/bin/env bash
low_percent=20
danger_percent=10
critical_percent=5

sleep_interval=60

battinfo=$(acpi -b | sed 's/, /,/g;ty;d;:y;s/^Battery 0: //;tx;d;:x')
service_name=lowbatt
filedir=/tmp/$service_name
lock_file=$filedir.lock
log_file=$filedir.log
notification_sent=false


# Apply cut to battinfo to get a certain field
# Usage: battcut {1|2|3} $battinfo
battcut() {
  echo ${@:2} | cut -d ',' -f $1
}

# Create lock_file and notify-send for a certain battery percentage.
# Set notify message 2nd argument
# Usage: checknotify {5|10|20} "Low battery"
checknotify() {
  check_percent=$1
  battinfo2=$(battcut 2 $battinfo)
  if [[ $(echo $battinfo2 | sed 's/%//') -lt $check_percent && $notification_sent == false ]]; then
    echo "$(date): Battery is below $check_percent, sending notification" > $log_file
    echo "$check_percent" > $lock_file
    notify-send "$2: $battinfo2" "$(battcut 3 $battinfo)"
    notification_sent=true
  fi
}

# Check that the lock_file is for greater than check_percent before
# calling checknotify
# Usage: checklocknotify {5|10|20} "Low battery"
checklocknotify() {
  check_percent=$1
  if [[ $(cat $lock_file) -gt $check_percent ]]; then
    checknotify $check_percent "$2"
  fi
}



while true; do
  if [[ $(battcut 1 $battinfo) == Charging ]]; then
    if [ -f $lock_file ]; then
      echo "$(date): Battery is charging, removing lock file" > $log_file
      rm $lock_file
    fi
  else
    if [ ! -f $lock_file ]; then
      checknotify $critical_percent "Critical battery"
      checknotify $danger_percent "Very low battery"
      checknotify $low_percent "Low battery"
    else
      checklocknotify $critical_percent "Critical battery"
      checklocknotify $danger_percent "Very low battery"
    fi
  fi

  sleep $sleep_interval
done

