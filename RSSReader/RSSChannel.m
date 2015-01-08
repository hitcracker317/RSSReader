//
//  RSSChannel.m
//  RSSReader
//
//  Created by 前田 晃良 on 2014/12/31.
//  Copyright (c) 2014年 A.M. All rights reserved.
//

#import "RSSChannel.h"

@interface RSSChannel ()

@property (nonatomic) NSString *identifier;
@property (nonatomic) NSString *feedURLString;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *link;

@property (nonatomic) NSMutableArray *itemArray;

@end

@implementation RSSChannel

- (id)init{
    self = [super self];
    if (!self) {
        return nil;
    }
    
    self.identifier = [[NSUUID UUID] UUIDString]; //識別子を作成
    self.itemArray = [NSMutableArray new];
    
    return self;
}

@end
