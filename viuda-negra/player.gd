extends CharacterBody2D

@export var speed := 200.0
var interactable: Node = null

func _physics_process(delta):
	var input_vector = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)

	velocity = input_vector.normalized() * speed
	move_and_slide()

func _input(event):
	if event.is_action_pressed("ui_accept") and interactable:
		interactable.interact()

func _on_InteractArea_body_entered(body):
	if body.has_method("interact"):
		interactable = body

func _on_InteractArea_body_exited(body):
	if interactable == body:
		interactable = null


func _on_interact_area_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_interact_area_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
