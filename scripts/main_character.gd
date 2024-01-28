extends CharacterBody2D

const JUMP_VELOCITY = -400.0
const SPEED = 300.0

@onready var animation = $anim
@onready var ray_left = $ray_left
@onready var ray_left_2 = $ray_left2
@onready var ray_right = $ray_right
@onready var ray_right_2 = $ray_right2

@onready var jumpSound = $jumpSound
@onready var hurt_sound = $hurtSound
@onready var player_death_sound = $playerDeathSound

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var knockback_vector := Vector2.ZERO
var jumpCount := 0
var direction
var is_hurted := false

signal player_has_died()

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animation.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if knockback_vector != Vector2.ZERO:
		velocity = knockback_vector

	# Handle double jump animationation
	if velocity.y < 0 and jumpCount == 1:
		animation.play("jump")
		jumpSound.pitch_scale = 1.25
	elif velocity.y < 0 and jumpCount == 2:
		animation.play("doubleJump")
		jumpSound.pitch_scale = 1.50
		
	if is_on_floor():
		jumpCount = 0
		
	if Input.is_action_just_pressed("ui_accept"):
		if jumpCount < 2:
			jumpSound.play()
			velocity.y = JUMP_VELOCITY
			jumpCount = jumpCount + 1

	move_and_slide()
	_set_state()

	for platforms in get_slide_collision_count():
		var collision = get_slide_collision(platforms)
		if collision.get_collider().has_method("has_collided_with"):
			collision.get_collider().has_collided_with(collision, self)

func _set_state():
	var state = "idle"
	if !is_on_floor() && jumpCount > 1:
		state = "doubleJump"
	elif !is_on_floor():
		state = "jump"
	elif direction != 0:
		state = "run"
	if is_hurted:
		state = "hurt"
	if animation.name != state:
		animation.play(state)

func _on_hurtbox_body_entered(_body):
	if ray_right.is_colliding() or ray_right_2.is_colliding():
		take_damage(Vector2(-200, -200))
	elif ray_left.is_colliding() or ray_left_2.is_colliding():
		take_damage(Vector2(200, -200))
	else:
		take_damage(Vector2(0, 200))

func _on_hurtbox_area_entered(_area):
	take_damage(Vector2(200 * (direction * -1), -400))

func take_damage(knockback_force := Vector2.ZERO, duration := 0.25):
	
	if Globals.player_life > 0:
		hurt_sound.play()
		Globals.player_life -= 1
	else:
		player_death_sound.play()
		queue_free()
		emit_signal("player_has_died")
		
	if knockback_force != Vector2.ZERO:
		knockback_vector = knockback_force
		var knockback_tween := get_tree().create_tween()
		knockback_tween.parallel().tween_property(self, "knockback_vector", Vector2.ZERO, duration)
		animation.modulate = (Color(1,0,0,1))
		knockback_tween.parallel().tween_property(animation, "modulate", Color(1,1,1,1), duration)
		
	is_hurted = true
	await get_tree().create_timer(.3).timeout
	is_hurted = false
	
func _on_head_collider_body_entered(body):
	if body.has_method("break_sprite"):
		body.hitpoints -= 1
		if body.hitpoints < 0:
			body.break_sprite()
		else:
			body.create_coin()
			body.animation_player.play("hit")


