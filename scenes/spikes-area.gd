extends Area2D

@onready var collision = $collision as CollisionShape2D
@onready var spikes = $spikes as Sprite2D

@export var on_wall = false
@export var on_right_wall = false
# Called when the node enters the scene tree for the first time.
func _ready():
	collision.shape.size = spikes.get_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
