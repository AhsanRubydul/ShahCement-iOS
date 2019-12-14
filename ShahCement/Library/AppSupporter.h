//
//  AppSupporter.h
//  ShahCement
//
//  Created by Huq Majharul on 2018/02/14.
//  Copyright © 2018 SmartMux Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppSupporter : NSObject

+ (AppSupporter *)sharedInstance;

- (NSString*)getProductThumbPath;
- (NSArray*)getProductThumbs;
- (NSString*)getMainFilePath:(NSString*)fileName;
- (NSString*)getLokkhonioFilePath:(NSString*)fileName;
- (NSString*)getFaqFilePath:(NSString*)fileName;

- (BOOL)isIphoneXDevices;

@end
