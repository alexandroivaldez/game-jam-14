extends EnemyTemplate

@onready var floor_detection = $FloorDetection
@onready var animated_sprite_2d = $AnimatedSprite2D
@export var enemy_score := 100

func _ready():
	pass
	
func _physics_process(delta):
	# Inherit from EnemyTemplate
	super._physics_process(delta)
	
	if is_on_floor() == false:
		# Handle gravity
		velocity.y += _gravity * delta
	else:
		# Handle horizontal movement
		velocity.x = speed * _facing
	
	move_and_slide()
	
	# If wall is detected OR no floor is detected, flip enemy
	if is_on_floor() == true:
		if is_on_wall() == true or floor_detection.is_colliding() == false:
			flip_me()

# Function that handles the enemies facing
func flip_me() -> void:
	# Flip enemy animation
	animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h
	# Flip raycaster
	floor_detection.position.x = floor_detection.position.x * -1
	
	if _facing == FACING.LEFT:
		_facing = FACING.RIGHT
	else:
		_facing = FACING.LEFT


func _on_animated_sprite_2d_animation_finished():
	Globals.score += enemy_score
	if animated_sprite_2d.animation == "hurt":
		queue_free()
