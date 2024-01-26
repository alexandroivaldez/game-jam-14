extends CanvasLayer
@onready var button_click = $ButtonClick


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Main Menu
func _on_button_pressed():
	button_click.play()
	Globals.coins = 0
	Globals.score = 0
	Globals.player_life = 3
	await get_tree().create_timer(0.30).timeout
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")

# Quit
func _on_button_2_pressed():
	await get_tree().create_timer(0.25).timeout
	button_click.play()
	get_tree().quit()
