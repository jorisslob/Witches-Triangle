extends Node

const _PATH = "res://ingredients.json"

var ingredients = []

func _ready():
	_load_ingredients()
		
func _load_ingredients():
	var file = File.new()
	file.open(_PATH, File.READ)
	var json = JSON.parse(file.get_as_text())
	file.close()
	
	ingredients = json.result["ingredients"]

func get_all_from_category(category):
	var resultArray = []
	for ingredient in ingredients:
		if ingredient["categories"].has(category):
			resultArray.append(ingredient)

	return resultArray
