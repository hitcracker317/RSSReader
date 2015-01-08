//
//  RSSChannelManager.m
//  RSSReader
//
//  Created by 前田 晃良 on 2014/12/31.
//  Copyright (c) 2014年 A.M. All rights reserved.
//

#import "RSSChannelManager.h"

static RSSChannelManager *sharedInstance_ = nil;

@interface RSSChannelManager()

@property (nonatomic) NSMutableArray *channelArray;
@end

@implementation RSSChannelManager

+ (RSSChannelManager*)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [RSSChannelManager new];
    });
    return sharedInstance_;
}

- (id)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.channelArray = [NSMutableArray new];
    return self;
}

//追加
- (void)addChannel:(RSSChannel *)channel{
    if (!channel) {
        return;
    }
    
    [self.channelArray addObject:channel];
}

//挿入
- (void)insertChannel:(RSSChannel *)channel atIndex:(NSInteger)index{
    if (!channel) {
        return;
    }
    if (index < 0 || index > [self.channelArray count]) {
        return;
    }
    
    [self.channelArray insertObject:channel atIndex:index];
}

//削除
- (void)removeChannelAtIndex:(NSInteger)index{
    if (index < 0 || index > [self.channelArray count]) {
        return;
    }
    
    [self.channelArray removeObjectAtIndex:index];
}

//移動
- (void)moveChannelAtIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex{
    
    if (fromIndex < 0 || fromIndex > [self.channelArray count]) {
        return;
    }
    if (toIndex < 0 || toIndex > [self.channelArray count]) {
        return;
    }
    
    RSSChannel *channel = [self.channelArray objectAtIndex:fromIndex];
    [self.channelArray removeObject:channel];
    [self.channelArray insertObject:channel atIndex:toIndex];
    
}

//保存する場所(ディレクトリ)を作成
//保存先のファイルは~Documents/.channel/channel.dat
//~Documentsはドキュメントディレクトリと呼ばれるもので、iOSアプリで作成したファイルはここに保存される
//ディレクトリ名の前に.をつけるのはこのディレクトリを非公開にするため
- (NSString*)channelDir{
    //ドキュメントパスを取得
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if ([paths count] < 1) {
        return nil;
    }
    NSString *path = [paths objectAtIndex:0];
    
    //.channelディレクトリを作成する
    path = [path stringByAppendingPathComponent:@".channel"];
    return path;
}

- (NSString*)channelPath{
    //.channel.datのファイルパスを作成する
    NSString *path = [[self channelDir] stringByAppendingPathComponent:@"channel.dat"];
    return path;
}

//保存
- (void)save{
    //ファイルマネージャを取得
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    
    //.channelディレクトリを作成
    NSString *channelDir = [self channelDir];
    if (![fileMgr fileExistsAtPath:channelDir]) {
        //.channelディレクトリがなければ作成
        NSError *error;
        [fileMgr createDirectoryAtPath:channelDir withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    //チャンネルの配列を保存する
    //モデルオブジェクトがNSCodingプロトコルに準拠していればarchiveRootObject:toFile:メソッド呼べば保存できる
    NSString *channelPath = [self channelPath];
    [NSKeyedArchiver archiveRootObject:self.channelArray toFile:channelPath];
}

//読み込み
- (void)load{
    //.channel.datのファイルパスを取得
    NSString *channelPath = [self channelPath];
    if (!channelPath ||![[NSFileManager defaultManager] fileExistsAtPath:channelPath]) {
        return;
    }
    
    //チャンネルの配列を読み込む
    NSArray *channelArray = [NSKeyedUnarchiver unarchiveObjectWithFile:channelPath];
    //チャンネルの配列を設定
    self.channelArray.array = channelArray;
}

@end
