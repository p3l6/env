

=======================
OPERATORS & OVERLOADING
=======================
Operator        As a member of T                        Outside of class definition
a=b             R T::operator =(S b);                   -----
a+b             R T::operator +(S b);                   R operator +(S a, T b);
a-b             R T::operator -(S b);                   R operator -(S a, T b);
+a              R T::operator +();                      R operator +(S a);
-a              R T::operator -();                      R operator -(S a);
a*b             R T::operator *(S b);                   R operator *(S a, T b);
a/b             R T::operator /(S b);                   R operator /(S a, T b);
a%b             R T::operator %(S b);                   R operator %(S a, T b);
++a             R T::operator ++();                     R operator ++(S a);
a++             R T::operator ++(int);                  R operator ++(S a, int);
--a             R T::operator --();                     R operator --(S a);
a--             R T::operator --(int);                  R operator --(S a, int);

a==b            R T::operator ==(S b);                  R operator ==(S a, T b);
a!=b (not_eq)   R T::operator !=(S b);                  R operator !=(S a, T b);
a >b            R T::operator >(S b);                   R operator >(S a, T b);
a <b            R T::operator <(S b);                   R operator <(S a, T b);
a>=b            R T::operator >=(S b);                  R operator >=(S a, T b);
a<=b            R T::operator <=(S b);                  R operator <=(S a, T b);

!a (not)        R T::operator !();                      R operator !(S a);
a && b (and)    R T::operator &&(S b);                  R operator &&(S a, T b);
a || b (or)     R T::operator ||(S b);                  R operator ||(S a, T b);

~a (compl)      R T::operator ~();                      R operator ~(S a);
a&b (bitand)    R T::operator &(S b);                   R operator &(S a, T b);
a|b (bitor)     R T::operator |(S b);                   R operator |(S a, T b);
a^b (xor)       R T::operator ^(S b);                   R operator ^(S a, T b);
a<<b            R T::operator <<(S b);                  R operator <<(S a, T b);
a>>b            R T::operator >>(S b);                  R operator >>(S a, T b);

a+=b            R T::operator +=(S b);                  R operator +=(S a, T b);
a-=b            R T::operator -=(S b);                  R operator -=(S a, T b);
a*=b            R T::operator *=(S b);                  R operator *=(S a, T b);
a/=b            R T::operator /=(S b);                  R operator /=(S a, T b);
a%=b            R T::operator %=(S b);                  R operator %=(S a, T b);
a&=b (and_eq)   R T::operator &=(S b);                  R operator &=(S a, T b);
a|=b (or_eq)    R T::operator |=(S b);                  R operator |=(S a, T b);
a^=b (xor_eq)   R T::operator ^=(S b);                  R operator ^=(S a, T b);
a<<=b           R T::operator <<=(S b);                 R operator <<=(S a, T b);
a>>=b           R T::operator >>=(S b);                 R operator >>=(S a, T b);

a[b]            R T::operator [](S b);                  -----
*a              R T::operator *();                      R operator *(S a);
&a              R T::operator &();                      R operator &(S a);
a->b            R T::operator ->();                     -----
a.b             -----                                   -----
a->*b           R T::operator ->*(S a);                 R operator ->*(S a, T b);
a.*b            -----                                   -----

a(a1, a2)       R T::operator ()(S a1, U a2, ...);      -----
a, b            R T::operator ,(S b);                   R operator ,(S a, T b);
(type)a,type(a) T::operator R();                        -----
new type        void* T::operator new(size_t x);        void* operator new(size_t x);
new type[n]     void* T::operator new[](size_t x);      void* operator new[](size_t x);
delete a        void T::operator delete(void* x);       void operator delete(void* x);
delete[] a      void T::operator delete[](void* x);     void operator delete[](void* x);
