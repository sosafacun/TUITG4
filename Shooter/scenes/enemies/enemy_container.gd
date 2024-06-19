extends CharacterBody2D
class_name EnemyContainer

signal laser(enemy_laser_position, enemy_laser_direction)

var player_nearby: bool = false
var can_enemy_shoot: bool = true

@export var gun_amount: int = 0
@export var health: int = 0
@export var damage: int = 10

@onready var shader_material: Shader = $EnemySprite.material.get_shader()

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
	
	laser.emit(enemy_laser_position, enemy_laser_direction, damage)
	
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

func hit(_damage:int):
	health -= _damage
	shader_material.set_shader_parameter("progress", 1)
	$HitBlink.start()
	if(health <= 0):
		$".".queue_free()

func _on_hit_blink_timeout():
	shader_material.set_shader_parameter("progress", 0)
