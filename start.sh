#!/bin/sh

# start.sh
# start varnishd process using all parameters that we have received

varnishd $@
varnishncsa
