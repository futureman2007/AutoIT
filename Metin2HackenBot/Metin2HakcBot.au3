^^^^^^#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         Futureman2007
 Script Function:	autoDigbot for Electrycedmt2
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include<AutoItConstants.au3>
#RequireAdmin
$hakingPeriod = 30 * 1000
main()
 ; longest time which one haking action maximum needs. here 26 sekonds

Func autoDig()

   While(1)
	  MouseClick($MOUSE_CLICK_MAIN)
	  sleep($hakingPeriod)
   WEnd


EndFunc

Func exitScript()
   if MsgBox(4,"DigBot", "Exit?") == 6 Then
	  ProcessClose("autoExpo.exe")
	  Exit
   Else
   EndIf
EndFunc
Func timeElapsed()
   MsgBox(0,"DigBot", "10 Minutes are Over! Respawn your Adder!" & @LF & "After that, klick OK to continue." & @LF & " Your mouse must hover over your adder!")
EndFunc
Func main()
   HotKeySet("q","exitScript")
   HotKeySet("p","timeElapsed")
   MsgBox(0,"DigBot", "Spawn an adder and hover your mouse over it! Then hit ok and select your metin2 Window." & @LF & "The bot only works when the metin2 Window is in the foreground!")
   sleep(6000)
   Run(@ScriptDir & "\autoExpo.exe")
   autoDig()
   EndFunc