extends Node

@export var spheresToCheck: Array[MeshInstance3D]

@export var planesToCheck: Array[MeshInstance3D]

@onready var userSphere = $Sphere

var d
var e


var V_Mag
var Vc
var Vc_Mag

var V1
var V2

var scuff = Vector3(0.00005,0.00005,0.00005)

var r1 = 0.5 # Radius 1
var r2 = 0.5 #Radius 2
	

var s1_previousPos = Vector3(0,0,0)
var s2_previousPos = Vector3(0,0,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#Checks every sphere against eachother (not itself)
	for i in range(spheresToCheck.size()):
		var sphere_i = spheresToCheck[i]
		for j in range(i+1, spheresToCheck.size()):
			var sphere_j = spheresToCheck[j]
			
			_checkCollision(sphere_i,sphere_j, delta)
		for k in range(planesToCheck.size()):
				var plane_k = planesToCheck[k]	
				_sphereToPlaneCollision(userSphere,plane_k,delta)
		
	
	pass

func _checkCollision(sphere1, sphere2, delta):
	
	
	V1 = ((sphere1.transform.origin - s1_previousPos) / delta) + scuff   #Velocity vector of sphere 1                                 
	s1_previousPos = sphere1.transform.origin #Updates previousPos 
	
	
	V2 = ((sphere2.transform.origin - s2_previousPos) / delta) + scuff   #Velocity vector of sphere 1                                 
	s2_previousPos = sphere2.transform.origin #Updates previousPos 
	
	
	_sphereCollision(sphere1,sphere2,delta)
	

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

func _sphereCollision(a,b,delta): 
	
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
			print(a)
			print("Collided with")
			print(b)
			
			a.HasCollided = true
			b.HasCollided = true
			
			
			
	pass

func _sphereToPlaneCollision(sphere,plane,delta):
	#print(plane._getNormal())
	
	
	#print(_getAngleBetweenVectors(plane._getNormal(),-V1))
	pass
	

