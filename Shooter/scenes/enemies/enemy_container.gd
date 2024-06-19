extends CharacterBody2D
class_name EnemyContainer

signal laser(enemy_laser_position, enemy_laser_direction)

var player_nearby: bool = false
var can_enemy_shoot: bool = true

@export var gun_amount: int = 0
var selected_gun = gun_amount - 1

func _process(_delta):
	
	if(player_nearby):
		look_at(Globals.player_position)
		if (can_enemy_shoot):
			enemy_engage()

func enemy_engage():
	var gun_markers = $AttackNode/EnemyProjectileSpawnPoints.get_children()
	var active_gun = gun_markers[selected_gun]
	
	var enemy_laser_position: Vector2 = active_gun.global_position
	var enemy_laser_direction: Vector2 = (Globals.player_position - position).normalized()
	
	laser.emit(enemy_laser_position, enemy_laser_direction)
	
	can_enemy_shoot = false
	$AttackNode/ProjectileCD.start()
	
	if (selected_gun <= 0):
		selected_gun = gun_amount - 1
	else:
		selected_gun -= 1

func _on_attack_range_body_entered(_body):
	player_nearby = true

func _on_attack_range_body_exited(_body):
	player_nearby = false

func _on_projectile_cd_timeout():
	can_enemy_shoot = true
