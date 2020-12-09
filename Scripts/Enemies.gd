extends KinematicBody2D
export (int) var vitesse = 150
export (PackedScene) var balle
onready var canon = $CanonEnnemies
var velocite = Vector2()
var joueur
var joueur_present
var verifier_position
var can_shoot = false
export (String) var sprite
var nbBalle = 0
var rng = RandomNumberGenerator.new()
export (int) var rotation2
var rotation_initial = rotation2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if sprite == "ennemisgros":
		$AnimatedSprite.play("moyen")
		rotation = rotation2
	if sprite == "ennemispetit":
		$AnimatedSprite.play("petit")
		rotation = rotation2
		$AnimatedSprite.flip_v = true
	if sprite == "ennemis":
		$AnimatedSprite.play("gros")
	if	can_shoot:
		can_shoot = false
		#print(nbBalle)
		var b = balle.instance()
		var rotation_degree = global_rotation_degrees
		#print(rotation_degree)
		if sprite == "ennemis" && nbBalle == 0:
			rotation = rotation2 + 0.10
			rotation2 = rotation2 + 0.10
		if sprite == "ennemis" && nbBalle == 1:
			rotation = rotation2 - 0.10
			rotation2 = rotation2 - 0.10
		if sprite == "ennemis" && nbBalle == 2:
			rotation = rotation2 - 0.10
			rotation2 = rotation2 - 0.10
		if sprite == "ennemis" && nbBalle == 3:
			rotation = rotation2 + 0.10
			rotation2 = rotation2 + 0.10
			nbBalle = -1
		nbBalle += 1
		$AudioStreamPlayer2D.play(0)
		b.creer(canon.global_position,rotation2, rotation_degree,sprite)
		get_parent().add_child(b)

func _physics_process(delta):
	var collision = move_and_collide(velocite * delta)
	if collision:
		queue_free()
	#var dir = joueur.position.x
	#print(dir)
	velocite = move_and_slide(velocite)

func _on_GlobalCoolDownTire_timeout():
	can_shoot = true

func _on_Area2D_body_entered(body):
	joueur = body
	#print(joueur.position)




