//
//  main.m
//  Prog_6.8
//  Program to evaluate simple expressions of the form number operator number
//
//  Implement a Calculator class
//
//  Created by Perry R Gabriel on 12/18/14.
//  Copyright (c) 2014 Raw Games. All rights reserved.
//

#import <Foundation/Foundation.h>

//---- @interface section ----
@interface Calcuator : NSObject

//  accumlator methods
-(void)     clear;
-(void)     setAccumulator: (double) value;
-(double)   accumulator;

//  arithmetic methods
-(void) add: (double) value;
-(void) subtract: (double) value;
-(void) multiply: (double) value;
-(void) divide: (double) value;

@end

//---- @implementation section ----
@implementation Calcuator
{
    double accumulator;
}

-(void)setAccumulator:(double)value
{
    accumulator = value;
}

-(void)clear
{
    accumulator = 0;
}

-(double)accumulator
{
    return accumulator;
}

-(void)add:(double)value
{
    accumulator += value;
}

-(void)subtract:(double)value
{
    accumulator -= value;
}

-(void)divide:(double)value
{
    if (value != 0)
        accumulator /= value;
    else {
        NSLog(@"Division by zero.");
        accumulator = NAN;
    }
}

-(void)multiply:(double)value
{
    accumulator *= value;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        double          value1, value2;
        char            operator;
        Calcuator       *deskCalc = [Calcuator new];
        
        NSLog(@"Type in your expression.");
        scanf("%lf %c %lf", &value1, &operator, &value2);
        
        [deskCalc setAccumulator:value1];
        if (operator == '+') {
            [deskCalc add:value2];
        } else if (operator == '-') {
            [deskCalc subtract:value2];
        } else if (operator == '*') {
            [deskCalc multiply:value2];
        } else if (operator == '/') {
            [deskCalc divide:value2];
        } else
            NSLog(@"Unknown operator.");
        
        NSLog(@"%.2f", [deskCalc accumulator]);
    }
    return 0;
}
