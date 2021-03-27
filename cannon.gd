extends Node2D

# I pick Variant 4 (using atan2 and rotation limit)
# because 1. understand what happens inside 
#         2. can easily tweak the logic
#         3. minimum calculations involved
func _process(delta):
	var d = get_global_mouse_position() - self.position
	if d.y <= 0: d.y = 0
	var angle = -atan2(d.x, d.y)
	self.rotation = angle

# Variant 1 (find the hypotenuse using Pythagorean theorem)
#func _process(delta):
#	if get_global_mouse_position().y >= self.position.y:
#		var x = get_global_mouse_position().x - position.x
#		var y = get_global_mouse_position().y - position.y
#		var c = sqrt(x*x + y*y)
#
#		print(" x: ", x, " y: ", y, " c: ", c)
#
#		if c != 0:
#			var angle = -rad2deg(asin(x/c))
#			print("angle: ", angle)
#			self.rotation_degrees = angle


# Variant 2 (use vector and radians)
#func _process(delta):
#	if get_global_mouse_position().y >= self.position.y:
#		var d = get_global_mouse_position() - self.position
#		var c = sqrt(d.x*d.x + d.y*d.y)
#
#		print(" x: ", d.x, " y: ", d.y, " c:", c)
#
#		if c != 0:
#			var angle = -asin(d.x/c)
#			print("angle: ", rad2deg(angle))
#			self.rotation = angle


# Variant 3 (using atan2)
#func _process(delta):
#	var d = get_global_mouse_position() - self.position
#	if d.y != 0:
#		var angle = -atan(d.x/d.y)  # -90 <= angle <= 90 	
#		#var angle = -atan2(d.x, d.y) # -180 <= angle <= 180 
#
#		print(rad2deg(angle))
#		self.rotation = angle

# Variant 4 (using atan2 and rotation limit)
#func _process(delta):
#	var d = get_global_mouse_position() - self.position
#	if d.y <= 0: d.y = 0
#
#	var angle = -atan2(d.x, d.y)
#
#	print(rad2deg(angle))
#	self.rotation = angle


# Gotcha 1 (angle method)
#func _process(delta):
#	var d = get_global_mouse_position() - self.position
#	var angle = d.angle() - PI/2
#
#	print(rad2deg(angle))
#	self.rotation = angle

# Gotcha 2 (angle_to_point method)
#func _process(delta):
#	var angle = get_global_mouse_position().angle_to_point(self.position) - PI/2
#	self.rotation = angle
#	print(rad2deg(angle))

# Gotcha 3 (angle_to method)
# get_global_mouse_position().angle_to_point(self.position)
# is equal to 
# Vector2.RIGHT.angle_to(get_global_mouse_position() - self.position)
#func _process(delta):
#	var d = get_global_mouse_position() - self.position
#	var angle = Vector2.RIGHT.angle_to(d) - PI/2
#	self.rotation = angle
#	print(rad2deg(angle))
	
# Gotcha 3 (angle_to method with Vector2.DOWN )
# no need -PI/2 with Vector2.DOWN 
#func _process(delta):
#	var d = get_global_mouse_position() - self.position
#	var angle = Vector2.DOWN.angle_to(d)
#	self.rotation = angle
#	print(rad2deg(angle))

# Gotcha 4 (look_at method)
# need to to rotate sprite to -90 before start
#func _ready():
#	$Sprite.rotation = -PI/2
#
#func _process(delta):
#	look_at(get_global_mouse_position())

# Variant in event callback
#func _unhandled_input(event):
#	if event is InputEventMouse:
#		var angle = event.global_position.angle_to_point(self.position) - PI/2
#		self.rotation = angle
#		print(rad2deg(angle))

# How to set rotation note
#self.rotation = angle
#rotation = angle
#set_rotation(angle) 
#self.rotation_degrees = rad2deg(angle) #not really efficient since additional calculations involved
