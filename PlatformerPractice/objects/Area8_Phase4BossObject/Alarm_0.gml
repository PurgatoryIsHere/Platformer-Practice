/// @description Spawn Bullets
// You can write your code in this editor

for (var i = 0; i < bulletsPerWave; i++) {
    var bulletAngle = image_angle + (i * bulletAngleOffset) + random_range(0, 10); // Add a slight random variation
    
    // Create the bullet instance
    with (instance_create_layer(x, y, "Instances", Area8_Phase4BossProjectileObject)) {
        direction = bulletAngle; // Set the direction
    }
}

// Reset the alarm to repeat the wave
alarm[0] = bulletTimerLength;