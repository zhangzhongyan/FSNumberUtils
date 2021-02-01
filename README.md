# FSNumberUtils
iOS数值精度处理工具。主要包含舍入方法（四舍五入、尾数舍去），末尾补零处理（末尾舍零，末尾补零）。标准化处理业务需要的场景，简单易用。

#### 版本修改

|  版本   | 修改内容  |
|  ----  | ----  |
| v1.0.0  | 四舍五入、尾数舍去、末尾零处理 |

请查看workspace工中的**Example**示例项目。 下载后，您将需要运行pod install。


# 使用背景

在后端返回小数点数值时，直接使用数据会丢失精度的问题。

比如 0.87，json成对象直接打印Log， 数值为 0.8699999999


### 简单用法

```
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
+ 
```

### 示例代码

```

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

```