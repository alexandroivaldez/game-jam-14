extends Node2D


@onready var platform = $platform as AnimatableBody2D
@export var WAIT_DURATION := 1.0
@export var move_speed := 15
@export var distance := 1
@export var move_horizontal := false

var follow := Vector2.ZERO
var platform_center := 16


# Called when the node enters the scene tree for the first time.
func _ready():
	move_platform()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	platform.position = platform.position.lerp(follow, 0.5)
	
func move_platform():
	var move_direction = Vector2.RIGHT * (distance * 64) if move_horizontal else Vector2.UP * (distance * 64)
	var duration = move_direction.length() / float(move_speed * platform_center)
	
	var platform_tween = create_tween().set_loops().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	platform_tween.tween_property(self, "follow", move_direction, duration).set_delay(WAIT_DURATION)
	platform_tween.tween_property(self, "follow", Vector2.ZERO, duration).set_delay(WAIT_DURATION)
