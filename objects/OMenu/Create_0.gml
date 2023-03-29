// GUI/Vars/Menu setup

//GUI variables
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 100;

//Menu variables
menu_x = gui_width - 710;
menu_y = gui_height - 180;
menu_x_target = gui_width - gui_margin;
menu_speed = 25; //lower is faster
menu_font = f_menu;
menu_itemheight = font_get_size(f_menu);
menu_committed = -1;
menu_control = true;

//Text
menu[2] = "New game";
menu[1] = "Load";
menu[0] = "Exit";

menu_items = array_length_1d(menu);
menu_cursor = 2;