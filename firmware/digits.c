#include "digits.h"

const unsigned char digits[] = {
    0b01111111,
    0b01000001,
    0b01000001,
    0b01111111,

    0b00000000,
    0b00000000,
    0b00000000,
    0b01111111,

    0b01111001,
    0b01001001,
    0b01001001,
    0b01001111,

    0b01001001,
    0b01001001,
    0b01001001,
    0b01111111,

    0b00001111,
    0b00001000,
    0b00001000,
    0b01111111,

    0b01001111,
    0b01001001,
    0b01001001,
    0b01111001,

    0b01111111,
    0b01001001,
    0b01001001,
    0b01111001,

    0b00000001,
    0b00000001,
    0b00000001,
    0b01111111,

    0b01111111,
    0b01001001,
    0b01001001,
    0b01111111,

    0b01001111,
    0b01001001,
    0b01001001,
    0b01111111,
};

const unsigned char* digits_row(int val, int row) {
    return row < 4 ? (digits + (val * 4) + row) : 0;
}

const unsigned char* digits_narrow_row(int val, int row) {
    int real_row = 0;
    switch (row) {
    case 0:
      real_row = 0; break;
    case 1:
      real_row = 1; break;
    case 2:
      real_row = 3; break;
    default:
      return 0;
    }
    return digits + (val * 4) + real_row;
}
