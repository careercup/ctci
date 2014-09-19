#include "Question1_1/Question1_1.h"
#include "Question1_2/Question1_2.h"
#include "Question1_3/Question1_3.h"
#include "Question1_3/Question1_3_B.h"
#include "Question1_4/Question1_4.h"
#include "Question1_5/Question1_5.h"
#include "Question1_6/Question1_6.h"
#include "Question1_7/Question1_7.h"
#include "Question1_8/Question1_8.h"
#include "Misc/SimpleHashTable.h"
#include <iostream>
#include <stdexcept>
#include "Question2_1.h"
#include "Question2_2.h"
#include "Question2_3.h"
#include "Question2_4.h"
#include "Question2_5.h"
#include "Question2_6.h"
#include "Question2_7.h"

using namespace std;

/**
 * Main for running exercises from Chapter 1
 */
int main() 
{
    Question2_7().run();

/*    SimpleHashTable<int, bool> map(5);
    map.insert(10, true);
    cout << map.get(10) << endl;
    map.printTable();
    map.remove(10);
    try 
    {
        map.get(10);
    }
    catch(const out_of_range&) 
    {
        cout << "Attempted to remove a non existing key from the hash table." << endl;
    }  */ 
}