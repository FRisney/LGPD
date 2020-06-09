extends Node

# Sinais que poderao ser usados a partir de qualquer Node a qualquer momento
signal changed_destination(data)
signal finished_questions(data)
signal changed_choice(choice)
signal started_tension


func _ready() -> void:
	Events.connect("started_tension", self, "_on_started_tension")
	Events.connect("changed_destination", self, "_on_changed_destination")
	Events.connect("changed_choice", self, "_on_changed_choice")


func _on_started_tension():
	Audio.get_node("Tensao").play()


func _on_changed_destination(_data: Dictionary):
	Audio.get_node("Resposta").play()

func _on_changed_choice(_choice: int):
	Audio.get_node("Alternativa").play()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("alt_a"):
		Events.emit_signal("changed_choice", 0)
	if event.is_action_pressed("alt_b"):
		Events.emit_signal("changed_choice", 1)
