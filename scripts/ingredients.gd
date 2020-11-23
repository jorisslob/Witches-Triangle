extends Node

var _path = "res://ingredients.json"

var ingredients: Dictionary = {}

func _ready():
	_load_ingredients()
		
func _load_ingredients():
	var file = File.new()
	file.open(_path, File.READ)
	var json = JSON.parse(file.get_as_text())
	file.close()
	
	for ingredient in json.result["ingredients"]:
		ingredients[ingredient.name] = ingredient
		
func get_all_from_category(category):
	var resultDict: Dictionary = {}
	for key in ingredients.keys():
		var ingredient = ingredients[key]
		if ingredient["categories"].has(category):
			resultDict[key] = ingredient
	
	return resultDict
