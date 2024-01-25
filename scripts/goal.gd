extends Area2D

@onready var score = $"../score"

func _on_body_entered(body):
	print("entrou")
	if body.name == "MainChar":
		print("reconheceu")
		score.visible = true
		get_tree().paused = true
		score.get_child(0).focus()
