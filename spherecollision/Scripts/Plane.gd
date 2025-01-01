extends MeshInstance3D

@onready var PointA = $PointA
@onready var PointB = $PointB
@onready var PointC = $PointC


# Called when the node enters the scene tree for the first time.
func _ready():
	_getNormal()
	#print(PointA.position)
	#print(PointB.position)
	# print(PointC.position)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(_getNormal())
	#print(AC)
	pass
	#print(normal)



func _getNormal():
	var AB = PointB.global_position - PointA.global_position  
	var AC = PointC.global_position - PointA.global_position
	
	var normal = _crossProd(AB.x,AB.y,AB.z,AC.x,AC.y,AC.z)
	return normal.normalized()

func _crossProd(ai,aj,ak,bi,bj,bk):
	
	var i = (aj*bk)-(bk*ak)
	var j = (ai*bk)-(bi*ak)
	var k = (ai*bj)-(bi*aj)
	return Vector3(i,j,k)
	
	
	
