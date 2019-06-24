#include <Misc.au3>
#include <MsgBoxConstants.au3>

#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         myName

 Script Function:
	Template AutoIt script.

 ;DoAnoy

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#cs
   Neustart

#ce
#include <Date.au3>
#NoTrayIcon
Break(0);

;CODE TO EXECUTE


$MAX_RANDOM_ZAHL = 5
_main();


;FUNCTIONS


Func _Restart(); func 1
   sleep(200)
   MsgBox(0, "Your Computer", "I had enough... good night..." ,5);
   WinClose("[CLASS:Progman]");
   WinWaitActive("[CLASS:#32770]");
   WinActivate("[CLASS:#32770]")
	 Sleep(100);
	  Send("{ENTER}");
	   Sleep(100);
	  Send("{ENTER}");
	   Sleep(100);
	  Send("{ENTER}");
	  Sleep(100);
	  Send("{ENTER}");
	   Sleep(100);
	  Send("{ENTER}");
	   Sleep(100);
	  Send("{ENTER}");
	  Sleep(100);
	  Send("{ENTER}");
	   Sleep(100);
	  Send("{ENTER}");
	   Sleep(100);
	  Send("{ENTER}");
	  Sleep(100);
	  Send("{ENTER}");
	  Sleep(100);
	  Send("{ENTER}");
EndFunc

Func _SuccFPS(); func 2
   $rdm = "NEW STRING OF PURE NOTHING SENSENESS BRO! 34tgrg3 fggt"
   For $a = 1 To 90000000
	  $rdm = $rdm & $rdm & $rdm & $rdm & $rdm & $rdm;
   Next
EndFunc

Func _MsgboxSpammer() ; func 3
   For $a=1 To Round(Random(1 , 50))
		 MsgBox(0 , "L O L" , "Spam" , 8);
		 If _IsPressed("0D") Then
			MsgBox(0, "No... just no...", "ohh.. you think u r smart? PUNISHMENT!" , 5);
			_Restart();
			ExitLoop
		 EndIf
   Next
EndFunc

Func _jumpBtwTabs() ; func 4
  For $a = 1 To Round(Random(4 , 12))
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

#cs
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
#ce

Func _closeAtTime() ;func 6 fährt rechner runter wenn es zwischen 21:00 und 9:00 uhr ist

   $lastTime = "21:00"
   $firstTime = "09:00"
   $timeNow = _NowTime(4)
   $timeNowArray = StringSplit($timeNow , ":"); array: erster eintrag[0] ist length von array.

   If $timeNowArray[1] < 9  or $timeNowArray >= 21 Then
	  If $timeNowArray[1] <= 4  Then
		 MsgBox(0 , "Uh no!!", $timeNow & " is way to late >:C time so sleep!" , 5)
	  ElseIf $timeNowArray[1] < 9 Or $timeNowArray >= 21 Then
		 MsgBox(0 , "Uh no!!", $timeNow & " is way to soon! i wana keep sleeping!" , 5)
	  EndIf
	  sleep(200)
   WinClose("[CLASS:Progman]");
   WinWaitActive("[CLASS:#32770]");
   WinActivate("[CLASS:#32770]")
	 Sleep(100);
	  Send("{ENTER}");
	   Sleep(100);
	  Send("{ENTER}");
	   Sleep(100);
	  Send("{ENTER}");
	  Sleep(100);
	  Send("{ENTER}");
	   Sleep(100);
	  Send("{ENTER}");
	   Sleep(100);
	  Send("{ENTER}");
	  Sleep(100);
	  Send("{ENTER}");
	   Sleep(100);
	  Send("{ENTER}");
	   Sleep(100);
	  Send("{ENTER}");
	  Sleep(100);
	  Send("{ENTER}");
	  Sleep(100);
	  Send("{ENTER}");
   EndIf
EndFunc


#cs
   main methode
#ce


Func _main();
   While True
	  _closeAtTime(); checks if its earlier then 9 am or later than 9pm. if so, system will Shutdown.
	  sleep(Round(Random(1000*30, 1000*60*10 ))) ; randome zeit von 30 sek bis 10 min zu test zwecken erstmal alle 10 sek
	 $rdm = Round(Random(1 , $MAX_RANDOM_ZAHL))
	 ; $rdm = 1; debugg purpose / test purpose
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
		   ;_rotateScreen();

	  EndSwitch
   WEnd
EndFunc;

