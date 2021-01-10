/// @description Insert description here

// Intrinsice variables
z = 0
flash = 0
us_flash = shader_get_uniform(sha_white_flash, "flash") //Sends flash value to flash shader in the draw event

entity_emit = audio_emitter_create()
audio_falloff_set_model(entity_audio_falloff_model);
audio_emitter_position(entity_emit, x,y,0);
audio_emitter_falloff(entity_emit, entity_audio_falloff_start, entity_audio_max_distance_to_be_heard,1)

depth = 100;