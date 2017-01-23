///scriptCreateModCards()
global.numModCards = 10;
var card1 = instance_create(128, 128, objectModCard);
var card2 = instance_create(352, 128, objectModCard);

// Ensure that the 2nd card is different from the first
while (card2.image_index == card1.image_index) {
    card2.image_index = irandom_range(1, global.numModCards - 1);
}

// Initialize global mod variables
for (i = 0; i < global.numModCards; i++) {
    scriptToggleMod(i, false, false);
}
