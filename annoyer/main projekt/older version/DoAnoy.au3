#include <Misc.au3>
#include <MsgBoxConstants.au3>

#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#cs
   Neustart

#ce
;#NoTrayIcon
Break(0);
Func _Restart(); func 1
   sleep(200)
   MsgBox(0, "Your Computer", "I had enough... good night..." ,5);
   WinClose("[CLASS:Progman]");
   WinWaitActive("[CLASS:Progman]");
   If WinExists("[CLASS:#32770]") Then
	  WinActivate("[CLASS:#32770]")
	  Send("{ENTER}");
   EndIf
EndFunc

Func _SuccFPS(); func 2
   $rdm = "NEW STRING OF PURE NOTHING SENSENESS BRO! 34tgrg3 fggt"
   For $a = 1 To 90000000
	  $rdm = $rdm + $rdm + $rdm + $rdm + $rdm + $rdm;
   Next
EndFunc

Func _MsgboxSpammer() ; func 3
   For $a=1 To Round(Random(1 , 120))
		 MsgBox(0 , "L O L" , "Spam");
		 If _IsPressed("0D") Then
			MsgBox(0, "No... just no...", "ohh.. you think u r smart? PUNISHMENT!" , 5);
			_Restart();
			ExitLoop
		 EndIf
   Next
EndFunc

Func _jumpBtwTabs() ; func 4
  For $a = 1 To Round(Random(4 , 8))
   Send("{ALT down}")
   sleep(50)
   Send("{TAB down}")
   sleep(50)
   Send("{TAB up}")
   sleep(50)
   Send("{TAB down}")
   sleep(50)
   Send("{TAB up}")
   sleep(50)
   Send("{ALT up}")
   Next
EndFunc

Func _rotateScreen(); NOTE: DOES NOT WORK ON EVRY SYSTEM Func 5
   Send("{LCTRL down}")
      sleep(50)
   Send("{ALT down}")
      sleep(50)
   Send("{LEFT down}")
      sleep(50)
   Send("{LEFT up}")
      sleep(50)
   Send("{LCTRL up}")
      sleep(50)
   Send("{RCTRL up}")
      sleep(50)
   Send("{ALT up}")
	  sleep(50)
   Send("{LCTRL up}")
      sleep(50)
   Send("{RCTRL up}")
   ; kinda buggy..... it doenst release ctrl
EndFunc

#cs
   main methode
#ce

$MAX_RANDOM_ZAHL = 2

Func _main();
   $rdm = Random(1 , $MAX_RANDOM_ZAHL)
   $rdm = 5;
   $rdm = Round($rdm);

   Switch $rdm
	  Case 1
		 _Restart();
	  Case 2
		 _SuccFPS();
	  Case 3
		 _MsgboxSpammer();
	  Case 4
		 _jumpBtwTabs();
	  Case 5
	    _rotateScreen();

   EndSwitch
EndFunc;

_main();