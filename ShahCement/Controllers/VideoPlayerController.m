//
//  VideoPlayerController.m
//  ShahCement
//
//  Created by Huq Majharul on 3/12/18.
//  Copyright © 2018 SmartMux Limited. All rights reserved.
//

#import "VideoPlayerController.h"
#import "MBProgressHUD.h"
#import "AppSupporter.h"

@interface VideoPlayerController ()

@end

@implementation VideoPlayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    BOOL iPhoneX = [[AppSupporter sharedInstance] isIphoneXDevices];
    if(iPhoneX){
        CGRect frame = imageViewTopBar.frame;
        frame.origin.y += IPHONEX_EXTRA_HEIGHT;
        imageViewTopBar.frame = frame;
        
        frame = webViewMain.frame;
        frame.origin.y += IPHONEX_EXTRA_HEIGHT;
        frame.size.height -= IPHONEX_EXTRA_HEIGHT;
        webViewMain.frame = frame;
        
        frame = buttonBack.frame;
        frame.origin.y = imageViewTopBar.frame.origin.y + (imageViewTopBar.frame.size.height - frame.size.height) / 2;
        buttonBack.frame = frame;
    }
    
    if ([_type isEqualToString:@"0"]){
        [self playVideoWithId:self.videoId];
    }else{
        [webViewMain loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.videoId]]];
    }
  
}

- (IBAction)actionBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)playVideoWithId:(NSString *)videoId
{
    webViewMain.configuration.allowsInlineMediaPlayback = NO;
    webViewMain.configuration.mediaTypesRequiringUserActionForPlayback = WKAudiovisualMediaTypeNone;
    
    // HTML string using YouTube IFrame API
    NSString *videoUrl = [NSString stringWithFormat:
                          @"<html>"
                          "<head><meta name='viewport' content='width=device-width, initial-scale=1.0'></head>"
                          "<body style='margin:0;padding:0;'>"
                          "<iframe width='100%%' height='100%%' "
                          "src='https://www.youtube.com/embed/%@?rel=0&playsinline=1&autoplay=1' "
                          "frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen>"
                          "</iframe>"
                          "</body>"
                          "</html>", videoId];
    [webViewMain loadHTMLString:videoUrl baseURL:nil];
}

@end
