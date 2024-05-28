; Define the expression and priorities
EXPRESSION: db '3 * 4 + 5', 0
PRIORITY_MULTIPLY: dw 100
PRIORITY_ADD: dw 50

; Function to parse and evaluate the expression
parse_expression:
    ; Arguments:
    ;   ax - current priority
    ; Returns:
    ;   ax - evaluated result

    push bx
    push cx
    push dx
    push si

    ; Init result
    mov bx, 0

    ; Parse the first number
    mov al, [si]
    sub al, '0'
    mov bx, ax
    inc si

    parse_next:
        ; Skip spaces
        cmp byte ptr [si], ' '
        je skip_space

        ; Check for the end of the expression
        cmp byte ptr [si], 0
        je end_parse

        ; Parse the operator
        mov al, [si]
        inc si

        cmp al, '*'
        je handle_multiply

        cmp al, '+'
        je handle_add

        jmp parse_next

    skip_space:
        inc si
        jmp parse_next

    handle_multiply:
        ; Check the priority
        cmp ax, PRIORITY_MULTIPLY
        jge handle_operator_done

        ; Parse the next number
        call parse_expression, PRIORITY_MULTIPLY

        ; Multiply

        mul bx
        mov bx, ax

        jmp parse_next

    handle_add:
        ; Check the priority
        cmp ax, PRIORITY_ADD
        jge handle_operator_done

        ; Parse the next number
        call parse_expression, PRIORITY_ADD

        ; Add
        add bx, ax
        mov bx, ax

        jmp parse_next

    handle_operator_done:
        pop si
        pop dx
        pop cx
        pop bx
        ret

    end_parse:
        mov ax, bx
        pop si
        pop dx
        pop cx
        pop bx
        ret
