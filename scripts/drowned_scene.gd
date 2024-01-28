extends CanvasLayer
@onready var button_click = $ButtonClick
@onready var retry_button = $Control/retry_button


# Called when the node enters the scene tree for the first time.
func _ready():
	retry_button.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_main_menu_btn_pressed():
	button_click.play()
	await get_tree().create_timer(0.30).timeout
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")


func _on_quit_btn_pressed():
	button_click.play()
	await get_tree().create_timer(.30).timeout
	get_tree().quit()


func _on_retry_button_pressed():
	await get_tree().create_timer(0.25).timeout
	get_tree().change_scene_to_file("res://scenes/main.tscn")
