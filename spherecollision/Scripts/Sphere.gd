extends MeshInstance3D




@export var anotherSphere = MeshInstance3D

@export var moveSpeedx := 0
@export var moveSpeedy := 0
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


var startPos

var otherSphereStartingPos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#Initialises the variable with its starting origin
	previousPos = transform.origin
	startPos = transform.origin
	otherSphereStartingPos = anotherSphere.position
	
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#Moves main sphere
	if (!HasCollided):
		
		position.x += moveSpeedx * delta
		position.y += moveSpeedy * delta
		
		V = (transform.origin - previousPos) / delta    #Velocity vector of sphere 1                                 
		previousPos = transform.origin #Updates previousPos 
		
		
			
			

	
	

	
	
