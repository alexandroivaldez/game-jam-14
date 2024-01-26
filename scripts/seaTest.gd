extends Area2D

@export var speed := 100;
var moveSea = false;
@onready var player_death = $PlayerDeath


func _on_body_entered(body):
	if(body.name == "MainChar"):
		player_death.play()
		await get_tree().create_timer(1.0).timeout
		queue_free()
		get_tree().change_scene_to_file("res://scenes/drowned_scene.tscn")
		
func _process(delta):
	if(moveSea):
		position.y -= speed * delta

func seasUp():
	moveSea = true
