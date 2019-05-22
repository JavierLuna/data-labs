
board = [['', '', ''], ['', '', ''], ['', '', '']]
turn = 0
win = False
def print_actual_board(board):
    print(board)

print_actual_board(board)

def check_rows():
    for x in range(3):
        if board[x][0] == board[x][1] and board[x][1] == board[x][2] and board[x][0] != '':
            return True
        else:
            return False
        
def check_cols():
    for x in range(3):
        if board[0][x] == board[1][x] and board[1][x] == board[2][x] and board[0][x] != '':
            return True
        else:
            return False
    
def check_direct_diagonal():
    if board[0][0] != '' and board[0][0] == board[1][1] and board[1][1] == board[2][2]:
        return True
    else:
        return False

def check_inversed_diagonal():
    if board[2][0] != '' and board[2][0] == board[1][1] and board[1][1] == board[0][2]:
        return True
    else:
        return False
        
def check_win():
    if check_rows() or check_cols() or check_direct_diagonal() or check_inversed_diagonal():
        return True

def show_play(playerA, playerB):
    print("JUGADA:")
    row = input("FILA   : ")
    col = input("COLUMNA: ")
    if ord(row) in [49, 50, 51] and ord(col) in [49, 50, 51]: 
        if board[ord(row) -49][ord(col) -49] == '':
            board[ord(row) -49][ord(col) -49] = playerA
            print_actual_board(board)
            turn 
            win = check_win()
            if win == True:
                print('¡Ganaste, jugadora '+ playerA + '!¡Hurraaaa!')
            else:
                if '' in board:
                    show_play(playerB, playerA)
                else:
                    print('Terminó la partida')
                    if win == True:
                        print('¡Ganaste, jugadora '+ playerA + '!¡Hurraaaa!')
                    else:
                        print('Tablas')
        else:
            print('La casilla está ocupada, intenta otra posición')
            print_actual_board(board)
            show_play(playerA, playerB)
    else:
        print("Sólo puedes elegir entre 1, 2 y 3 :)")
        show_play(playerA, playerB)
        print_actual_board(board)

show_play('O', 'X')







