extends EnemyTemplate

@onready var animated_sprite_2d = $AnimatedSprite2D
@export var enemy_score := 100

func _ready():
	animated_sprite_2d.play("idle")

func _on_animated_sprite_2d_animation_finished():
	if animated_sprite_2d.animation == "hurt":
		Globals.score += enemy_score
		queue_free()
