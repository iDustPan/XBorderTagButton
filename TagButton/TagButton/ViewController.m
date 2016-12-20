//
//  ViewController.m
//  TagButton
//
//  Created by 徐攀 on 2016/12/20.
//  Copyright © 2016年 com.borderXLab. All rights reserved.
//

#import "ViewController.h"
#import "XBorderTagButton.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XBorderTagButton *tagButton = [XBorderTagButton buttonWithBorderWidth:1 cornerRadius:2 type:XBorderTagButtonTypeTitleLeftAndImageRight];
    [tagButton addTarget:self action:@selector(touchAction:) forControlEvents:UIControlEventTouchUpInside];
    [tagButton setTitle:@"测试按钮1" forState:UIControlStateNormal];
    [tagButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [tagButton setImage:[UIImage imageNamed:@"discover_down_arrow"] forState:UIControlStateNormal];
    [self.view addSubview:tagButton];
    [tagButton sizeToFit];
    [tagButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.top.mas_equalTo(100);
    }];
    
    XBorderTagButton *tagButton2 = [XBorderTagButton buttonWithBorderWidth:0.5 cornerRadius:2 type:XBorderTagButtonTypeNormal];
    tagButton2.spacingOfImageAndTitle = 5;
    tagButton2.marginAtEnds = 10;
    [tagButton2 addTarget:self action:@selector(touchAction:) forControlEvents:UIControlEventTouchUpInside];
    [tagButton2 setTitle:@"测试按钮2" forState:UIControlStateNormal];
    [tagButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [tagButton2 setImage:[UIImage imageNamed:@"discover_down_arrow"] forState:UIControlStateNormal];
    [self.view addSubview:tagButton2];
   
    [tagButton2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tagButton.mas_right).offset(20);
        make.top.mas_equalTo(100);
    }];
    
    XBorderTagButton *tagButton3 = [XBorderTagButton buttonWithBorderWidth:1 cornerRadius:2 type:XBorderTagButtonTypeImageUpAndTitleDown];
    tagButton3.spacingOfImageAndTitle = 5;
    tagButton3.marginAtEnds = 10;
    [tagButton3 addTarget:self action:@selector(touchAction:) forControlEvents:UIControlEventTouchUpInside];
    [tagButton3 setTitle:@"测试按钮" forState:UIControlStateNormal];
    [tagButton3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [tagButton3 setImage:[UIImage imageNamed:@"login-btn-weibo"] forState:UIControlStateNormal];
    [self.view addSubview:tagButton3];
    
    [tagButton3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tagButton.mas_right);
        make.top.mas_equalTo(300);
    }];
}


- (void)touchAction:(XBorderTagButton *)button
{
    [button setTitle:@"啊" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
