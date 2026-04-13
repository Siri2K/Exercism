#include "queen_attack.h"
#include <stdlib.h>

static uint8_t can_attack_diagonally(position_t q1, position_t q2) {
    return abs((int)q1.row - (int)q2.row) == abs((int)q1.column - (int)q2.column);
}

attack_status_t can_attack(position_t queen_1, position_t queen_2) {
    // 1. Check if positions are within 0-7 bounds
    if (queen_1.row >= 8 || queen_1.column >= 8 || 
        queen_2.row >= 8 || queen_2.column >= 8) {
        return INVALID_POSITION;
    }

    // 2. Check if they occupy the exact same square
    if (queen_1.row == queen_2.row && queen_1.column == queen_2.column) {
        return INVALID_POSITION;
    }

    // 3. Determine if they can attack
    if (queen_1.row == queen_2.row ||          // Horizontal
        queen_1.column == queen_2.column ||    // Vertical
        can_attack_diagonally(queen_1, queen_2)) { // Diagonal
        return CAN_ATTACK;
    }

    return CAN_NOT_ATTACK;
}