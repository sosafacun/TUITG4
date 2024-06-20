extends CharacterBody2D
class_name EnemyContainer

signal laser(enemy_laser_position, enemy_laser_direction)

var player_nearby: bool = false
var player_detected: bool = false
var can_enemy_shoot: bool = true

@export var gun_amount: int = 0
@export var health: int = 0
@export var damage: int = 10
@export var speed: int = 0


var selected_gun = gun_amount - 1

func _process(_delta):
	if(player_detected):
		move()
		look_at(Globals.player_position)
		if(player_nearby):
			if (can_enemy_shoot):
				enemy_engage()

func enemy_engage():
	var gun_markers = $AttackNode/EnemyProjectileSpawnPoints.get_children()
	var active_gun = gun_markers[selected_gun]
	
	var enemy_laser_position: Vector2 = active_gun.global_position
	var enemy_laser_direction: Vector2 = (Globals.player_position - position).normalized()
	
	laser.emit(enemy_laser_position, enemy_laser_direction, damage)
	
	can_enemy_shoot = false
	$AttackNode/AttackCD.start()
	
	if (selected_gun <= 0):
		selected_gun = gun_amount - 1
	else:
		selected_gun -= 1

func move():
	look_at(Globals.player_position)
	var direction: Vector2 = (Globals.player_position - position).normalized()
	velocity = direction * speed
	move_and_slide()

func _on_attack_range_body_entered(_body):
	player_nearby = true
func _on_attack_range_body_exited(_body):
	player_nearby = false

func _on_projectile_cd_timeout():
	can_enemy_shoot = true

func hit(_damage:int):
	health -= _damage
	$EnemySprite.material.set_shader_parameter("progress", 1)
	$HitParticles.emitting = true
	$HitBlink.start()
	if(health <= 0):
		$".".queue_free()

func _on_hit_blink_timeout():
	$EnemySprite.material.set_shader_parameter("progress", 0)

func _on_detection_radius_body_entered(_body):
	player_detected = true

func _on_detection_radius_body_exited(_body):
	player_detected = false
