var tile_width = 32;
var tile_height = 32;
var level_width = 1920;
var level_height = 256;
var obstacle_width = 8 * tile_width;

// Generate left wall
for (y = 0; y <= level_height; y += tile_height) {
    instance_create(0, y, objectTileWall);
}

// Generate ceiling
for (x = 0; x <= level_width; x += tile_width) {
    instance_create(x, 0, objectTileWall);
}
// Generate floor
for (x = 0; x <= level_width; x += tile_width) {
    instance_create(x, level_height, objectTileWall);
}

// Generate right wall
for (y = 0; y <= level_height; y += tile_height) {
    instance_create(level_width, y, objectTileWall);
}

// Generate goal
instance_create(level_width - tile_width, level_height - tile_height, objectGoal);

// Generate player
instance_create(tile_width, level_height - 2 * tile_height, objectPlayer);

// --------------------------------------------------------------------------------
// ------------------------ Generate some random obstacles ------------------------
// --------------------------------------------------------------------------------

for (x = 2 * tile_width; x < level_width - obstacle_width; x += obstacle_width) {
    // Generate an obstacle
    scriptAddObstacle(x);
}

if (global.ghostChase) {
    // Generate ghost
    instance_create(tile_width, tile_height, objectGhost);
}

