extends KinematicBody2D
#enum {Patrol, Seek, Destroy}
#export (int) var vitesse = 150
#var joueur
#var comportement = Patrol


# Called when the node enters the scene tree for the first time.
func _ready():
	pass# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _on_Area2D_body_entered(body):
#	joueur = body
#	print(body.name)
