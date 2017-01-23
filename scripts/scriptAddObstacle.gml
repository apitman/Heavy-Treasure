///scriptAddObstacle(xBegin)
var xBegin = argument0;
var tile_width = 32;
var tile_height = 32;
var level_width = 1920;
var level_height = 256;
var obstacle_width = 8 * tile_width;

// TODO: Tweak these values after creating more obstacle types
var topObstacle = 10; // Always include all obstacles - not random enough without everything
if (global.extraObstacles) {
    topObstacle = 10;
}
var type = irandom_range(0, topObstacle);

switch (type) {
    case 0:
        // Obstacle Type 0 - random death on ceiling
        var spawnChance = 0.25;
        if (global.hardObstacles) spawnChance = 0.5;
        for (x = xBegin; x < xBegin + obstacle_width; x += tile_width) {
            if (random(1) < spawnChance) {
                instance_create(x, tile_height, objectFallingDeath);
            }
        }
        break;
    case 1:
        // Obstacle Type 1 - Easy treasure, unless mods are applied
        instance_create(xBegin + 3 * tile_width, level_height - 1 * tile_height, objectTileDeath);
        instance_create(xBegin + 4 * tile_width, level_height - 1 * tile_height, objectTileDeath);
        instance_create(xBegin + 1 * tile_width, level_height - 1 * tile_height, objectTreasure);
        instance_create(xBegin + 2 * tile_width, level_height - 2 * tile_height, objectTreasure);
        instance_create(xBegin + 3 * tile_width, level_height - 3 * tile_height, objectTreasure);
        instance_create(xBegin + 4 * tile_width, level_height - 3 * tile_height, objectTreasure);
        instance_create(xBegin + 5 * tile_width, level_height - 2 * tile_height, objectTreasure);
        if (global.cursedTreasure) {
            instance_create(xBegin + 6 * tile_width, level_height - 1 * tile_height, objectTreasureCursed);
        } else {
            instance_create(xBegin + 6 * tile_width, level_height - 1 * tile_height, objectTreasure);
        }
        if (global.hardObstacles) {
            instance_create(xBegin + 2 * tile_width, 1 * tile_height, objectFallingDeath);
            instance_create(xBegin + 5 * tile_width, 1 * tile_height, objectFallingDeath);
        }
        break;

    case 2:
        // Obstacle Type 2 - small stair gap
        instance_create(xBegin + 1 * tile_width, level_height - 1 * tile_height, objectTileWall);
        instance_create(xBegin + 2 * tile_width, level_height - 1 * tile_height, objectTileWall);
        if (!global.hardObstacles) {
            instance_create(xBegin + 2 * tile_width, level_height - 2 * tile_height, objectTileWall);
        }
        instance_create(xBegin + 3 * tile_width, level_height - 1 * tile_height, objectTileDeath);
        instance_create(xBegin + 3 * tile_width, level_height - 4 * tile_height, objectTreasure);
        if (global.cursedTreasure) {
            instance_create(xBegin + 4 * tile_width, level_height - 4 * tile_height, objectTreasureCursed);
        } else {
            instance_create(xBegin + 4 * tile_width, level_height - 4 * tile_height, objectTreasure);
        }
        instance_create(xBegin + 4 * tile_width, level_height - 1 * tile_height, objectTileDeath);
        if (!global.hardObstacles) {
            instance_create(xBegin + 5 * tile_width, level_height - 2 * tile_height, objectTileWall);
        }
        instance_create(xBegin + 5 * tile_width, level_height - 1 * tile_height, objectTileWall);
        instance_create(xBegin + 6 * tile_width, level_height - 1 * tile_height, objectTileWall);
        if (global.hardObstacles) {
            instance_create(xBegin + 3, tile_height, objectFallingDeath);
            instance_create(xBegin + 4, tile_height, objectFallingDeath);
        }
        break;

    case 3:
        // Obstacle Type 3 - high road to avoid death
        instance_create(xBegin + 1 * tile_width, level_height - 1 * tile_height, objectTileWall);
        instance_create(xBegin + 2 * tile_width, level_height - 1 * tile_height, objectTileWall);
        instance_create(xBegin + 2 * tile_width, level_height - 3 * tile_height, objectTileWall);
        instance_create(xBegin + 3 * tile_width, level_height - 4 * tile_height, objectTileWall);
        instance_create(xBegin + 3 * tile_width, level_height - 1 * tile_height, objectTileDeath);
        if (global.disappearingTiles) {
            instance_create(xBegin + 4 * tile_width, level_height - 4 * tile_height, objectTileTemp);
        } else {
            instance_create(xBegin + 4 * tile_width, level_height - 4 * tile_height, objectTileWall);
        }
        if (global.cursedTreasure) {
            instance_create(xBegin + 4 * tile_width, level_height - 6 * tile_height, objectTreasureCursed);
        } else {
            instance_create(xBegin + 4 * tile_width, level_height - 6 * tile_height, objectTreasure);
        }
        instance_create(xBegin + 4 * tile_width, level_height - 1 * tile_height, objectTileDeath);
        if (global.disappearingTiles) {
            instance_create(xBegin + 5 * tile_width, level_height - 4 * tile_height, objectTileTemp);
        } else {
            instance_create(xBegin + 5 * tile_width, level_height - 4 * tile_height, objectTileWall);
        }
        instance_create(xBegin + 5 * tile_width, level_height - 6 * tile_height, objectTreasure);
        instance_create(xBegin + 5 * tile_width, level_height - 1 * tile_height, objectTileDeath);
        if (global.disappearingTiles) {
            instance_create(xBegin + 6 * tile_width, level_height - 4 * tile_height, objectTileTemp);
        } else {
            instance_create(xBegin + 6 * tile_width, level_height - 4 * tile_height, objectTileWall);
        }
        instance_create(xBegin + 6 * tile_width, level_height - 6 * tile_height, objectTreasure);
        instance_create(xBegin + 6 * tile_width, level_height - 1 * tile_height, objectTileWall);
        if (global.hardObstacles) {
            instance_create(xBegin + 4, tile_height, objectFallingDeath);
            instance_create(xBegin + 5, tile_height, objectFallingDeath);
        }
        break;

    case 4:
        // Obstacle Type 4 - Dangerous High Road but safe low road
        if (global.disappearingTiles) {
            instance_create(xBegin + 1 * tile_width, level_height - 3 * tile_height, objectTileTemp);
            instance_create(xBegin + 2 * tile_width, level_height - 3 * tile_height, objectTileTemp);
            instance_create(xBegin + 3 * tile_width, level_height - 3 * tile_height, objectTileTemp);
        } else {
            instance_create(xBegin + 1 * tile_width, level_height - 3 * tile_height, objectTileWall);
            instance_create(xBegin + 2 * tile_width, level_height - 3 * tile_height, objectTileWall);
            instance_create(xBegin + 3 * tile_width, level_height - 3 * tile_height, objectTileWall);
        }
        instance_create(xBegin + 4 * tile_width, level_height - 3 * tile_height, objectTileWall);
        instance_create(xBegin + 5 * tile_width, level_height - 3 * tile_height, objectTileWall);
        instance_create(xBegin + 6 * tile_width, level_height - 3 * tile_height, objectTileWall);
        instance_create(xBegin + 1 * tile_width, level_height - 4 * tile_height, objectTreasure);
        instance_create(xBegin + 2 * tile_width, level_height - 4 * tile_height, objectTreasure);
        instance_create(xBegin + 3 * tile_width, level_height - 4 * tile_height, objectTreasure);
        instance_create(xBegin + 4 * tile_width, level_height - 4 * tile_height, objectTreasure);
        instance_create(xBegin + 5 * tile_width, level_height - 4 * tile_height, objectTreasure);
        if (global.cursedTreasure) {
            instance_create(xBegin + 6 * tile_width, level_height - 4 * tile_height, objectTreasureCursed);
        } else {
            instance_create(xBegin + 6 * tile_width, level_height - 4 * tile_height, objectTreasure);
        }
        if (global.hardObstacles) {
            instance_create(xBegin + 1 * tile_width, 1 * tile_height, objectFallingDeath);
        }
        instance_create(xBegin + 2 * tile_width, 1 * tile_height, objectFallingDeath);
        instance_create(xBegin + 3 * tile_width, 1 * tile_height, objectFallingDeath);
        instance_create(xBegin + 4 * tile_width, 1 * tile_height, objectFallingDeath);
        instance_create(xBegin + 5 * tile_width, 1 * tile_height, objectFallingDeath);
        if (global.hardObstacles) {
            instance_create(xBegin + 6 * tile_width, 1 * tile_height, objectFallingDeath);
        }
        break;

    case 5:
        // Obstacle Type 5 - Overhang with lots of treasure
        instance_create(xBegin + 1 * tile_width, level_height - 1 * tile_height, objectTileWall);
        instance_create(xBegin + 2 * tile_width, level_height - 1 * tile_height, objectTileWall);
        instance_create(xBegin + 2 * tile_width, level_height - 2 * tile_height, objectTileWall);
        instance_create(xBegin + 3 * tile_width, level_height - 2 * tile_height, objectTileWall);
        instance_create(xBegin + 3 * tile_width, level_height - 3 * tile_height, objectTileWall);
        instance_create(xBegin + 4 * tile_width, level_height - 3 * tile_height, objectTileWall);
        instance_create(xBegin + 4 * tile_width, level_height - 4 * tile_height, objectTileWall);
        if (global.disappearingTiles) {
            instance_create(xBegin + 5 * tile_width, level_height - 4 * tile_height, objectTileTemp);
            instance_create(xBegin + 6 * tile_width, level_height - 4 * tile_height, objectTileTemp);
            instance_create(xBegin + 7 * tile_width, level_height - 4 * tile_height, objectTileTemp);
        } else {
            instance_create(xBegin + 5 * tile_width, level_height - 4 * tile_height, objectTileWall);
            instance_create(xBegin + 6 * tile_width, level_height - 4 * tile_height, objectTileWall);
            instance_create(xBegin + 7 * tile_width, level_height - 4 * tile_height, objectTileWall);
        }
        instance_create(xBegin + 3 * tile_width, level_height - 1 * tile_height, objectTreasure);
        if (global.cursedTreasure) {
            instance_create(xBegin + 4 * tile_width, level_height - 1 * tile_height, objectTreasureCursed);
        } else {
            instance_create(xBegin + 4 * tile_width, level_height - 1 * tile_height, objectTreasure);
        }
        instance_create(xBegin + 5 * tile_width, level_height - 1 * tile_height, objectTreasure);
        instance_create(xBegin + 6 * tile_width, level_height - 1 * tile_height, objectTreasure);
        if (global.hardObstacles) {
            instance_create(xBegin + 5 * tile_width, level_height - 3 * tile_height, objectFallingDeath);
            instance_create(xBegin + 6 * tile_width, level_height - 3 * tile_height, objectFallingDeath);
            instance_create(xBegin + 7 * tile_width, level_height - 3 * tile_height, objectFallingDeath);
        }
        break;

    case 6:
        // Obstacle Type 6 - Staircase with tricky jump
        if (global.disappearingTiles) {
            instance_create(xBegin + 1 * tile_width, level_height - 1 * tile_height, objectTileTemp);
            instance_create(xBegin + 2 * tile_width, level_height - 2 * tile_height, objectTileTemp);
        } else {
            instance_create(xBegin + 1 * tile_width, level_height - 1 * tile_height, objectTileWall);
            instance_create(xBegin + 2 * tile_width, level_height - 2 * tile_height, objectTileWall);
        }
        instance_create(xBegin + 3 * tile_width, level_height - 3 * tile_height, objectTileWall);
        instance_create(xBegin + 4 * tile_width, level_height - 4 * tile_height, objectTileWall);
        instance_create(xBegin + 5 * tile_width, level_height - 2 * tile_height, objectTileWall);
        instance_create(xBegin + 6 * tile_width, level_height - 2 * tile_height, objectTileWall);
        instance_create(xBegin + 5 * tile_width, level_height - 3 * tile_height, objectTileDeath);
        instance_create(xBegin + 6 * tile_width, level_height - 3 * tile_height, objectTileDeath);
        instance_create(xBegin + 5 * tile_width, level_height - 5 * tile_height, objectTreasure);
        instance_create(xBegin + 6 * tile_width, level_height - 5 * tile_height, objectTreasure);
        if (global.hardObstacles) {
            instance_create(xBegin + 5 * tile_width, 1 * tile_height, objectFallingDeath);
            instance_create(xBegin + 6 * tile_width, 1 * tile_height, objectFallingDeath);
        }
        break;

    case 7:
        // Obstacle Type 7 - Staircase double gap
        instance_create(xBegin + 1 * tile_width, level_height - 1 * tile_height, objectTileWall);
        instance_create(xBegin + 2 * tile_width, level_height - 1 * tile_height, objectTileWall);
        instance_create(xBegin + 2 * tile_width, level_height - 2 * tile_height, objectTileWall);
        instance_create(xBegin + 4 * tile_width, level_height - 1 * tile_height, objectTileWall);
        instance_create(xBegin + 4 * tile_width, level_height - 2 * tile_height, objectTileWall);
        instance_create(xBegin + 4 * tile_width, level_height - 3 * tile_height, objectTileWall);
        instance_create(xBegin + 4 * tile_width, level_height - 4 * tile_height, objectTreasure);
        instance_create(xBegin + 6 * tile_width, level_height - 1 * tile_height, objectTileWall);
        instance_create(xBegin + 6 * tile_width, level_height - 2 * tile_height, objectTileWall);
        instance_create(xBegin + 7 * tile_width, level_height - 1 * tile_height, objectTileWall);
        instance_create(xBegin + 3 * tile_width, level_height - 1 * tile_height, objectTileDeath);
        instance_create(xBegin + 5 * tile_width, level_height - 1 * tile_height, objectTileDeath);
        if (global.hardObstacles) {
            instance_create(xBegin + 4 * tile_width, 1 * tile_height, objectFallingDeath);
        }
        break;
        
    case 8:
        // Obstacle Type 8 - Happy Face
        instance_create(xBegin + 1 * tile_width, level_height - 3 * tile_height, objectTileWall);
        instance_create(xBegin + 2 * tile_width, level_height - 2 * tile_height, objectTileWall);
        if (global.cursedTreasure) {
            instance_create(xBegin + 2 * tile_width, level_height - 5 * tile_height, objectTreasureCursed);
        } else {
            instance_create(xBegin + 2 * tile_width, level_height - 5 * tile_height, objectTreasure);
        }
        if (global.disappearingTiles) {
            instance_create(xBegin + 3 * tile_width, level_height - 2 * tile_height, objectTileTemp);
            instance_create(xBegin + 4 * tile_width, level_height - 2 * tile_height, objectTileTemp);
        } else {
            instance_create(xBegin + 3 * tile_width, level_height - 2 * tile_height, objectTileWall);
            instance_create(xBegin + 4 * tile_width, level_height - 2 * tile_height, objectTileWall);
        }
        instance_create(xBegin + 5 * tile_width, level_height - 2 * tile_height, objectTileWall);
        if (global.cursedTreasure) {
            instance_create(xBegin + 5 * tile_width, level_height - 5 * tile_height, objectTreasureCursed);
        } else {
            instance_create(xBegin + 5 * tile_width, level_height - 5 * tile_height, objectTreasure);
        }
        instance_create(xBegin + 6 * tile_width, level_height - 3 * tile_height, objectTileWall);
        if (global.hardObstacles) {
            instance_create(xBegin + 3 * tile_width, 1 * tile_height, objectFallingDeath);
            instance_create(xBegin + 4 * tile_width, 1 * tile_height, objectFallingDeath);
        }
        break;

    case 9:
        // Obstacle Type 9 - Danger Bridge
        instance_create(xBegin + 0 * tile_width, level_height - 1 * tile_height, objectTileWall);
        if (global.disappearingTiles) {
            instance_create(xBegin + 1 * tile_width, level_height - 2 * tile_height, objectTileTemp);
            instance_create(xBegin + 2 * tile_width, level_height - 2 * tile_height, objectTileTemp);
            instance_create(xBegin + 3 * tile_width, level_height - 2 * tile_height, objectTileTemp);
            instance_create(xBegin + 4 * tile_width, level_height - 2 * tile_height, objectTileTemp);
            instance_create(xBegin + 5 * tile_width, level_height - 2 * tile_height, objectTileTemp);
            instance_create(xBegin + 6 * tile_width, level_height - 2 * tile_height, objectTileTemp);
        } else {
            instance_create(xBegin + 1 * tile_width, level_height - 2 * tile_height, objectTileWall);
            instance_create(xBegin + 2 * tile_width, level_height - 2 * tile_height, objectTileWall);
            instance_create(xBegin + 3 * tile_width, level_height - 2 * tile_height, objectTileWall);
            instance_create(xBegin + 4 * tile_width, level_height - 2 * tile_height, objectTileWall);
            instance_create(xBegin + 5 * tile_width, level_height - 2 * tile_height, objectTileWall);
            instance_create(xBegin + 6 * tile_width, level_height - 2 * tile_height, objectTileWall);
        }
        instance_create(xBegin + 1 * tile_width, level_height - 1 * tile_height, objectTileDeath);
        instance_create(xBegin + 2 * tile_width, level_height - 1 * tile_height, objectTileDeath);
        instance_create(xBegin + 3 * tile_width, level_height - 1 * tile_height, objectTileDeath);
        instance_create(xBegin + 4 * tile_width, level_height - 1 * tile_height, objectTileDeath);
        instance_create(xBegin + 5 * tile_width, level_height - 1 * tile_height, objectTileDeath);
        instance_create(xBegin + 6 * tile_width, level_height - 1 * tile_height, objectTileDeath);
        instance_create(xBegin + 7 * tile_width, level_height - 1 * tile_height, objectTileWall);
        if (global.hardObstacles) {
            instance_create(xBegin + 2 * tile_width, 1 * tile_height, objectFallingDeath);
            instance_create(xBegin + 5 * tile_width, 1 * tile_height, objectFallingDeath);
            instance_create(xBegin + 6 * tile_width, 1 * tile_height, objectFallingDeath);
        }
        break;

    case 10:
        // Obstacle Type 10 - Loop around
        instance_create(xBegin + 0 * tile_width, level_height - 4 * tile_height, objectTileWall);
        instance_create(xBegin + 1 * tile_width, level_height - 4 * tile_height, objectTileWall);
        instance_create(xBegin + 2 * tile_width, level_height - 3 * tile_height, objectTileWall);
        instance_create(xBegin + 3 * tile_width, level_height - 3 * tile_height, objectTileWall);
        instance_create(xBegin + 4 * tile_width, level_height - 3 * tile_height, objectTileWall);
        instance_create(xBegin + 3 * tile_width, level_height - 6 * tile_height, objectTileWall);
        instance_create(xBegin + 4 * tile_width, level_height - 6 * tile_height, objectTileWall);
        instance_create(xBegin + 5 * tile_width, level_height - 6 * tile_height, objectTileWall);
        instance_create(xBegin + 6 * tile_width, level_height - 6 * tile_height, objectTileWall);
        instance_create(xBegin + 7 * tile_width, level_height - 6 * tile_height, objectTileWall);
        instance_create(xBegin + 7 * tile_width, level_height - 5 * tile_height, objectTileWall);
        instance_create(xBegin + 7 * tile_width, level_height - 4 * tile_height, objectTileWall);
        instance_create(xBegin + 7 * tile_width, level_height - 3 * tile_height, objectTileWall);
        instance_create(xBegin + 7 * tile_width, level_height - 2 * tile_height, objectTileWall);
        instance_create(xBegin + 7 * tile_width, level_height - 1 * tile_height, objectTileWall);
        instance_create(xBegin + 6 * tile_width, level_height - 1 * tile_height, objectTileWall);
        instance_create(xBegin + 3 * tile_width, level_height - 4 * tile_height, objectTreasure);
        if (global.hardObstacles) {
            instance_create(xBegin + 1 * tile_width, level_height - 3 * tile_height, objectFallingDeath);
            instance_create(xBegin + 1 * tile_width, 1 * tile_height, objectFallingDeath);
        }
        break;
}

