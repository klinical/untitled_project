extends FishState

# Called when the node enters the scene tree for the first time.
func enter(_msg := {}) -> void:
	fish.move_to_new_location()
