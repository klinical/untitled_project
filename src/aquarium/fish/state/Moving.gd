extends FishState

var target_location: Vector2
var direction: Vector2
var point_closeness = Vector2(2, 2)

func enter(msg := {}) -> void:
	target_location = Vector2(msg.x, msg.y)
	var sprite: AnimatedSprite2D = fish.get_node("AnimatedSprite2D")
	direction = (target_location - fish.position).normalized()
	if direction.x < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	
	sprite.play("swim")


func _physics_process(delta):
	if (fish.position.distance_to(target_location) > 2):
		fish.position += Vector2(
			(delta * fish.speed_raw) * direction.x, 
			(delta * fish.speed_raw) * direction.y
		)
	else:
		fish.state_machine.transition_to("Idle")
