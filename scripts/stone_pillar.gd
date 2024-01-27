extends AnimatableBody2D

var movePillar = false
var speed = 100
var pillarCount = 0

func _ready():
	pass

func _process(delta):
	if (movePillar):
		# The perfect num to lift and stop the pillar right before it's sprite ends.
		if (pillarCount < 300):
			position.y -= speed * delta
			pillarCount = pillarCount + 1
		else:
			movePillar = false

func _on_gem_gamestart_body_entered(_body):
	movePillar = true
