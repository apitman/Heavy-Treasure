global.saveFileName = "Save.sav"

if (file_exists(global.saveFileName)) {
    ini_open(global.saveFileName);
    global.bankedTreasure = floor(ini_read_real("data", "bank", 0));
} else {
    global.bankedTreasure = 0;
}


room_goto_next();
