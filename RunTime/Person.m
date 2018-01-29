//
//  Person.m
//  RunTime
//
//  Created by xianjunwang on 2018/1/22.
//  Copyright © 2018年 xianjunwang. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "People.h"

@implementation Person


//动态方法重写
+(BOOL)resolveInstanceMethod:(SEL)sel{

    class_replaceMethod([self class], sel, class_getMethodImplementation([self class], NSSelectorFromString(@"repleaseEat")), "v@:");
    //class_addMethod([self class], sel, class_getMethodImplementation([self class], NSSelectorFromString(@"repleaseEat")), "v@:");
    return YES;
}



-(void)repleaseEat{
    
    NSLog(@"替换eat实现");
}



+(BOOL)resolveClassMethod:(SEL)sel{
    
    //元类
    Class metaClass = objc_getMetaClass(class_getName(self));
    class_addMethod(metaClass, sel, class_getMethodImplementation([self class], NSSelectorFromString(@"replseSEL")), "");
    return YES;
}

+(void)replseSEL{
    
    NSLog(@"替换run实现");
}

//消息转发
//-(id)forwardingTargetForSelector:(SEL)aSelector{
//    
////    if (aSelector == NSSelectorFromString(@"eat")) {
////
////        return [[People alloc] init];
////    }
//    return self;
//}

-(void)forwardInvocation:(NSInvocation *)invocation
{
    SEL invSEL = invocation.selector;
    People * pp = [[People alloc] init];
    if([pp respondsToSelector:invSEL]) {
        [invocation invokeWithTarget:pp];
    } else {
        [self doesNotRecognizeSelector:invSEL];
    }
}

@end
