extends CanvasLayer
@onready var button_click = $ButtonClick


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_main_menu_btn_pressed():
	Globals.coins = 0
	Globals.score = 0
	Globals.player_life = 3
	await get_tree().create_timer(0.30).timeout
	button_click.play()
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")


func _on_quit_btn_pressed():
	await get_tree().create_timer(.30).timeout
	button_click.play()
	get_tree().quit()
