extends PointLight2D

func emit_light():
	enabled = true
	var tween = get_tree().create_tween()
	tween.tween_property(self, "energy", 0, 0.15)
