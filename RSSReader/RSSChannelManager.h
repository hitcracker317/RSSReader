//
//  RSSChannelManager.h
//  RSSReader
//
//  Created by 前田 晃良 on 2014/12/31.
//  Copyright (c) 2014年 A.M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSChannel.h"

@interface RSSChannelManager : NSObject

+ (RSSChannelManager*)sharedInstance;

//チャンネルの操作
- (void)addChannel:(RSSChannel*)channel; //追加
- (void)insertChannel:(RSSChannel*)channel atIndex:(NSInteger)index; //挿入
- (void)removeChannelAtIndex:(NSInteger)index; //削除
- (void)moveChannelAtIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex; //移動

@end
