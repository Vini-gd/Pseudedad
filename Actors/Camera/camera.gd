extends Camera2D;

@export_category("Configs")
@export var dead_zone : int = 25;

func _input(event) -> void:
	if event is InputEventMouseMotion:
		var _target = event.position - get_viewport_rect().size * 0.5;
		if _target.length() < dead_zone:
			self.position = Vector2.ZERO;
		else:
			self.position = _target.normalized() * (_target.length() - dead_zone) * 0.5;
