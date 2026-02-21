// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function key_to_string(key) 
{
    // Handle special VK keys first
    switch (key) {
        case vk_space:      return "Space";
        case vk_shift:      return "Shift";
        case vk_control:    return "Ctrl";
        case vk_alt:        return "Alt";
        case vk_enter:      return "Enter";
        case vk_escape:     return "Esc";
        case vk_left:       return "Left Arrow";
        case vk_right:      return "Right Arrow";
        case vk_up:         return "Up Arrow";
        case vk_down:       return "Down Arrow";
    }

    // If it's a printable ASCII character
    if (key >= 32 && key <= 126) 
	{
		return chr(key);
    }

    // Fallback
    return "Unknown";
}
