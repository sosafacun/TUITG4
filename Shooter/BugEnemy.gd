extends EnemyContainer

func enemy_engage():
	pass

func _process(_delta):
	if(player_detected):
		move()
	if (can_enemy_shoot && player_nearby):
		enemy_engage() #I have to work on this.

func move(): #bug movement with an animation. It works
	look_at(Globals.player_position)
	var direction: Vector2 = (Globals.player_position - position).normalized()
	velocity = direction * speed
	move_and_slide()

func _on_bug_animations_animation_finished():
	if(player_nearby):
		Globals.player_hp -= damage
		$AttackNode/AttackCD.start()

func _on_detection_radius_body_entered(_body):
	player_detected = true
	$BugAnimations.play("walk")

func _on_detection_radius_body_exited(_body):
	$BugAnimations.stop()
	player_detected = false

func _on_biting_range_body_entered(body):
	player_nearby = true
	$BugAnimations.play("attack")

func _on_biting_range_body_exited(body):
	player_nearby = false
	$BugAnimations.stop()

func _on_projectile_cd_timeout():
	$BugAnimations.play("attack")
	can_enemy_shoot = true
