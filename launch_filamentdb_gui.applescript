set scriptPath to POSIX path of (path to me)
set projectDir to do shell script "cd " & quoted form of (do shell script "dirname " & quoted form of scriptPath) & " && pwd"
set uvPath to ""
set logFile to POSIX path of ((path to temporary items folder as text) & "filamentdb_gui.log")

try
	set uvPath to do shell script "command -v uv || true"
on error
	set uvPath to ""
end try

if uvPath is "" then
	set uvPath to "/opt/homebrew/bin/uv"
end if

do shell script "cd " & quoted form of projectDir & " && nohup " & quoted form of uvPath & " run python filament_db_gui.py >> " & quoted form of logFile & " 2>&1 &"
