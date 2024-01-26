extends Area2D

@onready var score = $"../score"

func _on_body_entered(body):
	if body.name == "MainChar":
		score.visible = true
		get_tree().paused = true
		score.get_child(0).focus()
