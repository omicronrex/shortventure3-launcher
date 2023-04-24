//detect close button generating a key down without press event
if (keyboard_check(vk_escape)) {if (!esc && !keyboard_check_pressed(vk_escape)) game_end() esc=1} else esc=0
