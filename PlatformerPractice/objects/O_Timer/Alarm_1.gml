/// @description Reactivate TimerGate & Reset Room
// You can write your code in this editor

instance_activate_object(O_TimerGate);
audio_stop_sound(_759501__gammagool__tick_tock_dry)
sprite_index = S_Timer_Off
timer_going = false
fading_out = true;