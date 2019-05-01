^c:: ; Bind to CTRL + C
	Clipboard := "" ; Clear the clipboard
	Suspend ; suspend the script so sending CTRL + C in next line doesn't start the circular call to CTRL + C
	Send ^c ; send CTRL + C
	if (Clipboard = "") { ; clipboard is empty because there was no selection. Hence, start the copy a line process
		MouseGetPos mousePosX,mousePosY ; Get mouse position
		insertionPosX := A_CaretX ; Get insertion position X
		insertionPosY := A_CaretY ; Get insertion position Y
		Send {Home}{Shift down}{End}{Shift up}
		Send ^c ; Copy the line from beginning to end
		Sleep 10
		MouseMove, insertionPosX, insertionPosY, 0 ; move mouse to previous insertion position
		Click ; basically restore insertion position
		MouseMove, mousePosX, mousePosY, 0 ; Restore mouse position
		ClipSaved =   ; Free the memory in case the clipboard was very large.
	}
	Suspend ; unsuspend the script
	Return ; done.
	
^x:: ; Bind to CTRL + X
	Clipboard := "" ; Clear the clipboard
	Suspend ; suspend this script so sending CTRL + X in next line doesn't start a circular call to CTRL + X
	Send ^x ; send CTRL + X
	if (Clipboard = "") { ; clipboard is empty because there was no selection. Hence, start cut-a-line process
		MouseGetPos mousePosX,mousePosY ; Get mouse position
		insertionPosX := A_CaretX ; Get insertion position X
		insertionPosY := A_CaretY ; Get insertion position Y
		Send {Home}{Ctrl down}{Left}{Ctrl up}
		Send {Shift down}{Down}{Shift up}		
		Send ^x
		Sleep 10
		MouseMove, insertionPosX, insertionPosY, 0 ; move mouse to previous insertion position
		Click ; basically restore insertion position		
		MouseMove, mousePosX, mousePosY, 0 ; Restore mouse position
		ClipSaved =   ; Free the memory in case the clipboard was very large.
	}
	Suspend ; unsuspend the script
	Return ; done.
