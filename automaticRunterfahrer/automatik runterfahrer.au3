 #cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         Futureman2007

 Script Function:
	Automaticly shout down service. User enters a duration time to wait until the System shuts down.

#ce ----------------------------------------------------------------------------
;Settings and Global Variables
#RequireAdmin
#include <GUIConstantsEx.au3>
Global $boxTitle = "Auto Runterfahrer"

#cs
Those variables will be used in _runterfahren() for the time calculation
#ce
Global $trigger = 0
Global $TimeHG = 0
Global $TimeMinG = 0
Global $TimeSecG = 0
Global $timeSleep = 0

;returns an int of miliseconds, containing the time in milisec
; Script Start

#cs===============================================================================
  Function Name:    _runterfahren()
  Description:      Shut down the Computer after a user specified time. There are three components: Hour, minutes, seconds wich the user can type in
  Parameter(s):		nune
  Working/Using:	Global $TimeHG - after x hours and
   					Global $TimeMinG - after x minutes and
                    Global $TimeSecG - after x seconds system shell shout down
  Requirement(s):   none.
  Return Value(s):  none.
  Author(s):        Futureman2007
#ce===============================================================================
func _runterfahren()

if($TimeHG == 0 And $TimeMinG == 0 And $TimeSecG == 0) Then
   $TimeMinG = 3
EndIf
Local $hours = 0
Local $minutes = 0
Local $seconds = 0
Local $status = 0
Local $Box = GUICreate($boxTitle, 750,400)
Local $LabelBox = GUICtrlCreateLabel($timeSleep,50,50,700,200,-1,-1)
GUICtrlSetFont($LabelBox, 160)
Local $ButtonPause = GUICtrlCreateButton("Uhr Pausieren",30, 370, 85, 25)
Local $ButtonH = GUICtrlCreateButton("+1h",120, 370, 85, 25)
Local $ButtonM5 = GUICtrlCreateButton("+5min",210, 370, 85, 25)
Local $ButtonM10 = GUICtrlCreateButton("+10min",300, 370, 85, 25)
Local $ButtonM15 = GUICtrlCreateButton("+15min",390, 370, 85, 25)
Local $ButtonM30 = GUICtrlCreateButton("+30min",480, 370, 85, 25)
Local $ButtonExit = GUICtrlCreateButton("Beenden" ,570,370,85,25)
Local $Event = 0
Opt("GUIOnEventMode", 1)

GUICtrlSetOnEvent($ButtonPause,"_pausePressed")
GUICtrlSetOnEvent($ButtonH, "_plus1H")
GUICtrlSetOnEvent($ButtonM5, "_plus5M")
GUICtrlSetOnEvent($ButtonM10,"_plus10M")
GUICtrlSetOnEvent($ButtonM15,"_plus15M")
GUICtrlSetOnEvent($ButtonM30,"_plus30M")
GUICtrlSetOnEvent($ButtonExit,"_exit")
GUISetOnEvent($GUI_EVENT_CLOSE,"_exit")

_correctTime()

If $TimeHG > 0 Then
   Local $hours = $TimeHG * 60 * 60
EndIf

If $TimeMinG > 0 Then
   Local $minutes = $TimeMinG * 60
EndIf

If $TimeSecG > 0 Then
   Local $seconds = $TimeSecG
EndIf

$timeSleep =  $hours + $minutes + $seconds
$status = MsgBox(1, $boxTitle, "Fahre nach: " & @LF & $TimeHG & "h" & @LF & $TimeMinG & "min " & @LF  & $TimeSecG & "sek" & @LF & "herunter", 5)

; When user hits cancel button, MsgBox returns value 2
If $status == 2 Then
   MsgBox(0, $boxTitle, "Breche ab", 5)
   $status = 0
   Exit
EndIf

GUISetState(@SW_SHOW)


While ($timeSleep > 0)
   if $trigger == 0 Then
	  $TimeSecG = $TimeSecG - 1
   EndIf

   if($TimeSecG < 0) Then
	  $TimeSecG = 59
	  $TimeMinG = $TimeMinG - 1
	  if($TimeMinG < 0) Then
		 $TimeMinG = 59
		 $TimeHG = $TimeHG -1
		 EndIf
	  EndIf
   $timeSleep = $timeSleep - 1
   GUICtrlSetData($LabelBox,$TimeHG & ":" & $TimeMinG & ":" & $TimeSecG)
   Sleep(998)
WEnd
; When user hits cancel button, MsgBox returns value 2
Shutdown(1)
   EndFunc

;===============================================================================
;
; Function Name:    _correctTime()
; Description:      Correct the time ( make sure, that there are no eg. 62 minutes and / or seconds)
; Parameter(s):     none
;  					- Uses and changes values of Globals: $TimeHG, $TimeMinG, $TimeSecG
; Requirement(s):   Global Variables must be set with _runterfahren()
; Return Value(s):  none.
; Author(s):        Futureman2007
; INTERNAL USE ONLY
;===============================================================================
Func _correctTime()
   If $TimeSecG >= 60 Then
	  Local $counter = 0
	  While ($TimeSecG >= 60)
		 $TimeSecG = $TimeSecG - 60
		 $counter = $counter + 1
	  WEnd
	  $TimeMinG = $TimeMinG + $counter
	  $counter = 0
   EndIf

   If $TimeMinG >= 60 Then
	  Local $counter = 0
	  While ($TimeMinG >= 60)
		 $TimeMinG = $TimeMinG - 60
		 $counter = $counter + 1
	  WEnd
	  $TimeHG = $TimeHG + $counter
	  $counter = 0
   EndIf
EndFunc
#cs
;===============================================================================

 EVENT HANDLING FUNCTIONS
 Description:      Functions for the action performed after a certain button is pressed
 Function(s):		_pausePressed()
					_plus1H() --> add 1 to $TimeHG
					_plus5M() --> add 05 to $TimeMinG -> call correctTime() if $TimeMinG >= 60
				    _plus10M()--> add 10 to $TimeMinG -> call correctTime() if $TimeMinG >= 60
					_plus15M()--> add 15 to $TimeMinG -> call correctTime() if $TimeMinG >= 60
					_plus30M()--> add 30 to $TimeMinG -> call correctTime() if $TimeMinG >= 60
					_exit() --> close window and exit scriptand
 Requirement(s):   Buttons must exist -> _runterfahren() already was called
 Return Value(s):  none.
 Author(s):        Futureman2007
;===============================================================================
#ce
Func _pausePressed()
   If($trigger == 0) Then
	  $trigger = 1
   Else
	  $trigger = 0
   EndIf

EndFunc

Func _plus1H()
   $TimeHG = $TimeHG + 1
   $timeSleep = $timeSleep + ($TimeHG *60 * 60)
EndFunc

Func _plus5M()
   $TimeMinG = $TimeMinG + 5
   $timeSleep = $timeSleep + ($TimeMinG *60)
   _correctTime()
EndFunc

Func _plus10M()
   $TimeMinG = $TimeMinG + 10
   $timeSleep = $timeSleep + ($TimeMinG *60)
   _correctTime()
EndFunc

Func _plus15M()
   $TimeMinG = $TimeMinG + 15
   $timeSleep = $timeSleep + ($TimeMinG *60)
   _correctTime()
EndFunc
Func _plus30M()
   $TimeMinG = $TimeMinG + 30
   $timeSleep = $timeSleep + ($TimeMinG *60)
   _correctTime()
EndFunc
Func _exit()
   GUIDelete()
   Exit
EndFunc

;===============================================================================
;
; Function Name:    _checkInputAndShutDown
; Description:      checks the user typed input, if it is:
;						a) in a correct format
;						b) in correct values (only ints)
;				    Negative Integers will be automaticly convertet to unsigned ints (*-1)
;					and then calls _runterfahren() to shut down the computer
;
; Parameter(s):     $inputString - the user input String representation
; Requirement(s):   Using Local $inputArrInt as Int Array representation of the $inputString
; Return Value(s):  1 - success
;				    -1 - error
; Author(s):        Futureman2007
;Comment:			Inputs like: "Not a Number" are read as: "0:0:0"
;===============================================================================

Func _checkInputAndShutDown($inputString)
   Local $inputArrInt[3]
   Local $tmp
   If IsString($inputString <> 1) Then
	  $inputString = String($inputString)
   EndIf
   Local $inputArr = StringSplit($inputString, ".")

   If $inputArr[0] <> 3 Then
		 return -1
   EndIf
	  For $i = 1 To (Int($inputArr[0]))
		 $tmp =  Int($inputArr[$i])
		 $inputArrInt[$i -1] = $tmp
		 If $inputArrInt[$i -1] < 0 Then
			$inputArrInt[$i -1] = ( $inputArrInt[$i] ) * -1
		 EndIf
	  Next
	  ; $inputArr[0] and $inputArrInt[0] containing the amount of elements
	  $TimeHG = $inputArrInt[0]
	  $TimeMinG = $inputArrInt[1]
	  $TimeSecG = $inputArrInt[2]
	  _runterfahren()
	  return 1
	  EndFunc

   func main()
	  while 1
		 $userInput = InputBox($boxTitle , "gib ein, nach wie vielen " & @LF & "<stunden>.<minuten>.<sekunden>" & @LF & "ich herunterfahren soll!" & @LF & "( Bitte beachte das Format!)")
		 IF @error == 1 Then
			ExitLoop
		 EndIf
		 $status = _checkInputAndShutDown($userInput)
		 ; cancel button @ InputBox was pressed

		 If $status == -1 Then
			MsgBox(0,$boxTitle,"ungueltige eingabe!"& @LF &" Eine richtige Eingabe wäre zum Beispiel: 0.5.20" & @LF & "--> dies waere Runterfahren nach 0 Stunden 5 Minuten und 20 Sekunden", 20)
		 Else ; dead code
			ExitLoop
		 EndIf

	  WEnd
   EndFunc
   ;Execution section
#include <GUIConstantsEx.au3>
 #include <GUIConstantsEx.au3>

;Example()
 main()
