INCLUDE Irvine32.inc

.data
;----------------------------
; Substitution Box
; Used when encrypting the block
SUB_BOX BYTE 63h, 7ch, 77h, 7bh, 0f2h, 6bh, 6fh, 0c5h, 30h, 01h, 67h, 2bh, 0feh, 0d7h, 0abh, 76h
BYTE 0cah, 82h, 0c9h, 7dh, 0fah, 59h, 47h, 0f0h, 0adh, 0d4h, 0a2h, 0afh, 9ch, 0a4h, 72h, 0c0h
BYTE 0b7h, 0fdh, 93h, 26h, 36h, 3fh, 0f7h, 0cch, 34h, 0a5h, 0e5h, 0f1h, 71h, 0d8h, 31h, 15h
BYTE 04h, 0c7h, 23h, 0c3h, 18h, 96h, 05h, 9ah, 07h, 12h, 80h, 0e2h, 0ebh, 27h, 0b2h, 75h
BYTE 09h, 83h, 2ch, 1ah, 1bh, 6eh, 5ah, 0a0h, 52h, 3bh, 0d6h, 0b3h, 29h, 0e3h, 2fh, 84h
BYTE 53h, 0d1h, 00h, 0edh, 20h, 0fch, 0b1h, 5bh, 6ah, 0cbh, 0beh, 39h, 4ah, 4ch, 58h, 0cfh
BYTE 0d0h, 0efh, 0aah, 0fbh, 43h, 4dh, 33h, 85h, 45h, 0f9h, 02h, 7fh, 50h, 3ch, 9fh, 0a8h
BYTE 51h, 0a3h, 40h, 8fh, 92h, 9dh, 38h, 0f5h, 0bch, 0b6h, 0dah, 21h, 10h, 0ffh, 0f3h, 0d2h
BYTE 0cdh, 0ch, 13h, 0ech, 5fh, 97h, 44h, 17h, 0c4h, 0a7h, 7eh, 3dh, 64h, 5dh, 19h, 73h
BYTE 60h, 81h, 4fh, 0dch, 22h, 2ah, 90h, 88h, 46h, 0eeh, 0b8h, 14h, 0deh, 5eh, 0bh, 0dbh
BYTE 0e0h, 32h, 3ah, 0ah, 49h, 06h, 24h, 5ch, 0c2h, 0d3h, 0ach, 62h, 91h, 95h, 0e4h, 79h
BYTE 0e7h, 0c8h, 37h, 6dh, 8dh, 0d5h, 4eh, 0a9h, 6ch, 56h, 0f4h, 0eah, 65h, 7ah, 0aeh, 08h
BYTE 0bah, 78h, 25h, 2eh, 1ch, 0a6h, 0b4h, 0c6h, 0e8h, 0ddh, 74h, 1fh, 4bh, 0bdh, 8bh, 8ah
BYTE 70h, 3eh, 0b5h, 66h, 48h, 03h, 0f6h, 0eh, 61h, 35h, 57h, 0b9h, 86h, 0c1h, 1dh, 9eh
BYTE 0e1h, 0f8h, 98h, 11h, 69h, 0d9h, 8eh, 94h, 9bh, 1eh, 87h, 0e9h, 0ceh, 55h, 28h, 0dfh
BYTE 8ch, 0a1h, 89h, 0dh, 0bfh, 0e6h, 42h, 68h, 41h, 99h, 2dh, 0fh, 0b0h, 54h, 0bbh, 16h
; ---------------------------


; ---------------------------
; Inverse Substitution Box
; Used when decrypting the block
INV_SUB_BOX BYTE 52h, 09h, 6ah, 0d5h, 30h, 36h, 0a5h, 38h, 0bfh, 40h, 0a3h, 9eh, 81h, 0f3h, 0d7h, 0fbh
BYTE 7ch, 0e3h, 39h, 82h, 9bh, 2fh, 0ffh, 87h, 34h, 8eh, 43h, 44h, 0c4h, 0deh, 0e9h, 0cbh
BYTE 54h, 7bh, 94h, 32h, 0a6h, 0c2h, 23h, 3dh, 0eeh, 4ch, 95h, 0bh, 42h, 0fah, 0c3h, 4eh
BYTE 08h, 2eh, 0a1h, 66h, 28h, 0d9h, 24h, 0b2h, 76h, 5bh, 0a2h, 49h, 6dh, 8bh, 0d1h, 25h
BYTE 72h, 0f8h, 0f6h, 64h, 86h, 68h, 98h, 16h, 0d4h, 0a4h, 5ch, 0cch, 5dh, 65h, 0b6h, 92h
BYTE 6ch, 70h, 48h, 50h, 0fdh, 0edh, 0b9h, 0dah, 5eh, 15h, 46h, 57h, 0a7h, 8dh, 9dh, 84h
BYTE 90h, 0d8h, 0abh, 00h, 8ch, 0bch, 0d3h, 0ah, 0f7h, 0e4h, 58h, 05h, 0b8h, 0b3h, 45h, 06h
BYTE 0d0h, 2ch, 1eh, 8fh, 0cah, 3fh, 0fh, 02h, 0c1h, 0afh, 0bdh, 03h, 01h, 13h, 8ah, 6bh
BYTE 3ah, 91h, 11h, 41h, 4fh, 67h, 0dch, 0eah, 97h, 0f2h, 0cfh, 0ceh, 0f0h, 0b4h, 0e6h, 73h
BYTE 96h, 0ach, 74h, 22h, 0e7h, 0adh, 35h, 85h, 0e2h, 0f9h, 37h, 0e8h, 1ch, 75h, 0dfh, 6eh
BYTE 47h, 0f1h, 1ah, 71h, 1dh, 29h, 0c5h, 89h, 6fh, 0b7h, 62h, 0eh, 0aah, 18h, 0beh, 1bh
BYTE 0fch, 56h, 3eh, 4bh, 0c6h, 0d2h, 79h, 20h, 9ah, 0dbh, 0c0h, 0feh, 78h, 0cdh, 5ah, 0f4h
BYTE 1fh, 0ddh, 0a8h, 33h, 88h, 07h, 0c7h, 31h, 0b1h, 12h, 10h, 59h, 27h, 80h, 0ech, 5fh
BYTE 60h, 51h, 7fh, 0a9h, 19h, 0b5h, 4ah, 0dh, 2dh, 0e5h, 7ah, 9fh, 93h, 0c9h, 9ch, 0efh
BYTE 0a0h, 0e0h, 3bh, 4dh, 0aeh, 2ah, 0f5h, 0b0h, 0c8h, 0ebh, 0bbh, 3ch, 83h, 53h, 99h, 61h
BYTE 17h, 2bh, 04h, 7eh, 0bah, 77h, 0d6h, 26h, 0e1h, 69h, 14h, 63h, 55h, 21h, 0ch, 7dh
; ---------------------------

Rconstant BYTE 01h, 02h, 04h, 08h, 10h, 20h, 40h, 80h, 1bh, 36h

key BYTE 2Bh, 7Eh, 15h, 16h, 28h, 0AEh, 0D2h, 0A6h, 0ABh, 0F7h, 15h, 88h, 09h, 0CFh, 4Fh, 3Ch
roundkeys BYTE 176 dup(0)
temp BYTE 4 dup(0)

state_matrix BYTE 32h, 43h, 0f6h, 0a8h, 88h, 5ah, 30h, 8dh, 31h, 31h, 98h, 0a2h, 0e0h, 37h, 07h, 34h
temp_state_matrix BYTE 16 dup(0)


.code
; ---------------------------
main PROC
;
; Main function that calls other functions
; ---------------------------
call key_expansion
mov esi, OFFSET roundkeys
mov ecx, 176
mov ebx, 1 ; TYPE temp_state_matrix
call Dumpmem
call aes_encryption
mov esi, OFFSET state_matrix
mov ecx, 16
mov ebx, 1 ; TYPE temp_state_matrix
call Dumpmem
exit
main ENDP







; ---------------------------
aes_encryption PROC
; Combines all methods to perform the AES encryption
; Receives: nothing
; Returns: nothing
; ---------------------------
mov ebx, 0
call add_round_key
mov ecx, 9

encrypt_rounds:

	call sub_bytes
	call shift_rows
	call mix_columns
	inc ebx
	call add_round_key
Loop encrypt_rounds

call sub_bytes
call shift_rows
inc ebx
call add_round_key


ret
aes_encryption ENDP





; ---------------------------
key_expansion PROC USES EAX EBX ECX EDX ESI EDI
;
; Key Scheduler that expands the 16 byte key to 176 byte key
; Receives: nothing
; Returns: nothing
; ---------------------------


mov edi, OFFSET roundkeys
mov esi, OFFSET key
mov ecx, 16
first_16:
	mov bl, [esi]
	mov [edi], bl
	inc esi
	inc edi
	Loop first_16

push edi
sub edi, 4
mov esi, edi ; esi = last4bytes
pop edi
mov edx, 0
mov eax, 0
rounds:
	cmp edx, 10
	jae end_key_expansion
	mov ecx, OFFSET SUB_BOX
	push ebx
	push edi
	mov edi, OFFSET temp
	mov al, [esi]
	inc esi
	mov bl, [ecx + eax]
	mov [edi + 3], bl  ; temp[3] = SBOX[*last4bytes++];
	mov al, [esi]
	inc esi
	mov bl, [ecx + eax]
	mov [edi], bl ; temp[0] = SBOX[*last4bytes++];
	mov al, [esi]
	inc esi
	mov bl, [ecx + eax]
	mov [edi + 1], bl
	mov al, [esi]
	inc esi
	mov bl, [ecx + eax]
	mov [edi + 2], bl
	mov ecx, OFFSET Rconstant
	mov bl, [ecx + edx] ; mov ebx, Rc[i]
	xor [edi], bl
	pop edi
	pop ebx
	
	push edi
	;sub edi, 4  
	;mov esi, edi ; esi = last4bytes
	sub edi, 16
	mov ebx, edi
	pop edi


	push esi ; to store the temp address
	mov esi, OFFSET temp

	mov cl, [ebx] ; *roundkeys++ = temp[0] ^ *lastround++;
	xor [esi], cl
	mov cl, [esi]
	mov [edi], cl
	inc ebx
	inc edi

	mov cl, [ebx] ; *roundkeys++ = temp[1] ^ *lastround++;
	xor [esi+1], cl
	mov cl, [esi+1]
	mov [edi], cl
	inc ebx
	inc edi

	mov cl, [ebx] ; *roundkeys++ = temp[2] ^ *lastround++;
	xor [esi+2], cl
	mov cl, [esi+2]
	mov [edi], cl
	inc ebx
	inc edi

	mov cl, [ebx] ; *roundkeys++ = temp[3] ^ *lastround++;
	xor [esi+3], cl
	mov cl, [esi+3]
	mov [edi], cl
	inc ebx
	inc edi

	pop esi

	; k4-k7 for next round
	; ebx = lastround
	; esi = last4bytes
	; edi = roundkeys


mov ecx, 12
expand_loop:

	push ecx
	mov cl, [ebx] ; *roundkeys++ = *last4bytes++ ^ *lastround++;
	mov ch, [esi]
	xor cl, ch
	mov [edi], cl
	inc esi
	inc ebx
	inc edi
	pop ecx
	Loop expand_loop


	inc edx ; increment counter
	jmp rounds
end_key_expansion:

ret
key_expansion ENDP







; ---------------------------
add_round_key PROC USES EAX EBX ECX EDX ESI EDI
; Receives: ebx = round no e.g 0, 1, 2, ...
; Returns: nothing
; 
; ---------------------------
mov esi, OFFSET roundkeys
mov edi, OFFSET state_matrix
get_round_offset:
	cmp ebx, 0
	jz got_round_offset
	add esi, 16
	dec ebx
	jmp get_round_offset
got_round_offset:


mov ecx, 16
add_key_loop:
	mov bl, [esi]
	xor [edi], bl
	inc esi
	inc edi
	Loop add_key_loop


ret
add_round_key ENDP





; ---------------------------
sub_bytes PROC USES EAX EBX ECX EDX ESI EDI
; 
; Substitute the block bytes to the predefined bytes table
; receives: nothing
; Returns: nothing
; ---------------------------
mov esi, OFFSET state_matrix
mov edi, OFFSET SUB_BOX
mov ebx, 0
mov ecx, 16
sub_bytes_loop:
	mov bl, [esi]
	mov al, [edi + ebx]
	mov [esi], al
	inc esi
	Loop sub_bytes_loop



ret
sub_bytes ENDP


; ---------------------------
inv_sub_bytes PROC
; 
; Substitute the block bytes to the predefined bytes table
; receives: nothing
; Returns: nothing
; ---------------------------
mov esi, OFFSET state_matrix
mov edi, OFFSET INV_SUB_BOX
mov ebx, 0
mov ecx, 16
inv_sub_bytes_loop:
	mov bl, [esi]
	mov al, [edi + ebx]
	mov [esi], al
	inc esi
	Loop inv_sub_bytes_loop
ret
ret
inv_sub_bytes ENDP





;Row0: s0  s4  s8  s12   <<< 0 byte
;Row1: s1  s5  s9  s13   <<< 1 byte
;Row2: s2  s6  s10 s14   <<< 2 bytes
;Row3: s3  s7  s11 s15   <<< 3 bytes
; ---------------------------
shift_rows PROC USES EAX EBX ECX EDX ESI EDI
;
; Shift rows of the state matrix
; Receives: nothing
; Returns: nothing
; ---------------------------

mov esi, OFFSET state_matrix

; row 1 (starting from row 0)
mov bl, [esi + 1]
xchg [esi + 5], bl
mov [esi + 1], bl

mov bl, [esi + 5]
xchg [esi + 9], bl
mov [esi + 5], bl

mov bl, [esi + 9]
xchg [esi + 13], bl
mov [esi + 9], bl

; row 2
mov bl, [esi + 2]
xchg [esi + 10], bl
mov [esi + 2], bl

mov bl, [esi + 6]
xchg [esi + 14], bl
mov [esi + 6], bl

; row 3
mov bl, [esi + 15]
xchg [esi + 11], bl
mov [esi + 15], bl

mov bl, [esi + 11]
xchg [esi + 7], bl
mov [esi + 11], bl

mov bl, [esi + 7]
xchg [esi + 3], bl
mov [esi + 7], bl



ret
shift_rows ENDP




; ---------------------------
inv_shift_rows PROC USES EAX EBX ECX EDX ESI EDI
;
; inverts the row shifts of the state matrix
; Receives: nothing
; Returns: nothing
; ---------------------------

mov esi, OFFSET state_matrix

; row 1 (starting from row 0)
mov bl, [esi + 13]
xchg [esi + 9], bl
mov [esi + 13], bl

mov bl, [esi + 9]
xchg [esi + 5], bl
mov [esi + 9], bl

mov bl, [esi + 5]
xchg [esi + 1], bl
mov [esi + 5], bl

; row 2
mov bl, [esi + 8]
xchg [esi + 10], bl
mov [esi + 8], bl

mov bl, [esi + 9]
xchg [esi + 11], bl
mov [esi + 9], bl

; row 3
mov bl, [esi + 3]
xchg [esi + 7], bl
mov [esi + 3], bl

mov bl, [esi + 7]
xchg [esi + 11], bl
mov [esi + 7], bl

mov bl, [esi + 11]
xchg [esi + 15], bl
mov [esi + 11], bl

ret
inv_shift_rows ENDP




; ---------------------------
mix_columns PROC USES EAX EBX ECX EDX ESI EDI
;
; This function performs the column mixing step in the algorithm
;
;  [ 02 03 01 01 ]
;  [ 01 02 03 01 ] * state matrix 
;  [ 01 01 02 03 ]
;  [ 03 01 01 02 ]
;
; This function essentially performs the above multiplication
; but in Galois-Field of 2^8. i.e the multiplication result
; remains in 8 bits. The given matrix is in the encryption standard
;
; Receives: nothing
; Returns: nothing
; Modifies: state_matrix and temp_state_matrix in data segment
; ---------------------------
mov esi, OFFSET state_matrix
mov edi, OFFSET temp_state_matrix
mov ecx, 4
mix_row1:
	push ecx
	mov bl, 02h
	mov cl, [esi]
	call gmul
	mov dl, al
	mov bl, 03h
	mov cl, [esi+1]
	call gmul
	xor dl, al
	mov bl, 01h
	mov cl, [esi+2]
	call gmul
	xor dl, al
	mov bl, 01h
	mov cl, [esi+3]
	call gmul
	xor dl, al
	mov [edi], dl
	add edi, 4 ;--------------
	add esi, 4
	pop ecx
	Loop mix_row1

mov esi, OFFSET state_matrix
mov edi, OFFSET temp_state_matrix
mov ecx, 4
mix_row2:
	push ecx
	mov bl, 01h
	mov cl, [esi]
	call gmul
	mov dl, al
	mov bl, 02h
	mov cl, [esi+1]
	call gmul
	xor dl, al
	mov bl, 03h
	mov cl, [esi+2]
	call gmul
	xor dl, al
	mov bl, 01h
	mov cl, [esi+3]
	call gmul
	xor dl, al
	mov [edi + 1], dl
	add edi, 4 ; -------------------------
	add esi, 4
	pop ecx
	Loop mix_row2


mov esi, OFFSET state_matrix
mov edi, OFFSET temp_state_matrix
mov ecx, 4
mix_row3:
	push ecx
	mov bl, 01h
	mov cl, [esi]
	call gmul
	mov dl, al
	mov bl, 01h
	mov cl, [esi+1]
	call gmul
	xor dl, al
	mov bl, 02h
	mov cl, [esi+2]
	call gmul
	xor dl, al
	mov bl, 03h
	mov cl, [esi+3]
	call gmul
	xor dl, al
	mov [edi + 2], dl
	add edi, 4 ; -------------------
	add esi, 4
	pop ecx
	Loop mix_row3


mov esi, OFFSET state_matrix
mov edi, OFFSET temp_state_matrix
mov ecx, 4
mix_row4:
	push ecx
	mov bl, 03h
	mov cl, [esi]
	call gmul
	mov dl, al
	mov bl, 01h
	mov cl, [esi+1]
	call gmul
	xor dl, al
	mov bl, 01h
	mov cl, [esi+2]
	call gmul
	xor dl, al
	mov bl, 02h
	mov cl, [esi+3]
	call gmul
	xor dl, al
	mov [edi + 3], dl
	add edi, 4
	add esi, 4
	pop ecx
	Loop mix_row4
	
	call cpy_to_state_matrix



ret
mix_columns ENDP



; ---------------------------
inv_mix_columns PROC USES EAX EBX ECX EDX ESI EDI
;
; This function performs the column mixing step in the algorithm
;
;  [ 0e 0b 0d 09 ]
;  [ 09 0e 0b 0d ] * state matrix 
;  [ 0d 09 0e 0b ]
;  [ 0b 0d 09 0e ]
;
; This function essentially performs the above multiplication
; but in Galois-Field of 2^8. i.e the multiplication result
; remains in 8 bits. The given matrix is in the encryption standard
;
; Receives: state_matrix in data segment
; Returns: state_matrix after mixing columns
; ---------------------------

mov esi, OFFSET state_matrix
mov edi, OFFSET temp_state_matrix
mov ecx, 4
inv_mix_row1:
	push ecx
	mov bl, 0eh
	mov cl, [esi]
	call gmul
	mov dl, al
	mov bl, 0bh
	mov cl, [esi+4]
	call gmul
	xor dl, al
	mov bl, 0dh
	mov cl, [esi+8]
	call gmul
	xor dl, al
	mov bl, 09h
	mov cl, [esi+12]
	call gmul
	xor dl, al
	mov [edi], dl
	inc edi
	inc esi
	pop ecx
	Loop inv_mix_row1



mov esi, OFFSET state_matrix
mov edi, OFFSET temp_state_matrix
mov ecx, 4
inv_mix_row2:
	push ecx
	mov bl, 09h
	mov cl, [esi]
	call gmul
	mov dl, al
	mov bl, 0eh
	mov cl, [esi+4]
	call gmul
	xor dl, al
	mov bl, 0bh
	mov cl, [esi+8]
	call gmul
	xor dl, al
	mov bl, 0dh
	mov cl, [esi+12]
	call gmul
	xor dl, al
	mov [edi+4], dl
	inc edi
	inc esi
	pop ecx
	Loop inv_mix_row2


mov esi, OFFSET state_matrix
mov edi, OFFSET temp_state_matrix
mov ecx, 4
inv_mix_row3:
	push ecx
	mov bl, 0dh
	mov cl, [esi]
	call gmul
	mov dl, al
	mov bl, 09h
	mov cl, [esi+4]
	call gmul
	xor dl, al
	mov bl, 0eh
	mov cl, [esi+8]
	call gmul
	xor dl, al
	mov bl, 0bh
	mov cl, [esi+12]
	call gmul
	xor dl, al
	mov [edi+8], dl
	inc edi
	inc esi
	pop ecx
	Loop inv_mix_row3


mov esi, OFFSET state_matrix
mov edi, OFFSET temp_state_matrix
mov ecx, 4
inv_mix_row4:
	push ecx
	mov bl, 0bh
	mov cl, [esi]
	call gmul
	mov dl, al
	mov bl, 0dh
	mov cl, [esi+4]
	call gmul
	xor dl, al
	mov bl, 09h
	mov cl, [esi+8]
	call gmul
	xor dl, al
	mov bl, 0eh
	mov cl, [esi+12]
	call gmul
	xor dl, al
	mov [edi+12], dl
	inc edi
	inc esi
	pop ecx
	Loop inv_mix_row4
	
	call cpy_to_state_matrix

ret
inv_mix_columns ENDP




; ---------------------------
cpy_to_state_matrix PROC USES EAX EBX ECX EDX ESI EDI
;
; Copies the temp_state_matrix to state_matrix
; Receives: nothing
; Returns: nothing
; ---------------------------
mov esi, OFFSET state_matrix
mov edi, OFFSET temp_state_matrix
mov ecx, 16
copy_loop:
	mov bl, [edi]
	mov [esi], bl
	inc edi
	inc esi
Loop copy_loop

ret
cpy_to_state_matrix ENDP



; ---------------------------
gmul PROC USES EBX ECX
; Computes the finite field multiplication of two numbers in GF(2^8)
; Using the Russian Peasant Multiplication Algorithm
; Receives: BL, CL
; Returns: AL = Product
; ---------------------------
mov al, 0
gmul_while:
	cmp bl, 0
	jz end_gmul  ; end while
	cmp cl, 0
	jz end_gmul  ; end while
	test cl, 01h
	jz skip_if
	xor al, bl
	skip_if:
	test bl, 80h
	jz skip_if2
	shl bl, 1
	xor bl, 1bh
	jmp shift_cl
	skip_if2:
	shl bl, 1
	shift_cl:
	shr cl, 1
	jmp gmul_while
end_gmul:
ret
gmul ENDP

End main