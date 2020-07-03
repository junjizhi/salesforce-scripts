#!/bin/bash
set -euo pipefail

run-diff () {
  APEX_TEMPLATE="$(dirname ${0})/diff-sobject-template.apex"
  objectType=$1
  opp1=$2
  opp2=$3

  filename="_tmp/diff-opps.apex"
  cat $APEX_TEMPLATE | sed "s/ARRAY/'$opp1', '$opp2'/g" | sed "s/OBJECT_TYPE/$objectType/g"  > $filename
  sfdx force:apex:execute -f "$filename" |grep "USER_DEBUG" | awk -F '\\|DEBUG\\|' '{print $2}' | column -t -s$'\t'
}



if [[ $# -eq 3 ]] ; then
  run-diff $@ | grep '<>'
elif ([ $# -eq 4 ] && [ "$4" = "--show-all" ]) ; then
  run-diff $@
else
  echo "Usage: $(basename ${0}) <Opportunity|Contact|Account|...> <id1> <id2> [--show-all]"
  exit 1
fi
