extends PointLight2D

const laser_light_duration: float = 0.15
const initial_energy = 8

func emit_light():
	enabled = true
	energy = initial_energy
	var tween = get_tree().create_tween()
	tween.tween_property(self, "energy", 0, laser_light_duration)

func _on_laser_light_time_out_timeout():
	enabled = false
