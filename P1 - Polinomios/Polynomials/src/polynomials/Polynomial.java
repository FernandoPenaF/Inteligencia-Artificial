package polynomials;

// Adapted from Sedgewick & Wayne,
// http://introcs.cs.princeton.edu/java/92symbolic/Polynomial.java.html:

// This class represents a generic description of any polynomial of one
// variable with integer coefficients, and provides methods that allow the
// symbolic manipulation of said polynomial, or evaluating it given a value
// for its variable:
public class Polynomial {
    // The value stored in index 0 is the coefficient of the constant term of
    // the polynomial, the value stored in index 1 is the coefficient of the
    // "x" term of the poloynomial, the value stored in index 2 is the
    // coefficient of the "x^2" (x-squared) term of the polynomial, etc.
    // This leaves the possibility for several of the values stored in the
    // array to be "empty" (0 values) if the polynomial doesn't contain a term
    // with a power of x that corresponds to the index:
    private int[] coef;  // Coefficients.
    private int deg;     // Degree of polynomial (0 for the zero polynomial).

    // Constructs a new polynomial term of the form a * x^b:
    public Polynomial(int a,int b) {
        coef=new int[b+1];
        coef[b]=a;
        deg=degree();
    }

    // Returns the degree of this polynomial (0 for the zero polynomial):
    public int degree() {
        int i,d=0;
        
        for(i=0;i<coef.length;i=i+1)
            if(coef[i]!=0)
                d=i;
        
        return d;
    }

    // Returns the sum of two polynomials (this object plus the argument),
    // c = a + b:
    public Polynomial plus(Polynomial b) {
        Polynomial a=this;
        Polynomial c=new Polynomial(0,Math.max(a.deg,b.deg));
        int i;
        
        for(i=0;i<=a.deg;i=i+1)
            c.coef[i]=c.coef[i]+a.coef[i];
        for(i=0;i<=b.deg;i=i+1)
            c.coef[i]=c.coef[i]+b.coef[i];
        c.deg=c.degree();
        
        return c;
    }

    // Returns the difference of two polynomials (this object minus the
    // argument), c = a - b:
    public Polynomial minus(Polynomial b) {
        Polynomial a=this;
        Polynomial c=new Polynomial(0,Math.max(a.deg,b.deg));
        int i;
        
        for(i=0;i<=a.deg;i=i+1)
            c.coef[i]=c.coef[i]+a.coef[i];
        for(i=0;i<=b.deg;i=i+1)
            c.coef[i]=c.coef[i]-b.coef[i];
        c.deg=c.degree();
        
        return c;
    }

    // Returns the product of two polynomials (this object times the
    // argument), c = a * b:
    public Polynomial times(Polynomial b) {
        Polynomial a=this;
        Polynomial c=new Polynomial(0,a.deg+b.deg);
        int i,j;
        
        for(i=0;i<=a.deg;i=i+1)
            for(j=0;j<=b.deg;j=j+1)
                c.coef[i+j]=c.coef[i+j]+a.coef[i]*b.coef[j];
        c.deg=c.degree();
        
        return c;
    }

    // Returns the composition of two polynomials (this object "of" the
    // argument polynomial), c = a(b(x)), computed using Horner's method:
    public Polynomial compose(Polynomial b) {
        Polynomial a=this;
        Polynomial c=new Polynomial(0,0);
        int i;
        
        for(i=a.deg;i>=0;i=i-1) {
            Polynomial term=new Polynomial(a.coef[i],0);
            c=term.plus(b.times(c));
        }
        
        return c;
    }

    // Returns the result of evaluating this object at the value of the
    // argument, obtained using Horner's method:
    public int evaluate(int x) {
        int i,p=0;
        
        for(i=deg;i>=0;i=i-1)
            p=coef[i]+x*p;
        
        return p;
    }

    // Returns the derivative of this object:
    public Polynomial differentiate() {
        Polynomial deriv;
        int i;
        
        if(deg==0)
            deriv=new Polynomial(0,0);
        else {
            deriv=new Polynomial(0,deg-1);
            deriv.deg=deg-1;
            for(i=0;i<deg;i=i+1)
                deriv.coef[i]=(i+1)*coef[i+1];
        }
        
        return deriv;
    }

    // Return the String representation of this polynomial:
    public String toString() {
        StringBuilder sb=new StringBuilder("");
        int i;
        
        if(deg==0)
            sb.append(coef[0]);
        else if(deg==1) {
            sb.append(coef[1]+"x ");
            if(coef[0]>0)
                sb.append("+ "+coef[0]);
            else if(coef[0]<0)
                sb.append("- "+(-coef[0]));
        }
        else {
            sb.append(coef[deg]+"x^"+deg);
            for(i=deg-1;i>=0;i=i-1) {
                if(coef[i]>0)
                    sb.append(" + "+coef[i]);
                else if(coef[i]<0)
                    sb.append(" - "+(-coef[i]));
                if(coef[i]!=0)
                    if(i==1)
                        sb.append("x");
                    else if(i>1)
                        sb.append("x^"+i);
            }
        }
        
        return sb.toString();
    }
}
