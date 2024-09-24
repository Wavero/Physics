extends MeshInstance3D


const CENTRE = Vector3(0,0,0)

#TODO: Make radius linked to actual mesh radius
var radius = 0.5

#Make otherObject able to be anything
var otherObject = Vector3(0,12,5)

 
var distanceTo = position.distance_to(otherObject)
var vectorAx = (otherObject.x - position.x)
var lol = 5-position.x
#A - Vector from the centre of sphere 1 to sphere 2

#V - Veloctiy for sphere 1 (this)

#d - distance between centres of two spheres at closest approach along the path of V
#if d is less than the sum of radius 1 and radius 2 then collision is possible

#To find d we need the angle between V and A and the length of A
#Q is the angle between V and A 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	print(otherObject.x - position.x)
	print(vectorAx)
	print(lol)
	
	
	
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
