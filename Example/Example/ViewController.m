//
//  ViewController.m
//  Example
//
//  Created by 张忠燕 on 2020/6/12.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import "ViewController.h"
#import <FSNumberUtils/FSNumberUtils.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    NSArray<NSNumber *> *numbers = @[@(1234.56), @(1234.56789), @(1234.50), @(1234.00), @(-1234.56789), @(-1234.56344)];
    
    /**
     1234.56 -> 1234.56
     1234.56789 -> 1234.56
     1234.5 -> 1234.50
     1234 -> 1234.00
     -1234.56789 -> -1234.56
     -1234.56344 -> -1234.56
     */
    NSString *logText = @"\n";
    for (NSNumber *number in numbers) {
        NSString *text =  [FSNumberFormatter roundDownRetainZeroWithValue:number.doubleValue scale:2 decimalStyle:NO];
        logText = [NSString stringWithFormat:@"%@%@ -> %@\n", logText, number, text];
    }
    NSLog(@"%@", logText);
    
    /**
     1234.56 -> 1,234.56
     1234.56789 -> 1,234.56
     1234.5 -> 1,234.50
     1234 -> 1,234.00
     -1234.56789 -> -1,234.56
     -1234.56344 -> -1,234.56
     */
    logText = @"\n";
    for (NSNumber *number in numbers) {
        NSString *text =  [FSNumberFormatter roundDownRetainZeroWithValue:number.doubleValue scale:2 decimalStyle:YES];
        logText = [NSString stringWithFormat:@"%@%@ -> %@\n", logText, number, text];
    }
    NSLog(@"%@", logText);

    /**
     1234.56 -> 1234.56
     1234.56789 -> 1234.56
     1234.5 -> 1234.5
     1234 -> 1234
     -1234.56789 -> -1234.56
     -1234.56344 -> -1234.56
     */
    logText = @"\n";
    for (NSNumber *number in numbers) {
        NSString *text =  [FSNumberFormatter roundDownReleaseZeroWithValue:number.doubleValue scale:2 decimalStyle:NO];
        logText = [NSString stringWithFormat:@"%@%@ -> %@\n", logText, number, text];
    }
    NSLog(@"%@", logText);
    
    /**
     1234.56 -> 1234.56
     1234.56789 -> 1234.57
     1234.5 -> 1234.50
     1234 -> 1234.00
     -1234.56789 -> -1234.57
     -1234.56344 -> -1234.56
     */
    logText = @"\n";
    for (NSNumber *number in numbers) {
        NSString *text =  [FSNumberFormatter roundUpRetainZeroWithValue:number.doubleValue scale:2 decimalStyle:NO];
        logText = [NSString stringWithFormat:@"%@%@ -> %@\n", logText, number, text];
    }
    NSLog(@"%@", logText);
    
}


@end
