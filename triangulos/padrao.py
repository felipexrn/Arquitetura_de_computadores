def padroes(nome):
    instrucoes = {
        "add": {
            "op": "001111",
            "fu": "000111"
        },
        "addu": {
            "op": "010100",
            "fu": "000100"
        },
        "addi": {
            "op": "001100",
            "fu": "001000"
        }
    }

    if nome in instrucoes:
        print(f"{nome} = {instrucoes[nome]['op']+instrucoes[nome]['fu']}")
    else: print("Instrução não cadastrada")

padroes("syscall")
