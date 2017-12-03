//
//  ViewController.m
//  RunTime
//
//  Created by xianjunwang on 2017/12/3.
//  Copyright © 2017年 xianjunwang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //测试
    NSURL * urlOne = [NSURL URLWithString:nil];
    NSURL * urlTwo = [NSURL URLWithString:@""];
    NSURL * urlThree = [NSURL URLWithString:@"https:www.baidu.com/中文"];
    NSURL * urlFour = [NSURL URLWithString:@"https:www.baidu.com"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
