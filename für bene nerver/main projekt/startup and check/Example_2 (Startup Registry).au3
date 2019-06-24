#include '_Startup.au3'

Example()

Func Example()
	_StartupRegistry_Install() ; Add the running EXE to the Current Users Run registry key.
	Sleep(5000)
	_StartupRegistry_Uninstall() ; Remove the running EXE from the Current Users Run registry key.
EndFunc   ;==>Example