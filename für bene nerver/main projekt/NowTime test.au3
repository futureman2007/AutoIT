#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here


#include <Date.au3>
$time = _NowTime(4)
;$time = "22:00"
Local $timeArray = StringSplit($time , ":")
MsgBox(0 , "Time" , $timeArray[1] & " And " & $timeArray[2] )
$test1 = $timeArray[1] -2
$test2 = $timeArray[2] -14
MsgBox(0 , "Time" , $test1 & " " & $test2)