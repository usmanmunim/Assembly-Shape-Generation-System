%define WIDTH   60
%define HEIGHT  20

section .data
    welcome      db 10, "=== Welcome to Advanced Shape Drawer ===", 10, 0
    welcome_len  equ $ - welcome

    goodbye      db 10, "Thank you for using the Shape Drawer!", 10, 0
    goodbye_len  equ $ - goodbye

    credits      db 10, "Created by Muhammad Usman", 10, 0
    credits_len  equ $ - credits

    menu         db 10, "----------------------------------------", 10
                 db "        Shape Drawing Program", 10
                 db "----------------------------------------", 10
                 db "1. Draw Line", 10
                 db "2. Draw Rectangle", 10
                 db "3. Draw Square", 10
                 db "4. Draw Triangle", 10
                 db "5. Draw Circle", 10
                 db "6. Exit", 10
                 db "----------------------------------------", 10
                 db "Enter your choice (1-6): ", 0
    menu_len     equ $ - menu

    invalid      db 10, "Oops! Invalid choice. Please enter 1-6.", 10, 0
    invalid_len  equ $ - invalid

    newline      db 10, 0
    newline_len  equ $ - newline

    star         db "*", 0
    space        db " ", 0

    line_label   db 10, "=== Line ===", 10, 0
    line_len     equ $ - line_label

    rect_label   db 10, "=== Rectangle ===", 10, 0
    rect_len     equ $ - rect_label

    square_label db 10, "=== Square ===", 10, 0
    square_len   equ $ - square_label

    tri_label    db 10, "=== Triangle ===", 10, 0
    tri_len      equ $ - tri_label

    circle_label db 10, "=== Circle ===", 10, 0
    circle_len   equ $ - circle_label

    ; Circle (Option 7, 7 rows x 9 columns)
    circle7_row1 db '   * * *   ',10,0
    circle7_row1_len equ $-circle7_row1
    circle7_row2 db ' *       * ',10,0
    circle7_row2_len equ $-circle7_row2
    circle7_row3 db '*         *',10,0
    circle7_row3_len equ $-circle7_row3

section .bss
    input   resb 2

section .text
    global _start

_start:
    call print_welcome
    jmp main_loop
print_welcome:
    mov eax, 4
    mov ebx, 1
    mov ecx, welcome
    mov edx, welcome_len
    int 0x80
    ret

print_newline:
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, newline_len
    int 0x80
    ret

draw_line:
    mov eax, 4
    mov ebx, 1
    mov ecx, line_label
    mov edx, line_len
    int 0x80

    mov ecx, 30
.draw_line_loop:
    push ecx
    mov eax, 4
    mov ebx, 1
    mov ecx, star
    mov edx, 1
    int 0x80
    ; Print space after each *
    mov eax, 4
    mov ebx, 1
    mov ecx, space
    mov edx, 1
    int 0x80
    pop ecx
    loop .draw_line_loop

    call print_newline
    jmp main_loop

draw_rectangle:
    mov eax, 4
    mov ebx, 1
    mov ecx, rect_label
    mov edx, rect_len
    int 0x80

    mov esi, 4              ; 4 rows
.rect_row:
    push esi
    mov ecx, 7              ; 7 columns
.rect_col:
    push ecx
    mov eax, 4
    mov ebx, 1
    mov ecx, star
    mov edx, 1
    int 0x80
    ; Print space after each *
    mov eax, 4
    mov ebx, 1
    mov ecx, space
    mov edx, 1
    int 0x80
    pop ecx
    loop .rect_col

    call print_newline
    pop esi
    dec esi
    jnz .rect_row
    jmp main_loop

draw_square:
    mov eax, 4
    mov ebx, 1
    mov ecx, square_label
    mov edx, square_len
    int 0x80

    mov esi, 7              ; 7 rows
.square_row:
    push esi
    mov ecx, 7              ; 7 columns
.square_col:
    push ecx
    mov eax, 4
    mov ebx, 1
    mov ecx, star
    mov edx, 1
    int 0x80
    ; Print space after each *
    mov eax, 4
    mov ebx, 1
    mov ecx, space
    mov edx, 1
    int 0x80
    pop ecx
    loop .square_col

    call print_newline
    pop esi
    dec esi
    jnz .square_row
    jmp main_loop

draw_triangle:
    mov eax, 4
    mov ebx, 1
    mov ecx, tri_label
    mov edx, tri_len
    int 0x80

    mov esi, 1
    mov edi, 7
.tri_row:
    mov ecx, 7
    sub ecx, esi
.tri_space:
    jecxz .done_space
    push ecx
    mov eax, 4
    mov ebx, 1
    mov ecx, space
    mov edx, 1
    int 0x80
    pop ecx
    dec ecx
    jmp .tri_space
.done_space:
    mov ecx, esi
    shl ecx, 1
    dec ecx
.tri_star:
    jecxz .done_star
    push ecx
    mov eax, 4
    mov ebx, 1
    mov ecx, star
    mov edx, 1
    int 0x80
    pop ecx
    dec ecx
    jmp .tri_star
.done_star:
    call print_newline
    inc esi
    dec edi
    jnz .tri_row
    jmp main_loop

draw_circle:
    mov eax, 4
    mov ebx, 1
    mov ecx, circle_label
    mov edx, circle_len
    int 0x80

    ; Row 1
    mov eax, 4
    mov ebx, 1
    mov ecx, circle7_row1
    mov edx, circle7_row1_len
    int 0x80

    ; Row 2
    mov eax, 4
    mov ebx, 1
    mov ecx, circle7_row2
    mov edx, circle7_row2_len
    int 0x80

    ; Row 3
    mov eax, 4
    mov ebx, 1
    mov ecx, circle7_row3
    mov edx, circle7_row3_len
    int 0x80

    ; Row 4
    mov eax, 4
    mov ebx, 1
    mov ecx, circle7_row3
    mov edx, circle7_row3_len
    int 0x80

    ; Row 5
    mov eax, 4
    mov ebx, 1
    mov ecx, circle7_row3
    mov edx, circle7_row3_len
    int 0x80

    ; Row 6
    mov eax, 4
    mov ebx, 1
    mov ecx, circle7_row2
    mov edx, circle7_row2_len
    int 0x80

    ; Row 7
    mov eax, 4
    mov ebx, 1
    mov ecx, circle7_row1
    mov edx, circle7_row1_len
    int 0x80

    jmp main_loop

main_loop:
    mov eax, 4
    mov ebx, 1
    mov ecx, menu
    mov edx, menu_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 2
    int 0x80

    cmp byte [input], 10
    je .invalid_input

    cmp byte [input], '1'
    je draw_line
    cmp byte [input], '2'
    je draw_rectangle
    cmp byte [input], '3'
    je draw_square
    cmp byte [input], '4'
    je draw_triangle
    cmp byte [input], '5'
    je draw_circle
    cmp byte [input], '6'
    je exit_program

.invalid_input:
    mov eax, 4
    mov ebx, 1
    mov ecx, invalid
    mov edx, invalid_len
    int 0x80
    jmp main_loop

exit_program:
    mov eax, 4
    mov ebx, 1
    mov ecx, goodbye
    mov edx, goodbye_len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, credits
    mov edx, credits_len
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80

