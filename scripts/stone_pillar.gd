extends AnimatableBody2D

@onready var anim = $anim

func _ready():
	pass

func _process(_delta):
	pass

func _on_gem_gamestart_body_entered(_body):
	anim.play("rise")
