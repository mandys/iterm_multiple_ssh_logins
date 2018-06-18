set hostnames to {"web01", "sys01", "mem01", "redis01"}

if application "iTerm" is running then
	tell application "iTerm"
		create window with default profile
		tell current tab of current window
			select
			tell current session
				
				-- make the window fullscreen
				tell application "System Events" to key code 36 using command down
				split horizontally with default profile
				
				set num_hosts to count of hostnames
				repeat with n from 1 to num_hosts
					if n - 1 is (round (num_hosts / 2)) then
						-- move to lower split
						tell application "System Events" to keystroke "]" using command down
					else if n > 1 then
						-- split vertically
						tell application "System Events" to keystroke "d" using command down
					end if
					delay 1
					write text "ssh " & (item n of hostnames)
				end repeat
			end tell
		end tell
	end tell
else
	activate application "iTerm"
	
end if