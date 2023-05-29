#!/bin/sh
ls -lRSr $1 | grep "${4:}" | awk -v t="$3" '{if ($5 < t && $5 != "") print}' | head -$2 | awk '{print $5"\t"$9}' 
