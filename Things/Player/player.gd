class_name Player extends CharacterBody2D

@onready var speed_stat = %Speed
@onready var interactor = %InteractorComponent
@onready var inventory = %Inventory
var direction: Vector2

func _ready():
	Globals.player = self

func _physics_process(delta):
	velocity = player_input_velocity()

	move_and_slide()

func player_input_velocity():
	direction = Input.get_vector(&"move_left", &"move_right", &"move_up", &"move_down")
	return direction*speed_stat.value

func _input(event: InputEvent):
	if event.is_action_pressed(&"interact"):
		interactor.attempt_interaction(self)
	if event.is_action_pressed(&"open_inventory"):
		Globals.playerInventoryDisplay.toggle(inventory)
