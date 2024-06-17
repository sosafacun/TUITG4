extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate():
	var set_player_speed_tween = get_tree().create_tween()
	set_player_speed_tween.tween_property($Player, "speed", 0, 0.5)

func _on_gate_player_exited_gate():
	print('player has exited the gate')

func _on_player_player_shot_laser(pos, player_direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(player_direction.angle()) + 90
	laser.direction = player_direction
	$Projectiles.add_child(laser)


func _on_player_player_shot_grenade(pos, player_direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = player_direction * grenade.speed
	$Projectiles.add_child(grenade)


func _on_house_player_entered_house(): 
	var camera_zoom = get_tree().create_tween()
	camera_zoom.tween_property($Player/Camera2D, "zoom", Vector2(1,1), 1)


func _on_house_player_exited_house():
	var camera_zoom = get_tree().create_tween()
	camera_zoom.tween_property($Player/Camera2D, "zoom", Vector2(0.6,0.6), 1)
