#!/usr/bin/osascript

set monoPath to "null"
set monoHomebrew to "/usr/local/bin/mono"
tell application "System Events"
	if exists file monoHomebrew then
		set monoPath to monoHomebrew
	else
		local printedError
		set printedError to "Error: Mono not found.\nExpected at " & monoHomebrew
		return display dialog printedError buttons {"OK"} default button 1
	end if
end tell

set scriptFolder to POSIX path of ((path to me as text) & "::")
try
	do shell script monoHomebrew & " " & scriptFolder & "KeePass.exe"
on error errorMessage number errorNumber
	local printedError
	set printedError to "Unknown error #" & errorNumber & ":\n" & errorMessage
	display dialog printedError buttons {"OK"} default button 1
end try
