extends CharacterBody2D

class_name EnemyTemplate

# Direction of where enemy is facing
enum FACING { LEFT = -1, RIGHT = 1}

const OFF_SCREEN_KILL_ME: float = 1000.0

@export var default_facing: FACING = FACING.LEFT
@export var points: int = 1
@export var speed: float = 30.0

var _gravity: float = 800.0
var _facing: FACING = default_facing
#var _player_ref: Player
var _dying: bool = false


func _ready():
	pass

func _physics_process(_delta):
	fallen_off()

# Handle enemy falling out of bounds
func fallen_off() -> void:
	if global_position.y > OFF_SCREEN_KILL_ME:
		queue_free()

# Handle Death
func die():
	if _dying == true:
		return
	
	_dying = true
	set_physics_process(false)
	hide()
	queue_free()
	


func _on_visible_on_screen_notifier_2d_screen_entered():
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	pass
