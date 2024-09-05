extends Area2D

func _on_body_entered(body):
	#body.get_node("label").text += str(int(body.get_node("label").text) + 1)
	queue_free()
