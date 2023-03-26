extends FishState


func enter(msg := {}) -> void:
	var path_2D: Node = fish.get_node_or_null("Path2D")
	if path_2D != null:
		path_2D = path_2D as Path2D
		var curve: Curve2D = Curve2D.new()
		
		curve.add_point(Vector2(msg.x, msg.y))
		path_2D.curve = curve
