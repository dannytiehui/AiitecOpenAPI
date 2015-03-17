#import <Foundation/Foundation.h>


@interface Fraction : NSObject <NSCopying> {
    
    int numerator;
    int denominator;
    
}

@property int numerator, denominator;


-(void) setTo: (int) n over: (int)  d;
-(void) print;
-(void) reduce;
-(double) convertToNum;


@end