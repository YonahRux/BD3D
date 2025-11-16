extends CharacterBody3D

var base_speed: float = 50.0
var speed_mult: float = 10.0
var speed: float = base_speed * speed_mult

func _process(delta: float) -> void:
	move_logic(delta)
	move_and_slide()
	
func move_logic(delta: float) -> void:
	var movement_input: Vector2 = Input.get_vector("left", "right", "forward", "backward")
	var v3: Vector3 = v2_to_v3(movement_input)
	if movement_input != Vector2.ZERO:
		velocity = (v3 * speed) * delta
	else:
		velocity = v3.move_toward(Vector3.ZERO, delta * .1)

func v2_to_v3(v2: Vector2) -> Vector3:
	var v3: Vector3 = Vector3(v2.x, 0, v2.y)
	return v3
