extends Node

@export var spheresToCheck: Array[MeshInstance3D]

var d
var e


var V_Mag
var Vc
var Vc_Mag

var V1
var V2


var r1 = 0.5 # Radius 1
var r2 = 0.5 #Radius 2
	
var collisionHappened = false

var s1_previousPos = Vector3(0,0,0)
var s2_previousPos = Vector3(0,0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	for i in range(spheresToCheck.size()):
		var sphere1 = spheresToCheck[i]
		for j in range(i+1, spheresToCheck.size()):
			var sphere2 = spheresToCheck[j]
			
			if (!collisionHappened):
				_checkCollision(sphere1,sphere2, delta)
			
			else: #Collision happened
				sphere1.moveSpeedx = 0
				sphere1.moveSpeedy = 0
				
				sphere2.moveSpeedx = 0
				sphere2.moveSpeedy = 0
	pass

func _checkCollision(sphere1, sphere2, delta):
	
	
	V1 = (sphere1.transform.origin - s1_previousPos) / delta    #Velocity vector of sphere 1                                 
	s1_previousPos = sphere1.transform.origin #Updates previousPos 
	
	
	V2 = (sphere2.transform.origin - s2_previousPos) / delta    #Velocity vector of sphere 1                                 
	s2_previousPos = sphere2.transform.origin #Updates previousPos 
	
	if (sphere2.V_Mag != 0):
		_stationaryCollision(sphere1,sphere2,delta)
	
	
	
	pass
	
func _getVector(Sphere1, Sphere2):
	return Sphere2-Sphere1
	
#Gets the length of a vector
func _getMagnitudeOfVector(x,y,z): # I know Godot has a .length() feature but i didn't want to use it
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
	
	#Distance between two vectors
func _getDist(a,b):
	return a.distance_to(b)
	
func _getUnitVec(a):
	return (a / _getMagnitudeOfVector(a.x,a.y,a.z))

func _stationaryCollision(a,b,delta):
	var A = _getVector(a.position,b.position)   # Vector from Sphere 1 to Sphere 2 
	var A_Mag = _getMagnitudeOfVector(A.x,A.y,A.z)
	
	var q = (_getAngleBetweenVectors(V1,A))
	
	d = sin(deg_to_rad(q)) * A_Mag
	if (d < r1 + r2):
		
	#Using Pythagoras we can find e
		e = sqrt((r1+r2)*(r1+r2) - (d*d))
		
		Vc_Mag = cos(deg_to_rad(q)) * A_Mag - e
		V_Mag = _getMagnitudeOfVector(V1.x,V1.y,V1.z)

		Vc = (Vc_Mag * V1) / V_Mag

		
		if (Vc  <= Vector3(0.005,0.005,0.005 and Vc  >= Vector3(-0.005,-0.005,-0.005))):
			print("CollisonHasHappened")
			collisionHappened = true
			
	pass
