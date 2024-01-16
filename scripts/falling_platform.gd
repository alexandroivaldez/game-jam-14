extends AnimatableBody2D

@onready var anim := $anim as AnimationPlayer
@onready var respawn_timer := $respawn_timer as Timer
@onready var respawn_position := global_position

@export var reset_timer := 3

var velocity = Vector2.ZERO
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_triggered := false

func _ready():
	set_physics_process(false)

func _physics_process(delta):
	velocity.y += gravity * delta
	position += velocity * delta
	
func has_collided_with(_collision: KinematicCollision2D, _collider: CharacterBody2D):
	if !is_triggered:
		is_triggered = true
		anim.play("shake")
		velocity = Vector2.ZERO

func _on_anim_animation_finished(_anim_name):
	set_physics_process(true)
	respawn_timer.start(reset_timer)

func _on_respawntimer_timeout():
	set_physics_process(false)
	global_position = respawn_position
	if is_triggered:
		var spawn_tween = create_tween().set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_IN_OUT)
		spawn_tween.tween_property($texture, "scale", Vector2(1,1), 0.2).from(Vector2(0,0))
	is_triggered = false


