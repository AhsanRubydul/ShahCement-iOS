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
    NSString *videoUrl = [NSString stringWithFormat:@"<html><head><style>body{margin:0px 0px 0px 0px;}</style></head> <body> <div id=\"player\"></div> <script> var tag = document.createElement('script'); tag.src = 'http://www.youtube.com/player_api'; var firstScriptTag = document.getElementsByTagName('script')[0]; firstScriptTag.parentNode.insertBefore(tag, firstScriptTag); var player; function onYouTubePlayerAPIReady() { player = new YT.Player('player', { width:'%f', height:'%f', videoId:'%@', events: { 'onReady': onPlayerReady } }); } function onPlayerReady(event) { event.target.playVideo(); } </script> </body> </html>",CGRectGetWidth(self.view.frame),CGRectGetHeight(self.view.frame),videoId];
    
    webViewMain.mediaPlaybackRequiresUserAction = NO;
    
    [webViewMain loadHTMLString:videoUrl baseURL:[[NSBundle mainBundle] resourceURL]];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidStartLoad");
    //[MBProgressHUD showHUDAddedTo:webViewMain animated:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad");
    //[MBProgressHUD hideHUDForView:webViewMain animated:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"didFailLoadWithError");
    //[MBProgressHUD hideHUDForView:webViewMain animated:YES];
}

@end
