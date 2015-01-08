//
//  ViewController.m
//  RSSReader
//
//  Created by 前田 晃良 on 2014/12/31.
//  Copyright (c) 2014年 A.M. All rights reserved.
//

#import "RSSChannelListController.h"

@interface RSSChannelListController ()

@end

@implementation RSSChannelListController

- (void)CommonInit{
    //初期化処理
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(!self){
        return nil;
    }
    [self CommonInit];
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(!self){
        return nil;
    }
    [self CommonInit];
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //画面を更新
    [self updateNavigationItem:animated];
}

- (void)updateNavigationItem:(BOOL)animated{
    //ナビゲーションアイテムの設定
    [self.navigationItem setLeftBarButtonItem:self.feedItem animated:animated];
    [self.navigationItem setRightBarButtonItem:self.refreshItem animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
