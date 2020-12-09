extends KinematicBody2D

export var vitesse = 500
var velocite = Vector2()
enum STATES {IDLE, ATTACKING}
var state = STATES.IDLE
export (int) var strength
onready var target = $"../Player2"

func creer(pos,dir,rotation_degress,sprite):
	position = pos
	velocite = Vector2(vitesse,0).rotated(dir)
	if sprite == "player":
		$AnimatedSprite.play("Balle_Player")
		$AnimatedSprite.scale.x = 1
		$AnimatedSprite.scale.y = 1
		strength = 100
	if sprite == "ennemispetit":
		$AnimatedSprite.play("Balle_Ennemis")
		$AnimatedSprite.scale.x = 1
		$AnimatedSprite.scale.y = 1
		$AnimatedSprite.rotation_degrees = rotation_degress
		strength = 5
	if sprite == "ennemisgros":
		$AnimatedSprite.play("Missille_Ennemis")
		$AnimatedSprite.scale.x = 0.5
		$AnimatedSprite.scale.y = 0.5
		$AnimatedSprite.rotation_degrees = (rotation_degress+90)
		strength = 10
	if sprite == "ennemis":
		$AnimatedSprite.play("Balle_Ennemis")
		$AnimatedSprite.scale.x = 1
		$AnimatedSprite.scale.y = 1
		$AnimatedSprite.rotation_degrees = (rotation_degress+90)
		strength = 5
func _physics_process(delta):
	var collision = move_and_collide(velocite*delta)
	if collision:
		if collision.collider.name.left(2) == "@E":
			yield(get_tree().create_timer(0.02), "timeout")
			target.elimination_ennemies()
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Timer_timeout():
	if not target:
		$Timer.stop()
		return

	if state != STATES.IDLE:
		return

	state = STATES.ATTACKING

func damage_target(target, damage):
	target.take_damage(damage)

func _on_Player_died():
	target = null
