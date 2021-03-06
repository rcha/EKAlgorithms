//
//  ENumbers.m
//  EKAlgorithms
//
//  Created by Evgeny Karkan on 16.10.13.
//  Copyright (c) 2013 EvgenyKarkan. All rights reserved.
//

#import "EKNumbersStuff.h"


@implementation EKNumbersStuff;

#pragma mark - Sieve of Eratosthenes

+ (NSArray *)primeNumbersFromSieveEratosthenesWithMaxNumber:(NSUInteger)maxNumber
{
	NSMutableArray *resultArray = [@[] mutableCopy];
    
	for (NSUInteger i = 0; i < maxNumber; i++) {
		resultArray[i] = [NSNumber numberWithInteger:i];
	}
    
	resultArray[1] = [NSNumber numberWithInteger:0];
    
	for (NSUInteger s = 2; s < maxNumber; s++) {
		if (resultArray[s] != [NSNumber numberWithInteger:0]) {
			for (NSUInteger j = s * 2; j < maxNumber; j += s) {
				resultArray[j] = [NSNumber numberWithInteger:0];
			}
		}
	}
	[resultArray removeObjectIdenticalTo:[NSNumber numberWithInteger:0]];
    
	return [resultArray copy];
}

#pragma mark - GCD

+ (NSUInteger)greatestCommonDivisorWithFirstNumber:(NSUInteger)firstNumber secondNumber:(NSUInteger)secondNumber
{
	NSUInteger c;
    
	while (firstNumber != 0) {
		c = firstNumber;
		firstNumber =  secondNumber % firstNumber;
		secondNumber = c;
	}
    
	return secondNumber;
}

#pragma mark - LCM

+ (NSUInteger)leastCommonMultipleWithFirstNumber:(NSUInteger)firstNumber secondNumber:(NSUInteger)secondNumber
{
	return firstNumber * secondNumber  / [self greatestCommonDivisorWithFirstNumber:firstNumber secondNumber:secondNumber];
}

#pragma mark - Factorial

+ (NSUInteger)factorialForNumber:(NSUInteger)number
{
	NSUInteger factorial = 1;
    
	for (NSUInteger i = 1; i <= number; i++) {
		factorial = factorial * i;
	}
    
	return factorial;
}

#pragma mark - Fibonacci

+ (NSMutableArray *)fibonacciNumbersUpToNumber:(NSUInteger)number
{
	NSMutableArray *resultArray = [@[] mutableCopy];
    
	resultArray[0] = [NSNumber numberWithInteger:0];
	resultArray[1] = [NSNumber numberWithInteger:1];
    
	for (NSUInteger i = 2; i < number; i++) {
		NSNumber *foo = [NSNumber numberWithInteger:[resultArray[i - 2] integerValue] + [resultArray[i - 1] integerValue]];
		resultArray[i] = foo;
	}
    
	return resultArray;
}

#pragma mark - Sum of digits of a number

+ (NSUInteger)sumOfDigitsOfNumber:(NSUInteger)number
{
	NSUInteger sum = 0;
    
	while (number != 0) {
		sum = sum + number % 10;
		number = number / 10;
	}
    
	return sum;
}

#pragma mark - Binary to decimal

+ (NSUInteger)decimalNumberFromBinary:(NSUInteger)binary
{
	NSUInteger decimalNumber = 0, j = 1, remainder;
    
	while (binary != 0) {
		remainder = binary % 10;
		decimalNumber = decimalNumber + remainder * j;
		j = j * 2;
		binary = binary / 10;
	}
    
	return decimalNumber;
}

#pragma mark - Decimal to binary

+ (NSUInteger)binaryNumberFromDecimal:(NSUInteger)decimal
{
	NSUInteger quotient;
	int binaryNumber[100], i = 1;
	quotient = decimal;
    
	while (quotient != 0) {
		binaryNumber[i++] = quotient % 2;
		quotient = quotient / 2;
	}
    
	NSMutableString *result = [[NSMutableString alloc] init];
    
	for (NSUInteger j = i - 1; j > 0; j--) {
		[result appendString:[NSString stringWithFormat:@"%d", binaryNumber[j]]];
	}
    
	return [result integerValue];
}

#pragma mark - Fast exponentiation

+ (NSInteger)fastExpForNumber:(NSInteger)number withPower:(NSInteger)power
{
	NSInteger result = 1;
    
	while (power) {
		if (power % 2 == 1) {
			result *= number;
		}
		power /= 2;
		number *= number;
	}
    
	return result;
}

#pragma mark - Number reverse

+ (NSUInteger)reverseNumberWithNumber:(NSUInteger)numberToReverse
{
	NSUInteger rightDigit = 0;
	NSMutableString *fooString = [@"" mutableCopy];
    
	do {
		rightDigit = numberToReverse % 10;
		[fooString appendString:[NSString stringWithFormat:@"%li", (long)rightDigit]];
		numberToReverse = numberToReverse / 10;
	}
	while (numberToReverse != 0);
    
	return (NSUInteger)[fooString integerValue];
}

#pragma mark - Even/Odd

+ (BOOL)isEvenNumber:(NSUInteger)number
{
	NSUInteger remainder = 0;
	remainder = number % 2;
    
	return (remainder == 0) ? YES : NO;
}

@end
