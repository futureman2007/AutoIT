#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
$adderLife = 10* 60 ; ader time in seconds (here 10 minutes) after that you need to buy a new adder (and spawn it)
#RequireAdmin
while(1)
	  send( "{^}" )
	  sleep(100)
	  send( "{^}" )
	  sleep(100)
	  send( "{^}" )
	  sleep(100)
	  send( "{^}" )
	  sleep(100)
	  send( "{^}" )
	  sleep(100)
	  send( "{^}" )
	  sleep(100)
	  send( "{^}" )
	  sleep(100)
	  send( "{^}" )
	  sleep(100)
	  send( "{^}" )
	  sleep(100)
	  send( "{^}" )
	  sleep(100)
	  send( "{^}" )
	  sleep(999)
	  $adderLife = $adderLife - 2
	  if($adderLife <= 0) Then
		 send("p")
		 $adderLife = 10 * 1000* 60 ; ader time in millsekonds (here 10 minutes) after that you need to buy a new adder (and spawn it)
	  EndIf
WEnd