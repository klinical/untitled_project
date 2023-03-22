extends Area2D

@export var speed: float
@export var weight: float
@export var target_location: Vector2

var sprite: Sprite2D

# Called when the node enters the scene tree for the first time.
func _process(delta):
	var direction = global_position - target_location
	pass # Replace with function body.


func set_texture(texture: Texture):
	if !is_instance_valid(sprite):
		sprite = Sprite2D.new()
		add_child(sprite)
		
	sprite.texture = texture


func set_weight(_weight: float):
	weight = _weight
	
	
