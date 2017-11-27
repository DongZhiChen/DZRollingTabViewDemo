//
//  ViewController.m
//  DZRollingTabViewDome
//
//  Created by iMac on 2017/11/27.
//  Copyright © 2017年 ChenDongZhi. All rights reserved.
//

#import "ViewController.h"
#import "DZRollingTabView.h"
#import <Masonry.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet DZRollingTabView *rollingTabView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rollingTabView.arrayTitles = @[@"item1",@"item2",@"item3",@"item4",@"item5",@"item6"];
    self.rollingTabView.selectedIndex = 3;
    
    DZRollingTabView *rollingTabView2 = [[DZRollingTabView alloc] init];
    rollingTabView2.arrayTitles = @[@"item1",@"item2",@"item3"];
    self.rollingTabView.selectedIndex = 8;
    [self.view addSubview:rollingTabView2];
    [rollingTabView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_rollingTabView.mas_bottom);
        make.left.right.equalTo(@0);
        make.height.equalTo(@50);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
