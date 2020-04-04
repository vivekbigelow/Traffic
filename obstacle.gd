extends KinematicBody

var cubeVelocity = Vector3(0,0,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	self.translation.x = rand_range(-4.843,4.843)
	self.translation.y = 0.449
	self.translation.z = 10
	
#init function to pass a custom velocity to an obstacle	
func init(velocity):
 cubeVelocity = velocity
	
func _physics_process(delta):
	if self.translation.z < -20:
			self.queue_free()
	
			
	move_and_collide(cubeVelocity)

	
	
	
		
	