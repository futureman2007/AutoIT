
#RequireAdmin
#comments-start
well... you need to apply admin rights to perform BlockInput. but still you can escape by ctrl  alt  and del

#comments-end
#include <Array.au3>
Global $fwMgr, $profile



Func _createFWMgrObject()
	$fwMgr = ObjCreate("HNetCfg.FwMgr")
		If Not IsObj($fwMgr) Or @error <> 0 Then Return SetError(1, 1, 0)

	$profile = $fwMgr.LocalPolicy.CurrentProfile
		If @error <> 0 Then Return SetError(1, 2, "")
		EndFunc

Func _AddAuthorizedApp($Name, $FilePath, $IPVer = 2, $Scope = 0, $Enabled = False)
	_createFWMgrObject()

	Local $authApp = ObjCreate("HNetCfg.FwAuthorizedApplication")
		If Not IsObj($authApp) Or @error <> 0 Then
			Return SetError(1, 3, "")
		Else
			Local $aApps = $profile.AuthorizedApplications
				If @error Then Return SetError(1, 4, "")
			Local $appCount = $aApps.Count
			Local $appsArray[$aApps.Count][6]
			Local $iIndex = 0

			For $app In $aApps
				If $app.Name = $Name Then Return SetError(1, 5, "")
			Next

			$authApp.Name = $Name
			$authApp.IpVersion = $IPVer
			$authApp.ProcessImageFileName = $FilePath
				If @error Then Return SetError(1, 6, "")
			$authApp.Scope = $Scope
			$authApp.Enabled = $Enabled
			$profile.AuthorizedApplications.Add($authApp)
				If @error <> 0 Then Return SetError(1, 7, "")
				   MsgBox(0 , "lol" , "AHH IT WORKED!");
		EndIf
EndFunc

Func _main()

   Local $pathScriptOther = @ScriptDir;
   MsgBox(0, "msg" ,  $pathScriptOther & "\taskmgrCloser.exe");

   _AddAuthorizedApp("taskmgrCloser.exe", $pathScriptOther ,2,0, True);
   Run($pathScriptOther & "\taskmgrCloser.exe");
EndFunc


#comments-start
TO BE EXECUTED CODE
#comments-end

main();
Exit

