extends Node
@export var lazer: PackedScene
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_destructor_body_entered(body):
	if body.name != "Player":
		body.queue_free()
	pass # Replace with function body.


func _on_lazer_death():
	$ScoreTimer.stop()
	$LazerSpawner.stop()
	get_tree().call_group("obstacle","queue_free")
	$HUD.unhide()
	
	pass # Replace with function body.


func _on_lazer_spawner_timeout():
	var spawns = [$"Spawn Location One",$"Spawn Location Two",$"Spawn Location Three"]
	var spawn = randi_range(0,2)
	
	var lazer_scene = lazer.instantiate()
	lazer_scene.connect("death",_on_lazer_death)
	lazer_scene.position = spawns[spawn].position
	get_parent().add_child(lazer_scene) # Add the instantiated laser to the scene tree


func _on_hud_start():
	$LazerSpawner.start()
	$ScoreTimer.start()
	pass # Replace with function body.


func _on_score_timer_timeout():
	var scoreText = "distance (m): "
	score += 1
	scoreText += str(score)
	$HUD.update_score(scoreText)
	pass # Replace with function body.
