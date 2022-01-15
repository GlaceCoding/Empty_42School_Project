#!/bin/bash

function _in {
	local e match="$1"
	shift
	for e; do [[ "$e" == "$match" ]] && return 0; done
	return 1
}

./rendu > .tmp_out_rendu
echo -n "$ARG1" > .tmp_out_sh
DIFF=$(diff -u .tmp_out_sh .tmp_out_rendu)
if $(_in "--print" $@); then
	cat .tmp_out_rendu
fi
if [[ $DIFF ]]; then
	echo -e "\033[0;31m===== ERROR DIFF! =====\033[0m"
	echo -e "$DIFF"
	echo -e "\033[0;31m=======================\033[0m"
fi
if $(_in "--rm" $@); then
	rm .tmp_out_rendu
	rm .tmp_out_sh
fi
if [[ $DIFF ]]; then
	exit 1;
fi
