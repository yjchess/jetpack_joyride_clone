extends CharacterBody2D
const GRAVITY = 10
var start = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	if start == true:
		if velocity.y < 200:
			velocity.y += GRAVITY
		
		if Input.is_action_pressed("jetpack"):
		#if Input.is_action_just_pressed("jetpack"):
			velocity.y = -300
			$GPUParticles2D.emitting = true
			$GPUParticles2D2.emitting = true
			
			if self.rotation_degrees <45:
				self.rotation_degrees +=5
			
		else:
			$GPUParticles2D.emitting = false
			$GPUParticles2D2.emitting = false
			if self.rotation_degrees >10:
				self.rotation_degrees -=1
		
		if self.is_on_floor():
			self.rotation_degrees = 0
		
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _start():
	start = true

func _finish():
	start = false
