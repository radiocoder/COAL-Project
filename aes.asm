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
mov esi, OFFSET SUB_BOX
mov ecx, 256
mov ebx, TYPE SUB_BOX
call Dumpmem
exit
main ENDP


; ---------------------------
mix_columns PROC
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
; Receives: state_matrix in data segment
; Returns: state_matrix after mixing columns
; ---------------------------
mov esi, OFFSET state_matrix
mov edi, OFFSET temp_state_matrix
mov ecx, 4
L1:
	push ecx
	mov bl, 02h
	mov cl, [esi]
	call gmul
	mov dl, al
	mov bl, 03h
	mov cl, [esi+4]
	call gmul
	xor dl, al
	xor dl, [esi+8]
	xor dl, [esi+12]
	mov [edi], dl
	inc edi
	inc esi
	pop ecx
	Loop L1

mov esi, OFFSET state_matrix
mov edi, OFFSET temp_state_matrix
mov ecx, 4
L2:
	push ecx
	mov dl, [esi]
	mov bl, 02h
	mov cl, [esi+4]
	call gmul
	xor dl, al
	mov bl, 03h
	mov cl, [esi+8]
	call gmul
	xor dl, al
	xor dl, [esi+12]
	mov [edi + 4], dl
	inc edi
	inc esi
	pop ecx
	Loop L2


mov esi, OFFSET state_matrix
mov edi, OFFSET temp_state_matrix
mov ecx, 4
L3:
	push ecx
	mov dl, [esi]
	xor dl, [esi+4]
	mov bl, 02h
	mov cl, [esi+8]
	call gmul
	xor dl, al
	mov bl, 03h
	mov cl, [esi+12]
	call gmul
	xor dl, al
	mov [edi + 8], dl
	inc edi
	inc esi
	pop ecx
	Loop L3


mov esi, OFFSET state_matrix
mov edi, OFFSET temp_state_matrix
mov ecx, 4
L4:
	push ecx
	mov bl, 03h
	mov cl, [esi]
	call gmul
	mov dl, al
	xor dl, [esi+4]
	xor dl, [esi+8]
	mov bl, 02h
	mov cl, [esi+12]
	call gmul
	xor dl, al
	mov [edi + 12], dl
	inc edi
	inc esi
	pop ecx
	Loop L4
	
ret
mix_columns ENDP



; ---------------------------
gmul PROC
; Computes the finite field multiplication of two numbers in GF(2^8)
; Receives: BL, CL
; Returns: AL = Product
mov al, 0
gmul_while:
cmp bl, 0
jz end_gmul
cmp cl, 0
jz end_gmul
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