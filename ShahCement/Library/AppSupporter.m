//
//  AppSupporter.m
//  ShahCement
//
//  Created by Huq Majharul on 2018/02/14.
//  Copyright © 2018 SmartMux Limited. All rights reserved.
//

#import "AppSupporter.h"
#import <UIKit/UIKit.h>

@implementation AppSupporter

+ (AppSupporter *)sharedInstance
{
    // structure used to test whether the block has completed or not
    static dispatch_once_t p = 0;
    
    // initialize sharedObject as nil (first call only)
    __strong static id _sharedObject                        = nil;
    
    // executes a block object once and only once for the lifetime of an application
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
        
    });
    
    // returns the same object each time
    return _sharedObject;
}

- (NSString*)getProductThumbPath
{
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *path         = [resourcePath stringByAppendingPathComponent:@"thumbs"];
    return path;
}

- (NSArray*)getProductThumbs
{
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *path         = [resourcePath stringByAppendingPathComponent:@"thumbs"];
    NSError *error;
    return [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:&error];
}

- (NSString*)getMainFilePath:(NSString*)fileName
{
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *path         = [resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"pdfs/%@_main.pdf",fileName]];
    BOOL exist = [[NSFileManager defaultManager] fileExistsAtPath:path];
    if (exist) {
        return path;
    }
    return nil;
}

- (NSString*)getLokkhonioFilePath:(NSString*)fileName
{
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *path         = [resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"pdfs/%@_lokh.pdf",fileName]];
    BOOL exist = [[NSFileManager defaultManager] fileExistsAtPath:path];
    if (exist) {
        return path;
    }
    return nil;
}

- (NSString*)getFaqFilePath:(NSString*)fileName
{
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *path         = [resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"pdfs/%@_faq.pdf",fileName]];
    BOOL exist = [[NSFileManager defaultManager] fileExistsAtPath:path];
    if (exist) {
        return path;
    }
    return nil;
}

- (NSString*)getAudioFilePath:(NSString*)fileName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"mp3"];
    BOOL exist = [[NSFileManager defaultManager] fileExistsAtPath:path];
    if (exist) {
        return path;
    }
    return nil;
}

- (BOOL)isIphoneXDevices{
    
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        switch ((int)[[UIScreen mainScreen] nativeBounds].size.height) {
            case 1136:
                return NO;
                
            case 1334:
                return NO;
                
            case 1920:
            case 2208:
                return NO;
                
            case 2436:
                return YES;
                
            case 2688:
                return YES;
                
            case 1792:
                return YES;
                
            default:
                break;
        }
    }
    return NO;
}

@end
