extends Node2D


@onready var pipeSpawner = get_parent()
@onready var main = get_node("/root/MainLevel")
@onready var player = get_node("/root/MainLevel/Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	$TopPipe.position.y += randf_range(50, 80)
	$BottomPipe.position.y -= randf_range(50, 80)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!main.isDead):
		position.x -= pipeSpawner.pipeSpeed * delta

func _on_top_pipe_body_entered(body):
	if (body.name == "Player"):
		player.playerDies()

func _on_bottom_pipe_body_entered(body):
	if (body.name == "Player"):
		player.playerDies()

func _on_earn_point_body_entered(body):
	if (body.name == "Player"):
		$Point.play()
		main.score += 1

func _on_detect_remover_area_entered(area):
	if (area.name == "ItemsRemover"):
		queue_free()
