package polynomials;

// Adapted from Sedgewick & Wayne,
// http://introcs.cs.princeton.edu/java/92symbolic/Polynomial.java.html:

/*************************************************************************
 *  Compilation:  javac Polynomial.java
 *  Execution:    java Polynomial
 *
 *  Polynomials of one variable ("x") with integer coefficients.
 *  The result of executing this program should be:
 *
 *  % java Polynomial
 *  zero(x)     = 0
 *  p(x)        = 4x^3 + 3x^2 + 2x + 1
 *  q(x)        = 3x^2 + 5
 *  p(x) + q(x) = 4x^3 + 6x^2 + 2x + 6
 *  p(x) * q(x) = 12x^5 + 9x^4 + 26x^3 + 18x^2 + 10x + 5
 *  p(q(x))     = 108x^6 + 567x^4 + 996x^2 + 586
 *  0 - p(x)    = -4x^3 - 3x^2 - 2x - 1
 *  p(3)        = 142
 *  p'(x)       = 12x^2 + 6x + 2
 *  p''(x)      = 24x + 6
 *
 *************************************************************************/

public class Polynomials {
    public static void main(String[] args) { 
        Polynomial zero=new Polynomial(0,0);

        // Test polynomials are created term by term (each term is itself a
        // polynomial), because the constructor method for the Polynomial
        // class doesn't permit otherwise, and then the terms are added up
        // using the "plus" method to finish building up the test polynomials:
        Polynomial p1=new Polynomial(4,3);
        Polynomial p2=new Polynomial(3,2);
        Polynomial p3=new Polynomial(1,0);
        Polynomial p4=new Polynomial(2,1);
        Polynomial p=p1.plus(p2).plus(p3).plus(p4);   // 4x^3 + 3x^2 + 1.

        Polynomial q1=new Polynomial(3,2);
        Polynomial q2=new Polynomial(5,0);
        Polynomial q=q1.plus(q2);   // 3x^2 + 5.

        Polynomial r=p.plus(q);
        Polynomial s=p.times(q);
        Polynomial t=p.compose(q);

        System.out.println("zero(x)     = "+zero);
        System.out.println("p(x)        = "+p);
        System.out.println("q(x)        = "+q);
        System.out.println("p(x) + q(x) = "+r);
        System.out.println("p(x) * q(x) = "+s);
        System.out.println("p(q(x))     = "+t);
        System.out.println("0 - p(x)    = "+zero.minus(p));
        System.out.println("p(3)        = "+p.evaluate(3));
        System.out.println("p'(x)       = "+p.differentiate());
        System.out.println("p''(x)      = "+p.differentiate().differentiate());
   }
}
