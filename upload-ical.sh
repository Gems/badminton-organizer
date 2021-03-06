#!/usr/bin/env bash
#set -e
export PATH=/usr/local/bin:$PATH
export LC_ALL=en_US.UTF-8

events=$(cat /tmp/badminton.ical | grep -F 'BEGIN:VEVENT' | wc -l)

if [ ${events} -eq 0 ]; then
  echo "Nothing to upload. Quiting..." >&2
else
  gcalcli --config-folder ${GCALCLI_CONFIG} --calendar Badminton import /tmp/badminton.ical
fi

