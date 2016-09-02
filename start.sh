#!/bin/bash -e
(
if [ "x$START_WAIT_FILE" != "x" ]; then
	while true; do
		[ -f "$START_WAIT_FILE" ] && break
		sleep 1
	done
fi
/usr/sbin/nslcd -d
) & pid=$!
trap "kill $pid" TERM
if [ "x$START_WAIT_DONE_FILE" != "x" ]; then
	touch "$START_WAIT_DONE_FILE"
fi
wait $pid
