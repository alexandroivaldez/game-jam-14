extends Area2D
@onready var coinSound = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(_body):
	$anim.play("collect")
	coinSound.play()

func _on_anim_animation_finished():
	queue_free()
