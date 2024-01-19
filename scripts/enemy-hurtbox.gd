extends Area2D

func _on_body_entered(body):
	if body.name == "MainChar":
		body.velocity.y = body.JUMP_VELOCITY
		get_parent().animated_sprite_2d.play("hurt")
