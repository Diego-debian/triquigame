extends CanvasLayer


func set_score_player1(value):
	print(value)
	$Score_player1.text = str(value)

func set_score_player2(value):
	$Score_player2.text = str(value)

func set_player_shift(value):
	$Player_shift.text = str(value)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


