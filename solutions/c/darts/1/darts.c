#include "darts.h"
#include <math.h>

uint8_t score(coordinate_t coordinate){
    // Calculate the Distance
    double distance = sqrt(
        (coordinate.x * coordinate.x) +
        (coordinate.y * coordinate.y)
    );

    if(distance > 10){
        return 0;
    }
    if(distance > 5){
        return 1;
    }
    if(distance > 1){
        return 5;
    }
    
    return 10;
    
}