extends Area2D
@onready var water_pipe_animation = $AnimatedSprite2D
@onready var gem_game_start = $"../gem_game-start"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_gem_gamestart_body_entered(_body):
	water_pipe_animation.animation = "water_flow"
	gem_game_start.queue_free()
	await get_tree().create_timer(5.0).timeout
	$"../seaTest".seasUp()
	
