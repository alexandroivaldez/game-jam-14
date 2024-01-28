extends Node

@onready var main_char = $MainChar

# Called when the node enters the scene tree for the first time.
func _ready():
	main_char.player_has_died.connect(load_death_scene)
	Globals.coins = 0
	Globals.score = 0
	Globals.player_life = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func load_death_scene():
	await get_tree().create_timer(0.25).timeout
	get_tree().change_scene_to_file("res://scenes/death_scene.tscn")
