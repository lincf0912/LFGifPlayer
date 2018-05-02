//
//  ViewController.m
//  LFGifPlayer
//
//  Created by TsanFeng Lam on 2018/5/2.
//  Copyright © 2018年 lincf0912. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onClick:(id)sender {
    MyCollectionViewController *vc = [[MyCollectionViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
