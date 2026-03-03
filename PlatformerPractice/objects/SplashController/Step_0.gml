/// @description Fade in/Fade out
// You can write your code in this editor

timer += 1;

// Wait 30 frames before doing anything
if (timer < 30) 
{
    image_alpha = 0;
}

// Fade in for 30 frames
else if (timer < 60) 
{
    image_alpha = (timer - 30) / 30;
}

// Hold for 60 frames
else if (timer < 120) 
{
    image_alpha = 1;
}

// Fade out for 30 frames
else if (timer < 150) 
{
    image_alpha = 1 - ((timer - 120) / 30);
}

// After fade-out, go to the Main Menu
else 
{
    room_goto(MainMenu);
}
