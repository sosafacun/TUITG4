extends LevelParent

@export var outside_level_scene: PackedScene

func _on_gate_player_entered_gate():
	var set_player_speed_tween = get_tree().create_tween()
	set_player_speed_tween.tween_property($Player, "speed", 0, 0.5)
	get_tree().change_scene_to_file("res://scenes/levels/inside.tscn")

func _on_house_player_entered_house(): 
	var camera_zoom = get_tree().create_tween()
	camera_zoom.tween_property($Player/Camera2D, "zoom", Vector2(1,1), 1)


func _on_house_player_exited_house():
	var camera_zoom = get_tree().create_tween()
	camera_zoom.tween_property($Player/Camera2D, "zoom", Vector2(0.6,0.6), 1)
