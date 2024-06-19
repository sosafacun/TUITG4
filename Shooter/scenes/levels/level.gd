extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/items/item.tscn")


func _ready():
	for container in get_tree().get_nodes_in_group('Container'):
		container.connect("open", _on_container_opened)

func _on_container_opened(spawn_point, direction):
	var item = item_scene.instantiate()
	item.position = spawn_point
	item.direction = direction
	$Items.call_deferred('add_child', item)

func _on_player_player_shot_laser(pos, player_direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(player_direction.angle()) + 90
	laser.direction = player_direction
	$Projectiles.add_child(laser)
	$UI.update_laser_text()

func _on_player_player_shot_grenade(pos, player_direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = player_direction * grenade.speed
	$Projectiles.add_child(grenade)
	$UI.update_grenade_text()


func _on_player_update_stats():
	$UI.update_laser_text()
	$UI.update_grenade_text()
