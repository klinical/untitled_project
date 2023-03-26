class_name FishState
extends State

var fish: Fish

func _ready() -> void:
	await owner.ready
	fish = owner as Fish
	assert(fish != null)
