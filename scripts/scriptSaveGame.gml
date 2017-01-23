if (file_exists(global.saveFileName)) {
    file_delete(global.saveFileName);
}

ini_open(global.saveFileName);
ini_write_real("data", "bank", global.bankedTreasure);
ini_close();

