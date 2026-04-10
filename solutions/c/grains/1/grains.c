#include "grains.h"
#include <math.h>

uint64_t square(uint8_t index){
    return pow(2,index-1);
}

uint64_t total(void){
    uint64_t total_number_of_grains = 0;
    for(uint8_t i=1; i<=64;i++){
        total_number_of_grains += square(i);
    }
    return total_number_of_grains;
}