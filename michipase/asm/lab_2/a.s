## dato il numero di persone e il numero di persone che entrano in ogni macchina, 
## calcola il numero di auto necessarie


.section .data
    titolo:
        .ascii "calcola il numero di auto necessarie. \n\n"
    titolo_len:
        .long . - titolo
    risposta:
        .ascii "totale auto necessarie: "
    risposta_len:
        .long . - risposta
    numPersone:
        .long 87
    numPersonePerAuto:
        .long 5
    numAuto:
        .ascii "000\n"
    
.section .text
    .global _start 

_start:
    # devo innanzitutto fare la divisione
    # quindi carico le variabili che mi servono nei registri
    movl numPersone, %eax
    movl numPersonePerAuto, %ebx

    # divb <divisore>: divide AX per divisore
    # quindi, divb %bl = AX/BL (dibisione  Byte)
    # nel primo byte di EAX (AL) metto il risultato e nel secondo il resto on AH
    divb %bl

    # verifico se ho il resto
    cmpb $0, %ah    # compare bit

    je continua     # jump equal: nel caso in cui non ho resto
    
    # nel caso in cui non ci sia resto incremento di 1
    incb %al
    
    xorb %ah, %ah   # pulisco il registro facendo uno xor con se stesso (eh eh fregato)

continua:
    # creo il valore finale come stringa, ossia
    # converto il valore di AL in stringa

    # carico indirizzo di memoria effettivo di numAuto
    leal numAuto, %esi
    xorb %ah, %ah # usiamo xorb invece di xorl perchè lavoriamo con i BYTE (b: byte, l: long)

    # salvo 10 in ebx per la divisione per ottenere la cifra più a destra (stesso trick che si fa in C per avere un numero cifra a cifra)
    movl $10, %ebx

    divb %bl        # divido per 10 AH
    addb $48, %ah   # sommo 48 ad AH (48 è lo '0' in ascii)

    # salvo il calore contenuto in AH (resto) in terza posizione di numAuto
    movb %ah, 2(%esi)
    xorb %ah, %ah

    # eseguo lo stesso blocco per le altre 2 cifre
    divb %bl     
    addb $48, %ah
    movb %ah, 1(%esi)
    xorb %ah, %ah

    divb %bl     
    addb $48, %ah
    movb %ah, (%esi)
    # xorb %ah, %ah

stampa:
    # stampa chiamando systemcall write
    movl $4, %eax
    movl $1, %ebx
    leal titolo, %ecx
    movl titolo_len, %edx
    int $0x80

    movl $4, %eax
    movl $1, %ebx
    leal risposta, %ecx
    movl risposta_len, %edx
    int $0x80

    movl $4, %eax
    movl $1, %ebx
    leal numAuto, %ecx
    movl $4, %edx # 4 è la dimensione di numAuto
    int $0x80

    # Syscalc exit
    movl $1, %eax
    movl $0, %ebx
    int $0x80
