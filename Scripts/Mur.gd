extends StaticBody2D

export var hauteur = 2000
export var largeur = 100
export var oreatation = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CollisionPolygon2D.scale.x = largeur
	$Polygon2D.scale.x = largeur
	$CollisionPolygon2D.scale.y = hauteur
	$Polygon2D.scale.y = hauteur
	$CollisionPolygon2D.rotation_degrees = oreatation
	$Polygon2D.rotation_degrees = oreatation
