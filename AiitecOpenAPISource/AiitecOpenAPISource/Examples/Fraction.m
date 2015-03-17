    #import "Fraction.h"  
      
      
    @implementation Fraction  
      
    @synthesize numerator, denominator;  
      
      
    -(id) copyWithZone: ( NSZone *) zone  
    {  
//        Fraction *newFract = [[ Fraction allocWithZone: zone] init];  
//        [newFract setTo:numerator over: denominator];  
//        return newFract;
        
        return [[self class] allocWithZone:zone];
    }
      
      
    -(void) setTo: (int) n over: (int)  d  
    {  
        self.numerator = n;  
        self.denominator = d;  
    }  
      
    -(void) print  
    {  
        NSLog(@"%i/%i", numerator, denominator);  
    }  
      
    -(void) reduce  
    {  
        int temp, u = numerator, v = denominator;  
          
        while (v) {  
            temp = u % v;  
            u = v;  
            v = temp;  
        }  
          
        numerator /= u;  
        denominator /= u;  
      
    }  
      
      
    -(double) convertToNum  
    {  
        return (double) numerator/denominator;  
    }  
      
      
      
    @end  