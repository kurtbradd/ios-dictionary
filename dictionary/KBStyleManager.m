//
//  KBStyleManager.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-02.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBStyleManager.h"

@implementation KBStyleManager


#pragma mark - Common Colors
+ (UIColor *)navBlueColor
{
    return [self buildColorWithRed:0 green:133 blue:241];
}

+ (UIColor *)greenColor
{
    return [self buildColorWithRed:76 green:216 blue:100];
}

+ (UIColor *)redColor
{
    return [self buildColorWithRed:216 green:77 blue:77];
}

+ (UIColor *)grayBackgroundColor
{
    return [self buildColorWithRed:239 green:239 blue:244];
}

+ (UIColor *)grayIconColor
{
    return [self buildColorWithRed:178 green:178 blue:178];
}

#pragma mark - Text Colors
+ (UIColor *)grayTextDarkColor
{
    return [self buildColorWithRed:136 green:136 blue:136];
}

+ (UIColor *)grayTextRegularColor
{
    return [self buildColorWithRed:109 green:109 blue:114];
}

+ (UIColor *)whiteTextColor
{
    return [self buildColorWithRed:245 green:245 blue:245];
}

#pragma mark - Fonts
+ (UIFont *)navTitleFont
{
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:22.0];
}

+ (UIFont *)navButtonFont
{
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:22.0];
}

+ (UIFont *)helvetivaWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue" size:size];
}

+ (UIFont *)helvetivaLightWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:size];
}

+ (UIFont *)helvetivaBoldWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:size];
}

#pragma mark - Private Methods
+ (UIColor *)buildColorWithRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue
{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}

@end
