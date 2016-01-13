#include<iostream>
using namespace std;

void PrintScreen(unsigned char buffer[], int width, int height){
    int byteWidth = width / 8;
    for(int row = 0; row < height; ++row){
        for(int column = 0; column < byteWidth; ++column){
            int index = row * byteWidth + column;
            char block = buffer[index];
            for(int i = 7; i >= 0; --i){
                if( (block >> i) & 1){
                    cout << '.';
                }
                else{
                    cout << ' ';
                }
            }
        }
        cout << '\n';
    }
}

void SetBit(unsigned char& byte, int bit){
    byte |= 1 << bit;
}

void DrawHorizontalLine(unsigned char buffer[], int bufferLength, int width, int x1, int x2, int y){
    int x = width * y + x1;
    int end = width * y + x2;
    while(x < end){
        int byteIndex = x / 8;
        int bit = x - byteIndex * 8;
        SetBit(buffer[byteIndex], 7 - bit);
        ++x;
    }
}

int main(){
    unsigned char screen[] = {
        0x80, 0x01,
        0x40, 0x02,
        0x20, 0x04,
        0x10, 0x08,
        0x08, 0x10,
        0x04, 0x20,
        0x02, 0x40,
        0x01, 0x80
    };
    PrintScreen(screen, 16, 8);
    DrawHorizontalLine(screen, 2 * 8, 16, 5, 9, 2);
    PrintScreen(screen, 16, 8);
	return 0;
}