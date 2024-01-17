extends Area2D

@onready var collision = $collision as CollisionShape2D
@onready var spikes = $spikes as Sprite2D

@export var spike_length = 2
@export var on_wall = false
@export var on_right_wall = false
# Called when the node enters the scene tree for the first time.
func _ready():
	spikes.set_region_rect(Rect2(Vector2(0,8), Vector2((spike_length * 8), 8)))
	collision.shape.size = spikes.get_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
