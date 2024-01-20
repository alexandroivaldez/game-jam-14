extends EnemyTemplate

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var player_detector = $PlayerDetector

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	super._physics_process(delta)
	velocity.x = speed * _facing
	#velocity.y = speed * _facing #Diagonal Movement
	move_and_slide()

func _on_visible_on_screen_notifier_2d_screen_entered():
	animated_sprite_2d.play("idle")