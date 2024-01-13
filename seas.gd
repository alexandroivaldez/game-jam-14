extends CharacterBody2D

var speed = -40

func _process(delta):
	#Delay the water movement
	#await(1000)
	move_and_collide(Vector2(0, speed * delta))

# Handle collision against player
