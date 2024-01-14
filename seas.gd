extends CharacterBody2D

var speed = -40

func _process(delta):
	move_and_collide(Vector2(0, speed * delta))
	##Delay the water movement
	##await(1000)
	
#

