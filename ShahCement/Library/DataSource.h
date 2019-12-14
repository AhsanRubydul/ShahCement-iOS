//
//  DataSource.h
//  ShahCement
//
//  Created by Huq Majharul on 2018/02/14.
//  Copyright © 2018 SmartMux Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSource : NSObject

+ (NSArray *)menu;
//+ (NSArray *)videoList;
+ (NSArray *)productList;

+ (NSArray *)videoListThumbnails;
+ (NSArray *)videoListDurations;
+ (NSArray *)videoListIds;
+ (NSArray *)videoListTitles;
@end
