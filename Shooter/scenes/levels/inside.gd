extends LevelParent

func _on_exit_gate_area_body_entered(_body):
	var set_player_speed_tween = get_tree().create_tween()
	set_player_speed_tween.tween_property($Player, "speed", 0, 0.5)
	get_tree().change_scene_to_file("res://scenes/levels/outside.tscn")
