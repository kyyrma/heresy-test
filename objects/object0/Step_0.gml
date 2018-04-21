/// @description Movement controls
// You can write your code in this editor

// Basic four way movement checks

pushingLeft = keyboard_check(key_left);
pushingRight = keyboard_check(key_right);

pushingUp = keyboard_check(key_up);
pushingDown = keyboard_check(key_down);

// Get intended facing based on keyboard presses

horizontalDir = pushingRight - pushingLeft;
verticalDir = pushingDown - pushingUp;

show_debug_message("pushingLeft: "+string(pushingLeft))
show_debug_message("pushingRight: "+string(pushingRight))
show_debug_message("pushingUp: "+string(pushingUp))
show_debug_message("pushingDown: "+string(pushingDown))

// Save last facing direction for drawing sprite

if horizontalDir != 0
{
	lastHorizontalDir = horizontalDir;
}

if verticalDir != 0
{
	lastVerticalDir = horizontalDir;
}

// Calculate current horizontal and vertical speed

if abs(horizontalSpeed) < baseSpeedMax
{
	
	horizontalSpeed += horizontalDir * baseAcceleration;
	
}

if abs(verticalSpeed) < baseSpeedMax
{
	
	verticalSpeed += verticalDir * baseAcceleration;
	
}

// Decelerate horizontal

if sign(horizontalSpeed) = sign(horizontalSpeed - sign(horizontalSpeed) * baseFriction)
{
	horizontalSpeed -= sign(horizontalSpeed) * baseFriction;
	
	if sign(horizontalSpeed) = sign(horizontalSpeed - sign(horizontalSpeed) * baseFriction) && horizontalDir = 0
	{	
		horizontalSpeed -= sign(horizontalSpeed) * baseFriction;
	}
	
}

else
{
	horizontalSpeed = 0;
}

// Decelerate vertical

if sign(verticalSpeed) = sign(verticalSpeed - sign(verticalSpeed) * baseFriction)
{
	verticalSpeed -= sign(verticalSpeed) * baseFriction;
	
	if sign(verticalSpeed) = sign(verticalSpeed - sign(verticalSpeed) * baseFriction) && verticalDir = 0
	{	
		verticalSpeed -= sign(verticalSpeed) * baseFriction;
	}
	
}

else
{
	verticalSpeed = 0;
}

// Check for collisions on horizontal plane and ease into walls

if place_meeting(x + horizontalSpeed, y, oWall)
{
	while !place_meeting(x + sign(horizontalSpeed), y, oWall)
	{
		x += sign(horizontalSpeed);
	}
	
	horizontalSpeed = 0;
}

// Move horizontally if no collision

x += horizontalSpeed;

// Check for collisions on vertical plane and ease into floor

if place_meeting(x, y + verticalSpeed, oWall)
{
	
	while !place_meeting(x, y + sign(verticalSpeed), oWall)
	{
		y += sign(verticalSpeed);
	}
	
	verticalSpeed = 0;
	
}

// Move vertically if no collision

y += verticalSpeed;

// Set camera

camera_set_view_pos(view_camera[0], x - (camera_get_view_width(view_camera[0])/2), y - (camera_get_view_height(view_camera[0])/2));