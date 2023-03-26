extends FishState

var target_location: Vector2
var point_closeness = Vector2(2, 2)

func enter(msg := {}) -> void:
	target_location = Vector2(msg.x, msg.y)


func _physics_process(delta):
	if (fish.position.distance_to(target_location) > 2):
		var direction = (target_location - fish.position).normalized()
			
		fish.position += Vector2(
			(delta * fish.speed_raw) * direction.x, 
			(delta * fish.speed_raw / 2) * direction.y
		)
	else:
		fish.state_machine.transition_to("Idle")
