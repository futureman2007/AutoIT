#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
sleep(2000)
WinClose("[CLASS:Progman]");
If WinExists("[CLASS:#32770]") Then
   WinActivate("[CLASS:#32770]")
   Send("{ENTER}");
EndIf