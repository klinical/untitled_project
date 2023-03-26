class_name Fish
extends RigidBody2D

@export var weight: float = 5
@export var speed: float = 10
@export var x_bounds: Vector2 = Vector2(200, 600)
@export var y_bounds: Vector2 = Vector2(180, 40)

var not_done_already = true
var state_machine: StateMachine
var rng: RandomNumberGenerator = RandomNumberGenerator.new()
var speed_raw: float = 10 * speed

# Called when the node enters the scene tree for the first time.
func _ready():
	state_machine = $StateMachine


func move_to_new_location():
	var vec = Vector2(rng.randf_range(x_bounds.x, x_bounds.y), rng.randf_range(y_bounds.x, y_bounds.y))
	var msg = {"x": vec.x, "y": vec.y}
	state_machine.transition_to("Moving", gen_target_location())


func gen_target_location() -> Dictionary:
	var vec = Vector2(rng.randf_range(x_bounds.x, x_bounds.y), rng.randf_range(y_bounds.x, y_bounds.y))
	var msg = {"x": vec.x, "y": vec.y}
	return msg


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ready and not_done_already:
		move_to_new_location()
		not_done_already = false
