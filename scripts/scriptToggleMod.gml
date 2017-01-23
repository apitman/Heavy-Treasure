/// scriptToggleMod(modIndex, shouldSet, affectMultiplier)
var modIndex = argument0;
var shouldSet = argument1;
var affectMultiplier = argument2;

if (affectMultiplier && shouldSet) {
    global.treasureMultiplier *= 2;
} else if (affectMultiplier) {
    global.treasureMultiplier /= 2;
}

switch (modIndex) {
    case 0:
        // Additional types of obstacles
        global.extraObstacles = shouldSet;
        break;
    case 1:
        // Hard versions of obstacles
        global.hardObstacles = shouldSet;
        break;
    case 2:
        // Can't throw away treasure
        global.noDroppingTreasure = shouldSet;
        break;
    case 3:
        // Treasure speeds you up
        global.fastTreasure = shouldSet;
        break;
    case 4:
        // Some floor tiles disappear
        global.disappearingTiles = shouldSet;
        break;
    case 5:
        // Double jump disabled
        global.doubleJumpDisabled = shouldSet;
        break;
    case 6:
        // Can't move left
        global.leftDisabled = shouldSet;
        break;
    case 7:
        // Get chased by ghost
        global.ghostChase = shouldSet;
        break;
    case 8:
        // Fireballs from the right
        global.fireballsEnabled = shouldSet;
        break;
    case 9:
        // Some treasure is cursed
        global.cursedTreasure = shouldSet;
        break;
}
