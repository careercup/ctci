//write a program to solve for the real roots of the quadratic equation ax^2 + bx + c


#include<stdio.h>
#include <math.h>
int main ( )
{
float a, b, c;
float discriminant;
float xl, x2;
printf("\n input a b and c separated by spaces \n");
scanf("%f %f %f',&a,&b,&c);
printf("you entered %f %f %f"a,b,c);
discriminant = ( b * b) - ( 4 * a * c);
if ( discriminant> 0 )
{
if (a == 0)
{
if ( b == 0 )
{
printf("x = 0 \n");
else
{
xl = (-c)/b;
printf("Single real root is %f\n",xl);
}
}
else
{
xl = ( -b + sqrt(b*b - 4*a*c)) / (2 * a);
x2 = ( -b - sqrt(b*b - 4*a*)) / ( 2 * a);
printf("Two real roots are \n");
printf("%f %f\n",xl,x2);
}
else if ( discriminant == 0 )
{
printf("one real root \n");
if (a == 0 )
{
xl = 0;
printf("xl = %f\n",xl);
}
else
{
xl = -b / (2*a);
printf("xl = %f\n",xl);
}
else
{
printf(“Imaginary Roots\n”);
}
printf(“\n\n”);
}