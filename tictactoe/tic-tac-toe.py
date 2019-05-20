import random
import numpy

def board_creator(players):
  rows_and_columns = int(1.5 * players)
  row = [" " for i in range(rows_and_columns)]
  board = [row for i in range(rows_and_columns)]
  return board

def profile_maker(players):
#Check again! Missing condition when checking if symbol is still available
  player_profiles = {}
  for i in range(players):
    player_name = input("¿Cuál es tu nombre, Jugador %s? " %(i+1))
    player_profiles[player_name] = input("¿Cuál será tu símbolo, Jugador %s? " %(i+1))
    if player_profiles[player_name].lower() not in 'abcdefghijklmnopqrstuvwxyz' or len(player_profiles[player_name]) != 1:
      print("El símbolo debe ser una sola letra del  abecedario, y nadie debe haberlo escogido antes")
      player_profiles[player_name] = input("¿Cuál será tu símbolo, Jugador %s? " %(i+1))
  return player_profiles

def game(player_profiles):
   return print(np.random.shuffle(list(player_profiles.keys())))
  #  for turn in range(int(1.5*players)**2):
  #print(player_list)
  #pass

def three_in_a_row (players):
  board = board_creator(players)
  player_profiles = profile_maker(players)
  game(player_profiles)
  print("Este es el estado del tablero:")
  for counter in range(len(board)):
    print (board[counter], end = '\n')
three_in_a_row(int(input("¿Cuántos váis a jugar? ")))
