extends Control

@onready var grid_container = $Panel/GridContainer
@onready var close_button = $Panel/CloseButton  # Adjust path if needed

# Define the color palette
var colors = [
	Color("#FF0000"), Color("#00FF00"), Color("#0000FF"),  # Red, Green, Blue
	Color("#FFFF00"), Color("#FF00FF"), Color("#00FFFF"),  # Yellow, Magenta, Cyan
	Color("#FFFFFF"), Color("#000000"), Color("#808080")   # White, Black, Gray
]

signal color_selected(color)  # Signal for sending the selected color

func _ready():
	close_button.connect("pressed", Callable(self, "_on_close_pressed"))
	create_color_buttons()

func create_color_buttons():
	grid_container.columns = 6  # Adjust for desired layout
	for color in colors:
		var button = Button.new()
		button.custom_minimum_size = Vector2(32, 32)  # Button size
		button.flat = true  # Remove button outline

		# Set button background color
		var stylebox = StyleBoxFlat.new()
		stylebox.bg_color = color
		button.add_theme_stylebox_override("normal", stylebox)

		# Connect button press to color selection function
		button.connect("pressed", Callable(self, "_on_color_selected").bind(color))

		grid_container.add_child(button)

func _on_color_selected(color):
	print("Selected color:", color)  # Debugging
	emit_signal("color_selected", color)  # Send color to main scene

func _on_close_pressed():
	hide()  # Hide when the close button is pressed
