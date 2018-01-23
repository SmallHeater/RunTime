//
//  People.m
//  RunTime
//
//  Created by xianjunwang on 2018/1/22.
//  Copyright © 2018年 xianjunwang. All rights reserved.
//

#import "People.h"
#import <objc/runtime.h>

 
@implementation People

-(void)run{
    
    NSLog(@"People run");
}
//
//-(void)eat{
//    
//    NSLog(@"People eat");
//}

//+(BOOL)resolveClassMethod:(SEL)sel{
//    
//    NSLog(@"people_cls = %@",[self class]);
//    class_replaceMethod([self class], sel, class_getMethodImplementation([self class], NSSelectorFromString(@"replseSEL")), "");
//    return YES;
//}
//
//+(void)replseSEL{
//    
//    NSLog(@"替换run实现");
//}

@end
