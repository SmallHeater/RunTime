//
//  NSURL+Hook.m
//  RunTime
//
//  Created by xianjunwang on 2017/12/3.
//  Copyright © 2017年 xianjunwang. All rights reserved.
//

#import "NSURL+Hook.h"
#import <objc/message.h>
#import <objc/runtime.h>


@implementation NSURL (Hook)

+(void)load{
    
    //本方法编译时执行
    //得到函数URLWithString:的指针
    Method urlWithStringMethod = class_getClassMethod([NSURL class], NSSelectorFromString(@"URLWithString:"));
    //得到函数SHURLWithString:的指针(C方法)
    Method SHURLWithString = class_getClassMethod([NSURL class], sel_registerName("SHURLWithString:"));
    //交换两个函数的指针，这样，当调用函数URLWithString时就会执行SHURLWithString。
    method_exchangeImplementations(urlWithStringMethod, SHURLWithString);
}


+(instancetype)SHURLWithString:(NSString *)URLString{
    
    if (URLString && [URLString isKindOfClass:[NSString class]] && URLString.length > 0) {
        
        //因为函数的指针已经交换，所以这里想要调用函数URLWithString:，则需要调用SHURLWithString:。
        NSURL * url = [NSURL SHURLWithString:URLString];
        if (url) {
            
            return url;
        }
        else{
            
            NSLog(@"异常：%@实例化URL失败",URLString);
            NSURL * url = [NSURL SHURLWithString:@"https:www.baidu.com"];
            return url;
        }
    }
    else{
        
        NSLog(@"异常：地址为空");
        NSURL * url = [NSURL SHURLWithString:@"https:www.baidu.com"];
        return url;
    }
}
@end
