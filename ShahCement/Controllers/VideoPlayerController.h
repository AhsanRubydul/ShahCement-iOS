//
//  VideoPlayerController.h
//  ShahCement
//
//  Created by Huq Majharul on 3/12/18.
//  Copyright © 2018 SmartMux Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface VideoPlayerController : UIViewController
{
    IBOutlet WKWebView *webViewMain;
    IBOutlet    UIButton                    *buttonBack;
    IBOutlet    UIImageView                 *imageViewTopBar;
}

@property (nonatomic, strong) NSString    *videoId;
@property (nonatomic, strong) NSString    *type;

@end
