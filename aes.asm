INCLUDE Irvine32.inc

.data
state_matrix BYTE 87h, 0f2h, 4dh, 97h, 6eh, 4ch, 90h, 0ech, 46h, 0e7h, 4ah, 0c3h, 0a6h, 08ch, 0d8h, 95h
temp_state_matrix BYTE 16 dup(0)

.code
; ---------------------------
main PROC
;
; Main function that calls other functions
; ---------------------------
call dumpregs
call mix_columns
mov esi, OFFSET temp_state_matrix
mov ecx, 16
mov ebx, TYPE temp_state_matrix
call Dumpmem
exit
main ENDP


; ---------------------------
mix_columns PROC
;
; This function performs the columning mixing step in the algorithm
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
; Receives: state_matrix in data segment
; Returns: state_matrix after mixing columns
; ---------------------------
call dumpregs
mov esi, OFFSET state_matrix
mov edi, OFFSET temp_state_matrix
mov ecx, 4
L1:
	mov al, [esi]
	call ff_mul2
	mov dl, al
	mov al, [esi + 4]
	call ff_mul3
	xor al, dl
	xor al, [esi + 8]
	xor al, [esi + 12]
	mov [edi], al
	inc edi
	inc esi
	Loop L1
call dumpregs ;------
mov esi, OFFSET state_matrix
mov edi, OFFSET temp_state_matrix
mov ecx, 4
mov dl, 0
L2:
	mov dl, [esi]
	mov al, [esi + 4]
	call ff_mul2
	xor dl, al
	mov al, [esi + 8]
	call ff_mul3
	xor dl, al
	xor dl, [esi + 12]
	mov [edi + 4], dl
	inc edi
	inc esi
	Loop L2
call dumpregs ;------
mov esi, OFFSET state_matrix
mov edi, OFFSET temp_state_matrix
mov ecx, 4
mov dl, 0
L3:
	mov dl, [esi]
	xor dl, [esi + 4]
	mov al, [esi + 8]
	call ff_mul2
	xor dl, al
	mov al, [esi + 12]
	call ff_mul3
	xor dl, al
	mov [edi + 8], dl
	inc edi
	inc esi
	Loop L3

call dumpregs ;------
mov esi, OFFSET state_matrix
mov edi, OFFSET temp_state_matrix
mov ecx, 4
L4:
	mov al, [esi]
	call ff_mul3
	mov dl, [esi + 4]
	xor dl, al
	xor dl, [esi + 8]
	mov al, [esi + 12]
	call ff_mul2
	xor dl, al
	mov [edi + 12], dl
	inc edi
	inc esi
	Loop L4
	
ret
mix_columns ENDP



; ---------------------------
ff_mul2 PROC
; 
; Perform the finite-field muliplication of number in GF(2^8)
; Receives: AL = value to be multiplied by 2
; Returns: AL = After multiplying
; ---------------------------
test al, 80h
jz only_shift
shl al, 1
xor al, 00011011b ; x^4 + x^3 + x + 1
jmp end_ff_mul2
only_shift:
shl al, 1
end_ff_mul2:
ret
ff_mul2 ENDP



; ---------------------------
ff_mul3 PROC USES BX
;
; Perform the finite-field muliplication of number in GF(2^8)
; Receives: AL = value to be multiplied by 3
; Returns: AL = After multiplying
; ---------------------------
test al, 80h
jz no_mod
mov bl, al
shl al, 1
xor al, bl
xor al, 00011011b ; x^4 + x^3 + x + 1
jmp end_ff_mul3
no_mod:
mov bl, al
shl al, 1
xor al, bl
end_ff_mul3:
ret
ff_mul3 ENDP

End main