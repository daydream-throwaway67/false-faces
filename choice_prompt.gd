extends Control

func show_choices (question: String):
	selected = false
	$BoxContainer.visible = true
	$"../Sprite2D".visible = true
	$"../Sprite2D".modulate.a = 0.0
	$Question.modulate.a = 0.0
	$Question.visible = true
	$Question.text = question
	$BoxContainer/Accept.connect("pressed", Callable(self, "_on_choice_selected").bind("accept", question))
	$BoxContainer/Decline.connect("pressed", Callable(self, "_on_choice_selected").bind("decline", question))
	var tween = create_tween()
	tween.tween_property($"../Sprite2D", "modulate:a", 1.0, 0.5)
	for child in get_children():
		tween = create_tween()
		tween.tween_property(child, "modulate:a", 1.0, 0.5)
	
var selected = false
func _on_choice_selected(choice, question):
	if not selected:
		selected = true
		Global.answers[question] = choice
		for answer in Global.answers:
			print(answer)
		
		var tween
		print(Global.answers)
		for child in get_children():
			tween = create_tween()
			tween.tween_property(child, "modulate:a", 0.0, 0.5)
		tween = create_tween()
		tween.tween_property($"../Sprite2D", "modulate:a", 0.0, 0.5)
		if Global.answers.size() == 3:
			get_tree().change_scene_to_file("res://control.tscn")
