i=instance_create(0,0,BookUi)
i.text=get_game_data(game,gd_readme)
i.game=game
i.readme=1
with (i) event_user(0)
window_set_cursor(cr_default)
sound_play("remove_item"+string(irandom_range(1,4)))
