# En primer lugar pintamos el tablero como una matriz de tres filas or tres columnas y lo asignamos a la variable board
board = [['', '', ''], ['', '', ''], ['', '', '']]
# Inicializamos la variable turn que recogerá el número de turnos o jugadas a 0
turn = 0
# Inicializamos la variable win a False
win = False

# Definimos una función que lo único que hace es repintar el tablero actual
def print_actual_board(board):
    print(board)

print_actual_board(board)


# Definimos las funciones con las que vamos a comprobar si existen jugadas ganadoras

# En esta función lo que hacemos es comprobar una a una cada fila y va a devolver un booleano en función de la comprobación
def check_rows():
    for row in range(3):
        # En cada fila comprobamos si el primer elemento es igual al segundo, y estos a su vez al tercero
        # Y que sean distintos de string vacío
        if board[row][0] == board[row][1] and board[row][1] == board[row][2] and board[row][0] != '':
            return True
        else:
            return False
# En esta función lo que hacemos es comprobar una a una cada columna y va a devolver un booleano en función de la comprobación
def check_cols():
    for col in range(3):
        # En cada columna comprobamos si el primer elemento es igual al segundo, y estos a su vez al tercero
        # Y que sean distintos de string vacío
        if board[0][col] == board[1][col] and board[1][col] == board[2][col] and board[0][col] != '':
            return True
        else:
            return False

# En esta función lo que hacemos es comprobar la diagonal directa y va a devolver un booleano en función de la comprobación
def check_direct_diagonal():
    # Aquí comprobamos que sean iguales todos los elementos de la diagonal principal y distintos de string vacío
    if board[0][0] != '' and board[0][0] == board[1][1] and board[1][1] == board[2][2]:
        return True
    else:
        return False

# En esta función lo que hacemos es comprobar la diagonal inversa y va a devolver un booleano en función de la comprobación
def check_inversed_diagonal():
    # Aquí comprobamos que sean iguales todos los elementos de la diagonal inversa y distintos de string vacío
    if board[2][0] != '' and board[2][0] == board[1][1] and board[1][1] == board[0][2]:
        return True
    else:
        return False
        

# Esta es la función que reúne todas las comprobaciones del tablero. Devuelve un booleano.
# Si existe, al menos, una combinación ganadora devolverá true
def check_win():
    if check_rows() or check_cols() or check_direct_diagonal() or check_inversed_diagonal():
        return True


# LA FUNCIÖN JUEGO
# Como parámetros recibe player A y player B que pueden ser strings o números
def show_play(playerA, playerB):
    print("JUGADA:")
    # Almacenamos el valor de un input en la variable fila
    row = input("FILA   : ")
    # Almacenamos el valor de un input en la variable columna
    col = input("COLUMNA: ")
    # Estas variables recogen la posición de cada jugador.
    # Como comprobación de valores válidos cogemos los números 49, 50 y 51 que hacen referencia a los valores de 1, 2 y 3 en ASCII
    # Utilizamos el método ord() para recoger el valor de la tecla.
    # Decidimos utilizar esta validación para no tener que hacer otras validaciones ya que esta es más directa
    if ord(row) in [49, 50, 51] and ord(col) in [49, 50, 51]: 
        # En caso de que cumpla la validación se opera sobre ella y se asigna el valor del jugador a la posición escogida
        # siempre y cuando esta posición no esté ocupada
        if board[ord(row) -49][ord(col) -49] == '':
            board[ord(row) -49][ord(col) -49] = playerA
            print_actual_board(board)
            # Se añade uno a los turnos
            turn += 1
            # Se comprueba si hay posición ganadora
            win = check_win()
            # En caso de ganar, se para el juego
            if win == True:
                print('¡Ganaste, jugadora '+ playerA + '!¡Hurraaaa!')
            else:
                # Si no hay combinación ganadora y no se han alcanzado las 9 posiciones, se lanza de nuevo el juego
                # pero se altera el orden de los jugadores
                if turn < 9:
                    show_play(playerB, playerA)
                # En caso contrario, se termina la partida
                else:
                    print('Terminó la partida')
                    # Si alguien ha ganado, se imprime quién ganó
                    if win == True:
                        print('¡Ganaste, jugadora '+ playerA + '!¡Hurraaaa!')
                    # En caso contrario se imprime Tablas
                    else:
                        print('Tablas')
        # Si la casilla está ocupada se lanza un mensaje correspondiente y se vuelve a lanzar el juego                
        else:
            print('La casilla está ocupada, intenta otra posición')
            print_actual_board(board)
            show_play(playerA, playerB)
    # Si se ha tecleado una tecla no válida se lanza el mensaje correspondiente y se vuelve a lanzar el juego
    else:
        print("Sólo puedes elegir entre 1, 2 y 3 :)")
        show_play(playerA, playerB)
        print_actual_board(board)

show_play('O', 'X')







