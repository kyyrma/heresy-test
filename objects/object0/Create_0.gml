/// @description Initialize variables
// Misc.

image_speed = 0;

// Setup sprites

spriteMoveRight = sprPlaceholderMoveRight;
spriteMoveDown = sprPlaceholderMoveDown;
spriteIdleRight = sprPlaceholderIdleRight;
spriteIdleDown = sprPlaceholderIdleDown;
spriteIdleUp = sprPlaceholderIdleUp;

// Setup controls for the player

key_up = vk_up;
key_down = vk_down;

key_left = vk_left;
key_right = vk_right;

key_a = ord("Z");
key_b = ord("X");

// Setup sprite related variables

// Setup animation and movement

horizontalDir = 1;
verticalDir = 1;
lastHorizontalDir = 1;
lastVerticalDir = 1;

horizontalSpeed = 0;
verticalSpeed = 0;
baseSpeedMax = 2;

baseAcceleration = 0.5;
baseFriction = 0.25;

//currentWeapon = oWeaponBase;

imageSpeed = 2;