extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/items/item.tscn")

func _ready():
	for container in get_tree().get_nodes_in_group('Container'):
		container.connect("open", _on_container_opened)
	for enemy in get_tree().get_nodes_in_group('Enemies'):
		enemy.connect("laser", _on_enemy_engage)

func _on_container_opened(spawn_point, direction):
	var item = item_scene.instantiate()
	item.position = spawn_point
	item.direction = direction
	$Items.call_deferred('add_child', item)

func _on_enemy_engage(enemy_laser_position, enemy_laser_direction, damage):
	create_laser(enemy_laser_position, enemy_laser_direction, false, damage)

func _on_player_player_shot_laser(pos, player_direction, damage):
	create_laser(pos, player_direction, true, damage)
	
func create_laser(pos, direction, is_player_laser, damage):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	laser.damage = damage
	if(is_player_laser):
		$Projectiles.add_child(laser)
	else:
		$Projectiles.add_child(laser)
		laser.modulate = Color('d30032e5')

func _on_player_player_shot_grenade(pos, player_direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = player_direction * grenade.speed
	$Projectiles.add_child(grenade)
