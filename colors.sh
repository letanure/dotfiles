#!/bin/sh

ESeq="\x1b["
RCol="$ESeq"'0m'		# Text Reset

# Regular							Bold										Underline								Background					
Bla="$ESeq"'0;30m';		BBla="$ESeq"'1;30m';		UBla="$ESeq"'4;30m';		On_Bla="$ESeq"'40m';
Red="$ESeq"'0;31m';		BRed="$ESeq"'1;31m';		URed="$ESeq"'4;31m';		On_Red="$ESeq"'41m';
Gre="$ESeq"'0;32m';		BGre="$ESeq"'1;32m';		UGre="$ESeq"'4;32m';		On_Gre="$ESeq"'42m';
Yel="$ESeq"'0;33m';		BYel="$ESeq"'1;33m';		UYel="$ESeq"'4;33m';		On_Yel="$ESeq"'43m';
Blu="$ESeq"'0;34m';		BBlu="$ESeq"'1;34m';		UBlu="$ESeq"'4;34m';		On_Blu="$ESeq"'44m';
Pur="$ESeq"'0;35m';		BPur="$ESeq"'1;35m';		UPur="$ESeq"'4;35m';		On_Pur="$ESeq"'45m';
Cya="$ESeq"'0;36m';		BCya="$ESeq"'1;36m';		UCya="$ESeq"'4;36m';		On_Cya="$ESeq"'46m';
Whi="$ESeq"'0;37m';		BWhi="$ESeq"'1;37m';		UWhi="$ESeq"'4;37m';		On_Whi="$ESeq"'47m';

function log {
	local TEXT="$1"
	local COLOR="$2"
	local BACKGROUND="$3"
	echo "=> ${!COLOR}${!BACKGROUND} ${TEXT} ${RCol}"; 
}

function log_error	 	{ log "$1" "BRed"; }
function log_warning 	{ log "$1" "BYel"; }
function log_success 	{ log "$1" "BGre"; }
function log_info1		{ log "$1" "BBlu"; }
function log_info2		{ log "$1" "BWhi"; }
function log_info3		{ log "$1" "BPur"; }
function log_info4		{ log "$1" "BCya"; }
function log_info	 	{ log_info1 "$1" ; }
function log_muted	 	{ log "$1" "BBla"; }

function banner_error	{ log "$1" "" "On_Red"; }
function banner_error	{ log "$1" "On_Red"; }
function banner_warning	{ log "$1" "On_Yel"; }
function banner_success	{ log "$1" "On_Gre"; }
function banner_info1	{ log "$1" "On_Blu"; }
function banner_info2	{ log "$1" "On_Whi"; }
function banner_info3	{ log "$1" "On_Pur"; }
function banner_info4	{ log "$1" "On_Cya"; }
function banner_info	{ banner_info1 "$1" ; }
function banner_muted	{ log "$1" "On_Bla"; }

function log_separator	 { 
	printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
}
