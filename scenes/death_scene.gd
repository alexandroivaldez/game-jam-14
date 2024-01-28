extends Node
@onready var button_click = $ButtonClick
@onready var retry = $Control/Retry


# Called when the node enters the scene tree for the first time.
func _ready():
	retry.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_main_menu_pressed():

	button_click.play()
	await get_tree().create_timer(0.30).timeout
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")


func _on_quit_pressed():
	button_click.play()
	await get_tree().create_timer(.30).timeout
	get_tree().quit()
	
func _on_retry_pressed():
	await get_tree().create_timer(0.25).timeout
	get_tree().change_scene_to_file("res://scenes/main.tscn")
