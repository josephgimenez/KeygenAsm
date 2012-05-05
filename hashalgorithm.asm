.586
.model flat, stdcall
option casemap:none

;include \masm32\include\windows.inc
;include \masm32\include\kernel32.inc
;includelib \masm32\lib\kernel32.lib
;include \masm32\include\user32.inc
;includelib \masm32\lib\user32.lib
;include \masm32\include\msvcrt.inc
;includelib  \masm32\lib\msvcrt.lib
;includelib masm32.lib
;include masm32.inc

hashProc PROTO C n:DWORD

.data
;Username prompt
Prompt db "Enter Name: ", 0
;Will hold generated password
HashBuffer db 100h dup(0)
;Will hold username typed in
UserName db 100h dup(0)

.code
	
hashProc proc C n:DWORD

mov eax, n
mov ebx, offset HashBuffer
xor ecx, ecx

hashUserName:

	movzx edx, byte ptr [eax]
	xor edx, 5Eh
	and edx, 0Fh
	shr edx, 1h
	add edx, 30h
	mov [ebx], dl
	inc eax
	inc ebx
	inc ecx
	cmp ecx, 2
	
	;ecx not 2? jump to LastCharacterCheck label
	jnz LastCharacterCheck
	
	;are we at the end of UserName string (i.e., last character + 1 position)
	cmp byte ptr [eax], 00h
	jz LastCharacterCheck
	
;add '-' to separate digits when ecx == 2
	
addDash:
	;2Dh = '-'
	mov dl, 2Dh
	
	;move 2Dh into hashed password buffer
	mov [ebx], dl
	
	;move pointer in hashed password buffer to next position
	inc ebx
	
	;reset ecx (dash) counter
	xor ecx, ecx
	
LastCharacterCheck:
	
	;are we at the end of UserName string?
	cmp byte ptr [eax], 0
	
	;if not, let's jump back up to the top of the username hash loop
	jnz hashUserName
		
	cmp ecx, 1
	
	;did ecx == 1? If not, let's clean up and print out the hash
	jnz clearAndExit
	
	;we need to append a '0' to the end of the password hash
	;it's part of the algorithm when ecx == 1 and have also reached the end of UserName
	mov dl, 30h
	mov [ebx], dl
	
clearAndExit:

	;this part isn't really necessary because our entire 
	;password hash is all 0's (100h dup(0))
	inc ebx
	xor eax, eax
	mov [ebx], eax

	;point edx to start position of our password hash buffer
	;print value to screen	
	mov edx, offset HashBuffer
	push edx

	mov eax, offset HashBuffer
	ret
	
hashProc endp
END