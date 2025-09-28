extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var questions = ["I wish for a million dollars!", "I wish my girlfriend to love me.", "I wish to be able to teleport."]
var i;
func _ready() -> void:
	if get_node("../Haz") or null:
		i = 2
	elif get_node("../Fa2") or null:
		i = 1
	else:
		i = 0


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Interact") && $"../E".visible == true:
		$Camera2D.enabled = false
		$"../convo_camera".enabled = true
		$"../E".visible = false
		$".".visible = false
		get_node("../ChoiceScene/ChoicePrompt").show_choices(questions[i])
		i += 1
		
		print(i)
		$"../ChoiceScene".visible = true
		$"../convo_camera".zoom.x = 5
		$"../convo_camera".zoom.y = 5
		if $"../Tom".get_child_count() == 0:
			$"../convo_camera".position.x = $"../Tom".position.x+70
			$"../convo_camera".position.y = $"../Tom".position.y
		else:
			$"../convo_camera".position.x = $"../Tom/Sprite2D".position.x+70 - 113
			$"../convo_camera".position.y = $"../Tom/Sprite2D".position.y - 113

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("FEL") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("BALRA", "JOBBRA")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	$"../Jel".visible = false
	$"../convo_camera".position.x = $".".position.x
	$"../convo_camera".position.y = $".".position.y
	$"../E".visible = true
	
func _on_area_2d_body_exited(body : Node2D) -> void:
	$"../Jel".visible = true
	$"../E".visible = false
	$"../ChoiceScene".visible = false
	$"../convo_camera".enabled = false
	$Camera2D.enabled = true
	$".".visible = true

	
	
	
func _on_level_body_entered2(_body: Node2D) -> void:
	get_tree().change_scene_to_file("res://schene2.tscn")
	
func _on_level_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://scene3.tscn")
	


func _on_area_2d_body_enteredA2(body: Node2D) -> void:
	$"../Jel".visible = false
	$"../E".visible = true
	


func _on_area_2d_body_exitedAC2(body: Node2D) -> void:
	$"../E".visible = false
	$"../Jel".visible = true
	
	


func _on_area_2d_body_enteredAC3(body: Node2D) -> void:
	$"../Jel".visible = false
	$"../E".visible = true
	


func _on_area_2d_body_exitedAC3(body: Node2D) -> void:
	$"../E".visible = false
	$"../Jel".visible = true
