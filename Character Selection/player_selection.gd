extends Node2D

@onready var bodySprite = $CompositeSprites/Body
@onready var armsSprite = $CompositeSprites/Arms
@onready var hairSprite = $CompositeSprites/Hair
@onready var eyesSprite = $CompositeSprites/Eyes
@onready var pantsSprite = $CompositeSprites/Pants
@onready var shirtSprite = $CompositeSprites/Shirt
@onready var shoesSprite = $CompositeSprites/Shoes
@onready var accSprite = $CompositeSprites/Accessories
@onready var hairColorLabel = $HairColorLabel
@onready var pantsColorLabel = $PantsColorLabel
@onready var shirtColorLabel = $ShirtColorLabel
@onready var shoesColorLabel = $ShoesColorLabel
@onready var accColorLabel = $AccColorLabel
@onready var bodyColorLabel = $BodyColorLabel
@onready var armsColorLabel = $ArmsColorLabel

var rng = RandomNumberGenerator.new()

var curr_body: int = 0
var curr_arms: int = 0
var curr_hair: int = 0
var curr_eyes: int = 0
var curr_shirt: int = 0
var curr_pants: int = 0
var curr_shoes: int = 0
var curr_acc: int = 0

func _ready():
	
	#Set Starting colors
	color_indices["hair"] = 4
	color_indices["body"] = 4
	color_indices["arms"] = 4 # Match body color
	color_indices["eyes"] = 4
	color_indices["pants"] = 4
	color_indices["shirt"] = 4
	color_indices["shoes"] = 4
	color_indices["accessories"] = 4

	# Apply default colors
	_apply_all_colors()
	
	
	# Initialize color indices and apply default colors
	for item in item_colors.keys():
		color_indices[item] = 0
	_apply_all_colors()
	bodySprite.texture = $CompositeSprites.body_spritesheet[0]
	armsSprite.texture = $CompositeSprites.arms_spritesheet[0]
	hairSprite.texture = $CompositeSprites.hair_spritesheet[curr_hair]
	eyesSprite.texture = $CompositeSprites.eyes_spritesheet[curr_eyes]
	shirtSprite.texture = $CompositeSprites.shirt_spritesheet[curr_shirt]
	pantsSprite.texture = $CompositeSprites.pants_spritesheet[curr_pants]
	shoesSprite.texture = $CompositeSprites.shoes_spritesheet[curr_shoes]
	accSprite.texture = $CompositeSprites.accessories_spritesheet[curr_acc]



func _on_change_hair_style_right_pressed() -> void:
	curr_hair = (curr_hair + 1) % $CompositeSprites.hair_spritesheet.size()
	print ("Current hair index:", curr_hair)
	print("Texture at index:", $CompositeSprites.hair_spritesheet[curr_hair])
	hairSprite.texture = $CompositeSprites.hair_spritesheet[curr_hair]


func _on_change_hair_style_left_pressed() -> void:
	curr_hair = (curr_hair - 1) % $CompositeSprites.hair_spritesheet.size()
	if curr_hair < 0:
		curr_hair += $CompositeSprites.hair_spritesheet.size()
	print ("Current hair index:", curr_hair)
	print("Texture at index:", $CompositeSprites.hair_spritesheet[curr_hair])
	hairSprite.texture = $CompositeSprites.hair_spritesheet[curr_hair]























# Colors dictionary for each item
var item_colors = {
	"hair": {
	
		#Whites
	"silver": Color(0.8, 0.8, 0.9),
	"platinum_blonde": Color(0.9, 0.9, 0.9),
	"white": Color(1, 1, 1),
	#Blacks
	"black": Color(0, 0, 0),
	"charcoal_gray": Color(0.1, 0.1, 0.1),
	"slate_gray": Color(0.2, 0.2, 0.3),
	"ash_gray": Color(0.5, 0.5, 0.55),
	"gray": Color(0.7, 0.7, 0.7),
		


	#Browns
	"dark_chocolate": Color(0.15, 0.1, 0.05),
	"dark_brown": Color(0.3, 0.15, 0.05),
	"chestnut": Color(0.5, 0.25, 0.15),
	"auburn": Color(0.5, 0.2, 0.1),
	"light_brown": Color(0.6, 0.4, 0.2),
	
	#Red
	"burgundy": Color(0.2, 0, 0.05),
	"crimson_red": Color(0.9, 0.1, 0.2),
	
	#Orange
	"copper_red": Color(0.7, 0.2, 0.1),
	"sunset_orange": Color(1, 0.5, 0),
		
	#Yellow
	"strawberry_blonde": Color(1, 0.75, 0.6),
	"golden_yellow": Color(1, 0.9, 0.2),
	"golden_blonde": Color(1, 0.85, 0.5),
	"ash_blonde": Color(0.8, 0.8, 0.65),
	
	#Green
	"olive_drab": Color(0.1, 0.15, 0.05),
	"forest_green": Color(0.05, 0.2, 0.05),
	"lime_green": Color(0.6, 1, 0.2),
	"mint_green": Color(0.5, 1, 0.8),
	
	#Blue
	"ink_blue": Color(0.05, 0.05, 0.2),
	"midnight_blue": Color(0.05, 0.1, 0.2),
	"blue": Color(0.2, 0.4, 1),
	"teal": Color(0.2, 0.8, 0.8),
	"icy_blue": Color(0.6, 0.9, 1),
	
	#Purple
	"deep_plum": Color(0.2, 0.05, 0.2),
	"galaxy_purple": Color(0.3, 0.1, 0.5),
	"deep_purple": Color(0.4, 0, 0.6),
	"purple": Color(0.6, 0.3, 0.8),
	"lavender": Color(0.8, 0.6, 1),
	
	#Pink
	"neon_pink": Color(1, 0.2, 0.6),
	"rose_gold": Color(1, 0.7, 0.6),
	"coral": Color(1, 0.5, 0.5),
	"pink": Color(1, 0.6, 0.8),
	},

	"pants": {	
		
			#Whites
	"silver": Color(0.8, 0.8, 0.9),
	"platinum_blonde": Color(0.9, 0.9, 0.9),
	"white": Color(1, 1, 1),
		#Blacks
	"black": Color(0, 0, 0),
	"charcoal_gray": Color(0.1, 0.1, 0.1),
	"slate_gray": Color(0.2, 0.2, 0.3),
	"ash_gray": Color(0.5, 0.5, 0.55),
	"gray": Color(0.7, 0.7, 0.7),
		


	#Browns
	"dark_chocolate": Color(0.15, 0.1, 0.05),
	"dark_brown": Color(0.3, 0.15, 0.05),
	"chestnut": Color(0.5, 0.25, 0.15),
	"auburn": Color(0.5, 0.2, 0.1),
	"light_brown": Color(0.6, 0.4, 0.2),
	
	#Red
	"burgundy": Color(0.2, 0, 0.05),
	"crimson_red": Color(0.9, 0.1, 0.2),
	
	#Orange
	"copper_red": Color(0.7, 0.2, 0.1),
	"sunset_orange": Color(1, 0.5, 0),
		
	#Yellow
	"strawberry_blonde": Color(1, 0.75, 0.6),
	"golden_yellow": Color(1, 0.9, 0.2),
	"golden_blonde": Color(1, 0.85, 0.5),
	"ash_blonde": Color(0.8, 0.8, 0.65),
	
	#Green
	"olive_drab": Color(0.1, 0.15, 0.05),
	"forest_green": Color(0.05, 0.2, 0.05),
	"lime_green": Color(0.6, 1, 0.2),
	"mint_green": Color(0.5, 1, 0.8),
	
	#Blue
	"ink_blue": Color(0.05, 0.05, 0.2),
	"midnight_blue": Color(0.05, 0.1, 0.2),
	"blue": Color(0.2, 0.4, 1),
	"teal": Color(0.2, 0.8, 0.8),
	"icy_blue": Color(0.6, 0.9, 1),
	
	#Purple
	"deep_plum": Color(0.2, 0.05, 0.2),
	"galaxy_purple": Color(0.3, 0.1, 0.5),
	"deep_purple": Color(0.4, 0, 0.6),
	"purple": Color(0.6, 0.3, 0.8),
	"lavender": Color(0.8, 0.6, 1),
	
	#Pink
	"neon_pink": Color(1, 0.2, 0.6),
	"rose_gold": Color(1, 0.7, 0.6),
	"coral": Color(1, 0.5, 0.5),
	"pink": Color(1, 0.6, 0.8),},
	
	"shirt": {	
			#Whites
	"silver": Color(0.8, 0.8, 0.9),
	"platinum_blonde": Color(0.9, 0.9, 0.9),
	"white": Color(1, 1, 1),
		
		#Blacks
	"black": Color(0, 0, 0),
	"charcoal_gray": Color(0.1, 0.1, 0.1),
	"slate_gray": Color(0.2, 0.2, 0.3),
	"ash_gray": Color(0.5, 0.5, 0.55),
	"gray": Color(0.7, 0.7, 0.7),
		


	#Browns
	"dark_chocolate": Color(0.15, 0.1, 0.05),
	"dark_brown": Color(0.3, 0.15, 0.05),
	"chestnut": Color(0.5, 0.25, 0.15),
	"auburn": Color(0.5, 0.2, 0.1),
	"light_brown": Color(0.6, 0.4, 0.2),
	
	#Red
	"burgundy": Color(0.2, 0, 0.05),
	"crimson_red": Color(0.9, 0.1, 0.2),
	
	#Orange
	"copper_red": Color(0.7, 0.2, 0.1),
	"sunset_orange": Color(1, 0.5, 0),
		
	#Yellow
	"strawberry_blonde": Color(1, 0.75, 0.6),
	"golden_yellow": Color(1, 0.9, 0.2),
	"golden_blonde": Color(1, 0.85, 0.5),
	"ash_blonde": Color(0.8, 0.8, 0.65),
	
	#Green
	"olive_drab": Color(0.1, 0.15, 0.05),
	"forest_green": Color(0.05, 0.2, 0.05),
	"lime_green": Color(0.6, 1, 0.2),
	"mint_green": Color(0.5, 1, 0.8),
	
	#Blue
	"ink_blue": Color(0.05, 0.05, 0.2),
	"midnight_blue": Color(0.05, 0.1, 0.2),
	"blue": Color(0.2, 0.4, 1),
	"teal": Color(0.2, 0.8, 0.8),
	"icy_blue": Color(0.6, 0.9, 1),
	
	#Purple
	"deep_plum": Color(0.2, 0.05, 0.2),
	"galaxy_purple": Color(0.3, 0.1, 0.5),
	"deep_purple": Color(0.4, 0, 0.6),
	"purple": Color(0.6, 0.3, 0.8),
	"lavender": Color(0.8, 0.6, 1),
	
	#Pink
	"neon_pink": Color(1, 0.2, 0.6),
	"rose_gold": Color(1, 0.7, 0.6),
	"coral": Color(1, 0.5, 0.5),
	"pink": Color(1, 0.6, 0.8),},
	"shoes": { 	
	#Whites
	"silver": Color(0.8, 0.8, 0.9),
	"platinum_blonde": Color(0.9, 0.9, 0.9),
	"white": Color(1, 1, 1),
		#Blacks
	"black": Color(0, 0, 0),
	"charcoal_gray": Color(0.1, 0.1, 0.1),
	"slate_gray": Color(0.2, 0.2, 0.3),
	"ash_gray": Color(0.5, 0.5, 0.55),
	"gray": Color(0.7, 0.7, 0.7),
		


	#Browns
	"dark_chocolate": Color(0.15, 0.1, 0.05),
	"dark_brown": Color(0.3, 0.15, 0.05),
	"chestnut": Color(0.5, 0.25, 0.15),
	"auburn": Color(0.5, 0.2, 0.1),
	"light_brown": Color(0.6, 0.4, 0.2),
	
	#Red
	"burgundy": Color(0.2, 0, 0.05),
	"crimson_red": Color(0.9, 0.1, 0.2),
	
	#Orange
	"copper_red": Color(0.7, 0.2, 0.1),
	"sunset_orange": Color(1, 0.5, 0),
		
	#Yellow
	"strawberry_blonde": Color(1, 0.75, 0.6),
	"golden_yellow": Color(1, 0.9, 0.2),
	"golden_blonde": Color(1, 0.85, 0.5),
	"ash_blonde": Color(0.8, 0.8, 0.65),
	
	#Green
	"olive_drab": Color(0.1, 0.15, 0.05),
	"forest_green": Color(0.05, 0.2, 0.05),
	"lime_green": Color(0.6, 1, 0.2),
	"mint_green": Color(0.5, 1, 0.8),
	
	#Blue
	"ink_blue": Color(0.05, 0.05, 0.2),
	"midnight_blue": Color(0.05, 0.1, 0.2),
	"blue": Color(0.2, 0.4, 1),
	"teal": Color(0.2, 0.8, 0.8),
	"icy_blue": Color(0.6, 0.9, 1),
	
	#Purple
	"deep_plum": Color(0.2, 0.05, 0.2),
	"galaxy_purple": Color(0.3, 0.1, 0.5),
	"deep_purple": Color(0.4, 0, 0.6),
	"purple": Color(0.6, 0.3, 0.8),
	"lavender": Color(0.8, 0.6, 1),
	
	#Pink
	"neon_pink": Color(1, 0.2, 0.6),
	"rose_gold": Color(1, 0.7, 0.6),
	"coral": Color(1, 0.5, 0.5),
	"pink": Color(1, 0.6, 0.8),},
	"accessories": {	
	#Whites
	"silver": Color(0.8, 0.8, 0.9),
	"platinum_blonde": Color(0.9, 0.9, 0.9),
	"white": Color(1, 1, 1),
	#Blacks
	"black": Color(0, 0, 0),
	"charcoal_gray": Color(0.1, 0.1, 0.1),
	"slate_gray": Color(0.2, 0.2, 0.3),
	"ash_gray": Color(0.5, 0.5, 0.55),
	"gray": Color(0.7, 0.7, 0.7),
		

	#Browns
	"dark_chocolate": Color(0.15, 0.1, 0.05),
	"dark_brown": Color(0.3, 0.15, 0.05),
	"chestnut": Color(0.5, 0.25, 0.15),
	"auburn": Color(0.5, 0.2, 0.1),
	"light_brown": Color(0.6, 0.4, 0.2),
	
	#Red
	"burgundy": Color(0.2, 0, 0.05),
	"crimson_red": Color(0.9, 0.1, 0.2),
	
	#Orange
	"copper_red": Color(0.7, 0.2, 0.1),
	"sunset_orange": Color(1, 0.5, 0),
		
	#Yellow
	"strawberry_blonde": Color(1, 0.75, 0.6),
	"golden_yellow": Color(1, 0.9, 0.2),
	"golden_blonde": Color(1, 0.85, 0.5),
	"ash_blonde": Color(0.8, 0.8, 0.65),
	
	#Green
	"olive_drab": Color(0.1, 0.15, 0.05),
	"forest_green": Color(0.05, 0.2, 0.05),
	"lime_green": Color(0.6, 1, 0.2),
	"mint_green": Color(0.5, 1, 0.8),
	
	#Blue
	"ink_blue": Color(0.05, 0.05, 0.2),
	"midnight_blue": Color(0.05, 0.1, 0.2),
	"blue": Color(0.2, 0.4, 1),
	"teal": Color(0.2, 0.8, 0.8),
	"icy_blue": Color(0.6, 0.9, 1),
	
	#Purple
	"deep_plum": Color(0.2, 0.05, 0.2),
	"galaxy_purple": Color(0.3, 0.1, 0.5),
	"deep_purple": Color(0.4, 0, 0.6),
	"purple": Color(0.6, 0.3, 0.8),
	"lavender": Color(0.8, 0.6, 1),
	
	#Pink
	"neon_pink": Color(1, 0.2, 0.6),
	"rose_gold": Color(1, 0.7, 0.6),
	"coral": Color(1, 0.5, 0.5),
	"pink": Color(1, 0.6, 0.8),},
	"body": {
	#Whites
	"silver": Color(0.8, 0.8, 0.9),
	"platinum_blonde": Color(0.9, 0.9, 0.9),
	"white": Color(1, 1, 1),
	#Blacks
	"dark_chocolate": Color(0.15, 0.1, 0.05),
	"dark_brown": Color(0.3, 0.15, 0.05),
	"chestnut": Color(0.5, 0.25, 0.15),
	"auburn": Color(0.5, 0.2, 0.1),
	"golden_sand": Color(0.98, 0.85, 0.67),
	"light_brown": Color(0.6, 0.4, 0.2),},
	"arms": {	
	#Whites
	"silver": Color(0.8, 0.8, 0.9),
	"platinum_blonde": Color(0.9, 0.9, 0.9),
	"white": Color(1, 1, 1),
	#Blacks
	"dark_chocolate": Color(0.15, 0.1, 0.05),
	"dark_brown": Color(0.3, 0.15, 0.05),
	"chestnut": Color(0.5, 0.25, 0.15),
	"auburn": Color(0.5, 0.2, 0.1),
	"golden_sand": Color(0.98, 0.85, 0.67),
	"light_brown": Color(0.6, 0.4, 0.2),
	}
}

var color_indices = {
	"hair": 0,
	"body": 0,
	"arms": 0,
	"pants": 0,
	"shirt": 0,
	"shoes": 0,
	"accessories": 0
}



# Function to apply a specific color to a sprite
func _apply_color(item: String, sprite: Sprite2D, label: Label):
	var color_keys = item_colors[item].keys()
	var selected_color_key = color_keys[color_indices[item]]
	sprite.modulate = item_colors[item][selected_color_key]
	label.text = item.capitalize() + " Color: " + selected_color_key.capitalize()

# Function to apply colors for all items
func _apply_all_colors():
	_apply_color("hair", hairSprite, hairColorLabel)
	_apply_color("body", bodySprite, bodyColorLabel)
	_apply_color("arms", armsSprite, armsColorLabel)
	_apply_color("pants", pantsSprite, pantsColorLabel)
	_apply_color("shirt", shirtSprite, shirtColorLabel)
	_apply_color("shoes", shoesSprite, shoesColorLabel)
	_apply_color("accessories", accSprite, accColorLabel)

# Button handlers for changing colors
func _on_change_hair_color_pressed():
	_change_color("hair", hairSprite, hairColorLabel)

func _on_change_pants_color_pressed():
	_change_color("pants", pantsSprite, pantsColorLabel)

func _on_change_shirt_color_pressed():
	_change_color("shirt", shirtSprite, shirtColorLabel)

func _on_change_shoes_color_pressed():
	_change_color("shoes", shoesSprite, shoesColorLabel)

func _on_change_accessories_color_pressed():
	_change_color("accessories", accSprite, accColorLabel)

# Generalized function to cycle through colors
func _change_color(item: String, sprite: Sprite2D, label: Label):
	var color_keys = item_colors[item].keys()
	color_indices[item] = (color_indices[item] + 1) % color_keys.size()
	_apply_color(item, sprite, label)

# Randomize colors for all items
func _on_randomize_button_pressed():
	curr_body = rng.randi_range(0, $CompositeSprites.body_spritesheet.size() - 1)
	bodySprite.texture = $CompositeSprites.body_spritesheet[curr_body]
		
	curr_arms = rng.randi_range(0, $CompositeSprites.arms_spritesheet.size() - 1)
	armsSprite.texture = $CompositeSprites.arms_spritesheet[curr_arms]

	curr_hair = rng.randi_range(0, $CompositeSprites.hair_spritesheet.size() - 1)
	hairSprite.texture = $CompositeSprites.hair_spritesheet[curr_hair]

	curr_eyes = rng.randi_range(0, $CompositeSprites.eyes_spritesheet.size() - 1)
	eyesSprite.texture = $CompositeSprites.eyes_spritesheet[curr_eyes]

	curr_pants = rng.randi_range(0, $CompositeSprites.pants_spritesheet.size() - 1)
	pantsSprite.texture = $CompositeSprites.pants_spritesheet[curr_pants]

	curr_shirt = rng.randi_range(0, $CompositeSprites.shirt_spritesheet.size() - 1)
	shirtSprite.texture = $CompositeSprites.shirt_spritesheet[curr_shirt]

	curr_shoes = rng.randi_range(0, $CompositeSprites.shoes_spritesheet.size() - 1)
	shoesSprite.texture = $CompositeSprites.shoes_spritesheet[curr_shoes]

	curr_acc = rng.randi_range(0, $CompositeSprites.accessories_spritesheet.size() - 1)
	accSprite.texture = $CompositeSprites.accessories_spritesheet[curr_acc]

	var body_color_keys = item_colors["body"].keys()
	var random_body_color_index = rng.randi_range(0, body_color_keys.size() - 1)
	color_indices["body"] = random_body_color_index
	color_indices["arms"] = random_body_color_index  # Ensure arms use the same color
	


	for item in item_colors.keys():
		if item != "body" and item != "arms":  # Body and arms already randomized
			var color_keys = item_colors[item].keys()
			color_indices[item] = rng.randi_range(0, color_keys.size() - 1)

	_apply_all_colors()
