## lab 1

### ESP (stack pointer)
Punta alla cima dello stack (LIFO - Last In First Out). Viene modificato dalle operazioni PUSH.

### EBP  
### EIP (instruction pointer)
punta alla prossima istruione

### ESI (Source Index)
Punta al primo elemento di un vettore (array)

### EDI (Destination Index)
Punta alla string/vettore di destinazione

### EFLAGS
Viene usato per memorizzare los tato corrente/operazioni
Registro a 32 bit, ma solo lcuni sono utili.
`primo bit a destra: riporto`


## Registri
|31-16| 15-8| 7-0||
|-|-|-|-|
||AH|AL|EAX|
||AH|AL|EBX|

## Flags
Composizione del registro EFLAGS
- ZF (zero flag ): impostato a 1 se il risultato dell’operazione è 0.
- SF (sign flag ): impostato a 1 se il risultato dell’operazione è un numero negativo, a 0 se è positivo (rappresentazione in complemento a 2).
- OF (overflow flag ): impostato a 1 nel caso di overflow di un’operazione.
- TF (trap flag ): impostato a 1 genera un’interruzione ad ogni
istruzione. Utilizzato per l’esecuzione passo-passo dei programmi.
- IF (interrupt flag ): impostato a 1 abilita gli interrupt esterni, con 0 li disabilita.
- DF (direction flag ): impostato a 1 indica che nelle operazioni di spostamento di stringhe i registri DI e SI si autodecrementano (con 0 tali registri si auto 

incrementano)

## Indirizzamento
Si riferisce al modo in cui l’operando di un’istruzione viene specificato.Esistono 7 modalità:
1. **Indirizzamento a registro**: l’operando è contenuto in un registro edil nome del registro è specificato nell’istruzione (es. %Ri)
2. **Indirizzamento diretto** (o assoluto): l’operando è contenuto in unalocazione di memoria, e l’indirizzo della locazione viene specificatonell’istruzione (es. (IND))
3. **Indirizzamento immediato** (o di costante): l’operando è un valorecostante ed è definito esplicitamente nell’istruzione (es. $VAL)
4. **Indirizzamento indiretto**: l’indirizzo di un operando è contenuto in un registro o in una locazione di memoria. L’indirizzo della locazione o il registro viene specificato nell’istruzione (es. (%Ri) o ($VAL)).
5. **Indirizzamento indicizzato** (base e spiazzamento): l’indirizzo effettivo dell’operando è calcolato sommando un valore costante al contenuto di un registro (es. SPI(%Ri))
6. **Indirizzamento con autoincremento**: l’indirizzo effettivo dell’operando è il contenuto di un registro specificato nell’istruzione. Dopo l’accesso, il contenuto del registro viene incrementato per puntare all’elemento successivo.
7. **Indirizzamento con autodecremento**: il contenuto di un registro specificato nell’istruzione viene decrementato. Il nuovo contenuto viene usato come indirizzo effettivo dell’operando