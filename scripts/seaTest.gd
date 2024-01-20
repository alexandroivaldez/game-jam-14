extends Area2D

var speed = 100;
var moveSea = false;

func _on_body_entered(body):
	if(body.name == "MainChar"):
		queue_free()
		
func _process(delta):
	if(moveSea):
		position.y -= speed * delta

func seasUp():
	moveSea = true
