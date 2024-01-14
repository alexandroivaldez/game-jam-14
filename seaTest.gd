extends Area2D

var speed = 100;

func _on_body_entered(body):
	if(body.name == "MainChar"):
		queue_free()
		
func _process(delta):
	# Move seas up
	position.y -= speed * delta
