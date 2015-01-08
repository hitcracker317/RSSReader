//
//  RSSItem.m
//  RSSReader
//
//  Created by 前田 晃良 on 2014/12/31.
//  Copyright (c) 2014年 A.M. All rights reserved.
//

#import "RSSItem.h"

@interface RSSItem () <NSCoding>

@property (nonatomic) NSString *identifier;
@property (nonatomic,getter=isRead) BOOL isRead;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *link;
@property (nonatomic) NSString *itemDescription;
@property (nonatomic) NSString *pubDate;

@end

@implementation RSSItem

- (id)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.identifier = [[NSUUID UUID] UUIDString]; //識別子を作成
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    //インスタンスをエンコード
    [aCoder encodeObject:self.identifier forKey:@"identifier"];
    [aCoder encodeBool:self.isRead forKey:@"read"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.link forKey:@"link"];
    [aCoder encodeObject:self.itemDescription forKey:@"itemDescription"];
    [aCoder encodeObject:self.pubDate forKey:@"pubDate"];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    //インスタンスをデコード
    self.identifier = [aDecoder decodeObjectForKey:@"identifier"];
    self.isRead = [aDecoder decodeBoolForKey:@"read"];
    self.title = [aDecoder decodeObjectForKey:@"title"];
    self.link = [aDecoder decodeObjectForKey:@"link"];
    self.itemDescription = [aDecoder decodeObjectForKey:@"itemDescription"];
    self.pubDate = [aDecoder decodeObjectForKey:@"pubDate"];
    
    return self;
}

@end
