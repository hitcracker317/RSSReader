//
//  RSSFeedListController.m
//  RSSReader
//
//  Created by 前田 晃良 on 2015/01/04.
//  Copyright (c) 2015年 A.M. All rights reserved.
//

#import "RSSFeedListController.h"

@interface RSSFeedListController ()

@end

@implementation RSSFeedListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    //親クラスのメソッド
    [super setEditing:editing animated:animated];
    
    //画面を更新
    [self updateNavigationItemAnimated:animated];
}

- (void)updateNavigationItemAnimated:(BOOL)animated{
    if(self.editing){
        //編集モード
        [self.navigationItem setLeftBarButtonItem:nil animated:animated];
        [self.navigationItem setRightBarButtonItem:nil animated:animated];
    } else {
        //通常モード
        [self.navigationItem setLeftBarButtonItem:self.addItem animated:animated];
        [self.navigationItem setRightBarButtonItem:self.doneItem animated:animated];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
