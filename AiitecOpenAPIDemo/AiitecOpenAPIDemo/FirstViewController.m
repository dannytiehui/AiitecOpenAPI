//
//  FirstViewController.m
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-26.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AiitecOpenAPI *api = [[AiitecOpenAPI alloc] init];
    [api danny];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
