extends MeshInstance3D


#Make otherObject able to be anything

var otherObject = Vector3(4,3,0)
var thisObject = Vector3(-2,5,0)


#Velocity vector variables
var previousPos



var thisObject_length

var A
var V = Vector3(0,0,0)
var d
var q


var angleBetween 
var closestApproach


var vel_length
var A_length
const RADIUS = 0.5


#vectors = vectors3(position) - vectors3(otherobject)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#Initialises the variable with its starting origin
	previousPos = global_transform.origin
	
	# 'position' is This sphere, and otherObject is the other sphere                                   
	A = _getVector(position,otherObject)
	#print(A)
	
	
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#Move in x to test
	position.x += 0.1 * delta
	
	#Distance (Current Pos - Old Pos) / time (Delta)
	V = (global_transform.origin - previousPos) / delta                                       #V
	previousPos = global_transform.origin


	# radius 1 and radius 2 squared - d squared = e 
	
	q = (_getAngleBetweenVectors(otherObject,thisObject))
	print(q)
	#Projects the position onto the V vector
	#The closest point of approach happens when the position is perpendicular to the V vector
	#angleBetween = (V.normalized() * A.dot(V)) / vel_length                 #q
	#print (angleBetween)
	
	#closestApproach = V - angleBetween
	#var distToCloApproach = closestApproach.length()
	#d = distToCloApproach - (RADIUS + RADIUS) 
	#if D is less than r1 + r2 (in this case, 1) then collision is possible
	#print (d)
	
	pass

#Gets the vector of sphere 1 and sphere 2
func _getVector(Sphere1, Sphere2):
	return Sphere2-Sphere1
	
func _getMagnitudeOfVector(x,y,z):
	return sqrt((x*x) + (y*y) + (z*z))
	
func _getAngleBetweenVectors(U, V):
	#Dot product of the two vectors
	var dot = U.dot(V)
	#Magnitude of the two vectors
	var uMag = _getMagnitudeOfVector(U.x,U.y,U.z)
	var vMag = _getMagnitudeOfVector(V.x,V.y,V.z)
	
	#Dot product divided by the magnitudes multiplied togehter
	#And then that answer multiplied by inverse cosine
	#Has to be converted to degrees to get the angle 
	var formula = rad_to_deg(acos(dot / (uMag * vMag)))
	return formula
	
	
	

	
	
