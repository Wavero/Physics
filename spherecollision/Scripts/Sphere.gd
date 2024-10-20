extends MeshInstance3D


@onready var otherSphere = $"../TesterSphere"

#Velocity vector variables
var previousPos



#Variable names inspired from Week 1 Slides to help visualise it
var A # Vector from Sphere 1 - Sphere 2
var A_Mag
var V  # Velocity Vector for Sphere 1
var V_Mag
var d #Distance between the centres of the two speheres at closest approach along the path of V
var q # Angle between V and A

var e 

#both placeholders
var r1 = 0.5 # Radius 1
var r2 = 0.5 #Radius 2

var HasCollided = false

var Vc
var Vc_Mag


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#Initialises the variable with its starting origin
	previousPos = global_transform.origin
	
	
	
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#Moves main sphere
	if (!HasCollided):
		position.x += 0.6 * delta
		position.y += 0.6 * delta
	
	#Distance (Current Pos - Old Pos) / time (Delta)
	V = (global_transform.origin - previousPos) / delta    #Velocity vector of sphere 1                                 
	previousPos = global_transform.origin #Updates previousPos 
	#print(V)
	
	# 'position' is This instance, and otherObject is the other sphere
	A = _getVector(position,otherSphere.position)   # Vector from Sphere 1 to Sphere 2 
	A_Mag = _getMagnitudeOfVector(A.x,A.y,A.z)
	
	q = (_getAngleBetweenVectors(V,A))  # Find the angle between V and A
	
	
	#Using SohCahToa, d being the opposite, A being the hypotenuse, q being the angle, we can find D
	#If D is less than the sum of R1 and R2, then collision is possible
	d = sin(deg_to_rad(q)) * A_Mag
	
	if (d < r1 + r2):
		
		#Using Pythagoras we can find e
		e = sqrt((r1+r2)*(r1+r2) - (d*d))
		
		
		Vc_Mag = cos(deg_to_rad(q)) * A_Mag - e
		V_Mag = _getMagnitudeOfVector(V.x,V.y,V.z)
		Vc = _getUnitVec(V) * (Vc_Mag - e)
		
		
		if (Vc <= Vector3(0.005,0.005,0.005 and Vc >= Vector3(-0.005,0.005,0.005))):
			print("CollisonHasHappened")
			HasCollided = true
		
		


	pass

#Gets the vector of sphere 1 and sphere 2
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
	
	
	

	
	
