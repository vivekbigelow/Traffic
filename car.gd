extends KinematicBody

var velocity = Vector3()

var obstacleScene = preload("res://obstacle.tscn")
var obstacleVelocity = Vector3(0,0,-.1)

export var speed = 7
var life = 10
var score = 0

# number of obstacles made per cycle
var n = 1.0
var time_left = 2.0
var lifetag
var gameOverTag
var replayButton 



# Called when the node enters the scene tree for the first time.
func _ready():
	lifetag = self.get_parent().get_node("life")
	lifetag.text = "Life: " + str(life) + " Score: " + str(score)
	gameOverTag = self.get_parent().get_node("gameOver")
	replayButton = self.get_parent().get_node("Button")
	
func _physics_process(delta):
	velocity.x = 0
	time_left -= 10 * delta
	
	if Input.is_action_pressed("ui_left"):
		if self.translation.x >= 4.0:
			speed = 0
		velocity.x = speed
		speed = 7
		
	if Input.is_action_pressed("ui_right"):
		if self.translation.x <= -4.0:
			speed = 0
		velocity.x = -speed
		speed = 7
	
	if time_left <= 0 :
		time_left = 2.0
		
		#make obstacles faster
		if obstacleVelocity.z >= -.95:
			obstacleVelocity.z -= 0.005
		
		for i in range(n):
			make_obstacle()
			score+= 10
		n = rand_range(0,4)
		
	var collisions = move_and_collide(velocity*delta)
	
	if collisions:
		var obstacleCollided = collisions.collider
		if obstacleCollided.is_wall() == false:
			obstacleCollided.queue_free()
			life -= 1
		
	lifetag.text = "Life: " + str(life) + " Score: " + str(score)
	if life == 0:
		self.queue_free()
		gameOverTag.text = "Game Over"
		replayButton.visible = true
		
func make_obstacle():
		var obstacle = obstacleScene.instance()
		obstacle.init(obstacleVelocity)
		self.get_parent().add_child(obstacle)
