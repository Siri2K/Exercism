#ifndef DARTS_H
#define DARTS_H

#include <stdint.h>

/* Coordinate Typedef */
 typedef struct {
     float x,y;
 } coordinate_t;

uint8_t score(coordinate_t coordinate);

#endif
