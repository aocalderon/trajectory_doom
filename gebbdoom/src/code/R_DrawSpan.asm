PROC   R_DrawSpan_
[...]
singlepixel:
    mov  eax,[_ds_colormap]
    mov  esi,[_ds_source]
    mov  edi,[startdest]
    mov  ebp,[startfrac]
    shld ecx,ebp,22  ; begin calculating first pixel (y)
    shld ecx,ebp,6   ; begin calculating first pixel (x)
    and  ecx,4095    ; finish calculation for first pixel
    mov  al,[esi+ecx]; get first pixel
    mov  dl,[eax]    ; color translate first pixel
    mov  [edi],dl
    jmp  hdone
[...]
hpatch1:
    add  ebp,12345678h; advance frac pointer
    and  ecx,4095     ; finish calculation for third pixel
    mov  [edi],dx     ; write two pixels
    shld edx,ebp,22   ; begin calculating fourth pixel (y)
    add  edi,2        ; advance to third pixel destination
    shld edx,ebp,6    ; begin calculating fourth pixel (x)
hpatch2:
    add  ebp,12345678h; advance frac pointer
    and  edx,4095     ; finish calculation for fourth pixel
    mov  al,[esi+ecx] ; get third pixel
    mov  bl,[esi+edx] ; get fourth pixel
    dec  [loopcount]  ; done with loop?
    mov  dl,[eax]     ; color translate third pixel
    jnz  hdoubleloop
[...]
noinc:
    cmp  ecx,[startplane]
    je   alldone
    mov  [plane],ecx
    mov  ebx,[startfrac]
    add  ebx,[fracstep]
    mov  [startfrac],ebx ; advance frac to next pixel
    inc  [firstx]
    jmp   planeloop
alldone:
    popr
    ret
ENDP

