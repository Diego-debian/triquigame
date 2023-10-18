extends Node

var turno
var vector_player1 = [0,0,0,0,0,0,0,0,0]
var vector_player2 = [0,0,0,0,0,0,0,0,0]
var score_player1 = 0
var score_player2 = 0
var moviments_acount = 0
func _ready():
	reset_vectores()


func Turno():
	var output
	if turno == 0:
		turno = 1
		output = 1
	elif turno == 1:
		turno = 2
		output = 2
	elif turno == 2:
		turno = 1
		output = 1
	return output

func llenar_vectores(lista, valor):
	lista[valor] = 1

func reset_vectores():
	$Panel/Labels/Player_shift.text = "Player 1"
	turno = 0
	for i in range(0,9,1):
		vector_player1[i] = 0
		vector_player2[i] = 0
func reset_score():
	score_player1 = 0
	score_player2 = 0
	
func winer_review(lista):
	var output = false
	moviments_acount += 1
	if lista[0] == lista[1] && lista[1] == lista[2] && lista[2] == 1:
		output = true
	elif lista[3] == lista[4] && lista[4] == lista[5] && lista[5] == 1:
		output = true
	elif  lista[6] == lista[7] && lista[7] == lista[8] && lista[8] == 1:
		output = true
	elif  lista[0] == lista[3] && lista[3] == lista[6] && lista[6] == 1:
		output = true
	elif  lista[1] == lista[4] && lista[4] == lista[7] && lista[7] == 1:
		output = true
	elif  lista[2] == lista[5] && lista[5] == lista[8] && lista[8] == 1:
		output = true
	elif  lista[0] == lista[4] && lista[4] == lista[8] && lista[8] == 1:
		output = true
	elif  lista[2] == lista[4] && lista[4] == lista[6] && lista[6] == 1:
		output = true
	if moviments_acount == 9:
		clear_screen()
	return output

func clear_screen():
	moviments_acount = 0
	reset_vectores()
	$Panel/Botones.reset_buttons()
	$Panel/Labels/Score_player1.text = str(score_player1)
	$Panel/Labels/Score_player2.text = str(score_player2)
	
func _on_Botones_botones_player(value):
	var player_play = Turno()
	print("Player: ", player_play)
	if value == 9:
		reset_score()
		clear_screen()
		turno = 0
	elif value != 9:
		if player_play == 1:
			llenar_vectores(vector_player1, value)
			$Panel/Labels/Player_shift.text = "Player 2"
			if winer_review(vector_player1):
				score_player1 += 1
				print("Player 1 is winner")
				clear_screen()
		elif player_play == 2:
			llenar_vectores(vector_player2, value)
			$Panel/Labels/Player_shift.text = "Player 1"
			if winer_review(vector_player2):
				score_player2 += 1
				print("Player 2 is winner")
				clear_screen()

	print("Player1: ", vector_player1)
	print("Player2: ", vector_player2)
