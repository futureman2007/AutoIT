#include '_Startup.au3'

Example()

Func Example()
	_StartupFolder_Install() ; Add the running EXE to the Current Users startup folder.
	ShellExecute(@StartupDir & '\')
	Sleep(5000)
	_StartupFolder_Uninstall() ; Remove the running EXE from the Current Users startup folder.
EndFunc   ;==>Example