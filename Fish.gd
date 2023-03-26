class_name Fish
extends RigidBody2D

@export var weight: float = 5
@export var speed: float = 10
@export var x_bounds: Vector2 = Vector2(200, -200)
@export var y_bounds: Vector2 = Vector2(180, 40)

var state_machine: StateMachine
var rng: RandomNumberGenerator = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	state_machine = $StateMachine


func wake():
	var target_location = {
		"x": rng.randf_range(x_bounds.x, x_bounds.y),
		"y": rng.randf_range(y_bounds.x, y_bounds.y)
	}
	
	state_machine.transition_to("Moving", target_location)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
