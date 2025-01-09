extends MeshInstance3D

@export var moveSpeedx := 0
@export var moveSpeedy := 0
@export var moveSpeedz := 0
@export var mass := 1
#Velocity vector variables
var previousPos

var V: Vector3
var VMag

var HasCollided = false

var startPos


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#Initialises the variable with its starting origin
	previousPos = transform.origin
	startPos = transform.origin
	V = Vector3(moveSpeedx,moveSpeedy,moveSpeedz)
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#Moves main sphere
	position += V * delta
	#print(V)
	V = (transform.origin - previousPos) / delta                               
	previousPos = transform.origin #Updates previousPos 	

		#position += V * delta
		
		#print(V)
		#V = (transform.origin - previousPos) / delta  
		
	
		#var newVel = _velocityImpulse(0,0,mass)
		
		

		


	
		
			
			

	
	

	
	
