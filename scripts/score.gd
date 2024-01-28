extends Control

@onready var coins_counter = $container/coins_container/coins_counter
@onready var score_counter = $container/score_container/score_counter
@onready var retry_btn = $menu_holder/retry_btn

func _ready():
	pass

func _process(_delta):
	coins_counter.text = str("Coins: ") + str("%04d" % Globals.coins)
	score_counter.text = str("Score: ") + str("%06d" % Globals.score)

func focus():
	retry_btn.grab_focus()

func _on_retry_btn_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_quit_btn_pressed():
	get_tree().quit()
