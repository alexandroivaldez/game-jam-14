extends Node
@onready var button_click_sound = $ButtonClickSound
@onready var button = $Button

func _ready():
	button.grab_focus()
	

func _on_button_pressed():
	button_click_sound.play()
	await get_tree().create_timer(0.25).timeout
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
