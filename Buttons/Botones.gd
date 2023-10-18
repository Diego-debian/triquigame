extends CanvasLayer

signal botones_player

var imagen0: Texture = preload("res://Assets/Buttons/btn1.png")
var imagen1: Texture = preload("res://Assets/Buttons/btn2.png")
var imagenN: Texture = preload("res://Assets/Buttons/btn_idle.png")
var optionButtomPicture = 0
var optionShift = 0
var  buttom_pressed = -1 
# Lista que contiene todos los botones
var buttons: Array = []

func _ready():
	# Agrega todos los botones a la lista
	buttons = [$btn11, $btn12, $btn13, $btn21, $btn22, $btn23, $btn31, $btn32, $btn33]


func button_color():
	var imagen = imagenN
	if optionButtomPicture == 0 || optionButtomPicture == 2 || optionButtomPicture == 4 ||  optionButtomPicture == 6 || optionButtomPicture == 8:
		imagen = imagen0
		optionShift = 1
		
	elif optionButtomPicture == 1 || optionButtomPicture == 3 || optionButtomPicture == 5 || optionButtomPicture == 7 :
		var optionButtomPicture = 0
		optionShift = 2
		imagen = imagen1
	if optionButtomPicture >= 0 && optionButtomPicture <= 9:
		optionButtomPicture += 1 
	return imagen

func _on_btn11_pressed():
	$btn11.texture_normal = button_color()
	$btn11.disabled = true
	buttom_pressed = 0
	actions_buttoms()

func _on_btn12_pressed():
	$btn12.texture_normal = button_color()
	$btn12.disabled = true
	buttom_pressed = 1
	actions_buttoms()

func _on_btn13_pressed():
	$btn13.texture_normal = button_color()
	$btn13.disabled = true
	buttom_pressed = 2
	actions_buttoms()
	
func _on_btn21_pressed():
	$btn21.texture_normal = button_color()
	$btn21.disabled = true
	buttom_pressed = 3
	actions_buttoms()
	
func _on_btn22_pressed():
	$btn22.texture_normal = button_color()
	$btn22.disabled = true
	buttom_pressed = 4
	actions_buttoms()
	
func _on_btn23_pressed():
	$btn23.texture_normal = button_color()
	$btn23.disabled = true
	buttom_pressed = 5
	actions_buttoms()
	
func _on_btn31_pressed():
	$btn31.texture_normal = button_color()
	$btn31.disabled = true
	buttom_pressed = 6
	actions_buttoms()
	
func _on_btn32_pressed():
	$btn32.texture_normal = button_color()
	$btn32.disabled = true
	buttom_pressed = 7
	actions_buttoms()
	
func _on_btn33_pressed():
	$btn33.texture_normal = button_color()
	$btn33.disabled = true
	buttom_pressed = 8
	actions_buttoms()
	
#Función para emitir señal
func actions_buttoms():
	emit_signal("botones_player", buttom_pressed)

# Función para actualizar un solo botón
func update_button(button):
	button.texture_normal = imagenN
	button.disabled = false


# Función para resetear todos los botones
func reset_buttons():
	for button in buttons:
		update_button(button)
	optionButtomPicture = 0
	optionShift = 0

# Función llamada al presionar el botón de reset
func _on_btnReset_pressed():
	buttom_pressed = 9
	actions_buttoms()
	reset_buttons()
	buttom_pressed = -1


