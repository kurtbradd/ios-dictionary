//
//  KBStyleManager.h
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-02.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KBStyleManager : NSObject

#pragma mark - Common Colors
+ (UIColor *)navBlueColor;
+ (UIColor *)greenColor;
+ (UIColor *)redColor;
+ (UIColor *)grayBackgroundColor;
+ (UIColor *)grayIconColor;

#pragma mark - Text Colors
+ (UIColor *)grayTextDarkColor;
+ (UIColor *)grayTextRegularColor;
+ (UIColor *)whiteTextColor;

#pragma mark - Fonts
+ (UIFont *)navTitleFont;
+ (UIFont *)navButtonFont;
+ (UIFont *)helvetivaWithSize:(CGFloat)size;
+ (UIFont *)helvetivaLightWithSize:(CGFloat)size;
+ (UIFont *)helvetivaBoldWithSize:(CGFloat)size;

@end
