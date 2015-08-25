#!/bin/bash

kill -9 $(pgrep -f '/usr/sbin/haproxy -db -f /etc')
