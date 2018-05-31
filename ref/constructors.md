
The copy assignment operator must clean up the data members of the assignment's target (and correctly handle self-assignment)
The copy constructor assigns values to uninitialized data members.
 For example:
  My_Array first;           // initialization by default constructor
  My_Array second(first);   // initialization by copy constructor
  My_Array third = first;   // Also initialization by copy constructor
  second = third;           // assignment by copy assignment operator
