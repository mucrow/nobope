extends CharacterBody2D


const SPEED = 240.0
const ACCELERATION = 70.0


func _physics_process(_delta):
  if Input.is_action_just_pressed('interact'):
    # TODO here's where we can interact with stuff in ExploreScene
    pass

  var move_input = Input.get_vector('move_left', 'move_right', 'move_up', 'move_down')
  if move_input.length() < 0.9:
    move_input = Vector2.ZERO
  else:
    move_input = move_input.normalized()

  if move_input.length() > 0:
    var target_velocity = move_input * SPEED
    velocity = velocity.move_toward(target_velocity, ACCELERATION)
  else:
    velocity = velocity.move_toward(Vector2.ZERO, ACCELERATION)

  move_and_slide()
