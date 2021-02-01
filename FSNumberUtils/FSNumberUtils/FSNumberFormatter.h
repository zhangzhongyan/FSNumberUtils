//
//  FSNumberFormatter.h
//  FSNumberUtils
//
//  Created by 张忠燕 on 2020/6/12.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 数值格式化处理
@interface FSNumberFormatter : NSObject

#pragma mark -- Base

/// 格式化数字
/// @param roundingMode 舍入方式
/// @param doubleValue 数值
/// @param formatterStyle 数字格式
/// @param minimumFractionDigits 最少保留小数位
/// @param maximumFractionDigits 最多保留小数位
/// @param positivePrefix 正数符号前缀
/// @param negativePrefix 负数符号前缀
+ (NSString *)roundingMode:(NSNumberFormatterRoundingMode)roundingMode
                     value:(double)doubleValue
            formatterStyle:(NSNumberFormatterStyle)formatterStyle
     minimumFractionDigits:(NSUInteger)minimumFractionDigits
     maximumFractionDigits:(NSUInteger)maximumFractionDigits
            positivePrefix:(nullable NSString *)positivePrefix
            negativePrefix:(nullable NSString *)negativePrefix;

#pragma mark -- Round Up

/// 格式化数字（四舍五入、末尾补零）
/// @param doubleValue 数值
/// @param scale 保留小数位数
/// @param decimalStyle 千分位标点
+ (NSString *)roundUpRetainZeroWithValue:(double)doubleValue scale:(NSUInteger)scale decimalStyle:(BOOL)decimalStyle;


/// 格式化数字（四舍五入、末尾舍零）
/// @param doubleValue 数值
/// @param scale 保留小数位数
/// @param decimalStyle 千分位标点
+ (NSString *)roundUpReleaseZeroWithValue:(double)doubleValue scale:(NSUInteger)scale decimalStyle:(BOOL)decimalStyle;

#pragma mark -- Round Down

/// 格式化数字（尾数舍去、末尾补零）
/// @param doubleValue 数值
/// @param scale 保留小数位数
/// @param decimalStyle 千分位标点
+ (NSString *)roundDownRetainZeroWithValue:(double)doubleValue scale:(NSUInteger)scale decimalStyle:(BOOL)decimalStyle;

/// 格式化数字（尾数舍去、末尾舍零）
/// @param doubleValue 数值
/// @param scale 保留小数位数
/// @param decimalStyle 千分位标点
+ (NSString *)roundDownReleaseZeroWithValue:(double)doubleValue scale:(NSUInteger)scale decimalStyle:(BOOL)decimalStyle;

@end

NS_ASSUME_NONNULL_END
