extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var jumpCount = 0
@onready var mainChar = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# --- Animations ---
	if (velocity.x > 1 || velocity.x < -1):
		mainChar.animation = "running"
	else:
		mainChar.animation = "default"
		
	# Handle double jump animation
	if velocity.y < 0 and jumpCount == 1:
		mainChar.animation = "jumping"
	elif velocity.y < 0 and jumpCount == 2:
		mainChar.animation = "doubleJump"
	
	# Not on ground? Add gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	# Touch ground.
	if is_on_floor():
		jumpCount = 0

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		if jumpCount < 2:
			velocity.y = JUMP_VELOCITY
			jumpCount = jumpCount + 1

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	mainChar.flip_h = isLeft
	


func _on_head_collider_body_entered(body):
	if body.has_method("break_sprite"):
		body.hitpoints -= 1
		if body.hitpoints < 0:
			body.break_sprite()
		else:
			body.create_coin()
			body.animation_player.play("hit")
