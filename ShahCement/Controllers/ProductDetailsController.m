//
//  ProductDetailsController.m
//  ShahCement
//
//  Created by Huq Majharul on 2/15/18.
//  Copyright © 2018 SmartMux Limited. All rights reserved.
//

#import "ProductDetailsController.h"
#import "AppSupporter.h"
#import "CustomLoader.h"
#import "UIView+Toast.h"

@interface ProductDetailsController ()
{
    CustomLoader    *customLoaderView;
}
@end

@implementation ProductDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   // self.view.backgroundColor = [UIColor whiteColor];
    
    viewButtonBar.backgroundColor = APP_THEME_COLOR;
    
    [self adjustBottomBar];
    
    BOOL iPhoneX = [[AppSupporter sharedInstance] isIphoneXDevices];
    if(iPhoneX){
        CGRect frame = imageViewTopBar.frame;
        frame.origin.y += IPHONEX_EXTRA_HEIGHT;
        imageViewTopBar.frame = frame;
        
        frame = viewButtonBar.frame;
        frame.origin.y += IPHONEX_EXTRA_HEIGHT;
        viewButtonBar.frame = frame;
        
        frame = buttonBack.frame;
        frame.origin.y = imageViewTopBar.frame.origin.y + (imageViewTopBar.frame.size.height - frame.size.height) / 2;
        buttonBack.frame = frame;
    }
    
    if (IS_OUTLINE_ON) {
        [imageViewTopBar.layer setBorderColor:[UIColor yellowColor].CGColor];
        [imageViewTopBar.layer setBorderWidth:2.0f];
        
        [viewButtonBar.layer setBorderColor:[UIColor greenColor].CGColor];
        [viewButtonBar.layer setBorderWidth:2.0f];
        
        [webViewMain.layer setBorderColor:[UIColor blueColor].CGColor];
        [webViewMain.layer setBorderWidth:4.0f];
    }
    
    customLoaderView = [[CustomLoader alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:customLoaderView];
    customLoaderView.alpha = 0.0f;
    
    customLoaderView.alpha = 1.0f;
    [customLoaderView startAnimation];
    webViewMain.scalesPageToFit = YES;
    webViewMain.scrollView.showsHorizontalScrollIndicator = NO;
    webViewMain.scrollView.showsVerticalScrollIndicator = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSString    *mainPath = [[AppSupporter sharedInstance] getMainFilePath:self.fileName];
        NSURL *targetURL = [NSURL fileURLWithPath:mainPath];
        NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        [webViewMain loadRequest:request];
    });
    
    //[webViewMain sizeToFit];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.videoId.length == 0) {
        buttonVideo.alpha = 0.7f;
    }
    
    NSString    *lokkhonioPath = [[AppSupporter sharedInstance] getLokkhonioFilePath:self.fileName];
    if (lokkhonioPath == nil) {
        buttonLokkhonio.alpha = 0.7f;
    }
    
    NSString    *faqPath = [[AppSupporter sharedInstance] getFaqFilePath:self.fileName];
    if (faqPath == nil) {
        buttonFaq.alpha = 0.7f;
    }
}

- (void)adjustBottomBar
{
    CGRect screenSize = [UIScreen mainScreen].bounds;
    CGSize size = [UIImage imageNamed:@"bottombar"].size;
    
    CGFloat height = size.height * screenSize.size.width / size.width;
    
    bottomImageViewHeightConstraint.constant = height;

    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
}


- (IBAction)actionBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)playVideoWithId:(NSString *)videoId
{
    NSString *videoUrl = [NSString stringWithFormat:@"<html><head><style>body{margin:0px 0px 0px 0px;}</style></head> <body> <div id=\"player\"></div> <script> var tag = document.createElement('script'); tag.src = 'http://www.youtube.com/player_api'; var firstScriptTag = document.getElementsByTagName('script')[0]; firstScriptTag.parentNode.insertBefore(tag, firstScriptTag); var player; function onYouTubePlayerAPIReady() { player = new YT.Player('player', { width:'%f', height:'%f', videoId:'%@', events: { 'onReady': onPlayerReady } }); } function onPlayerReady(event) { event.target.playVideo(); } </script> </body> </html>",CGRectGetWidth(webViewMain.frame),CGRectGetHeight(webViewMain.frame),videoId];
    
    webViewMain.mediaPlaybackRequiresUserAction = NO;
    
    [webViewMain loadHTMLString:videoUrl baseURL:[[NSBundle mainBundle] resourceURL]];
}

- (IBAction)actionLokkhonio:(id)sender
{
    if (buttonLokkhonio.alpha == 0.7f) {
        [self.view makeToast:@"এখানে প্রযোজ্য নয় !!!"];
        return;
    }
    
    customLoaderView.alpha = 1.0f;
    [customLoaderView startAnimation];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSString    *lokkhonioPath = [[AppSupporter sharedInstance] getLokkhonioFilePath:self.fileName];
        NSURL *targetURL = [NSURL fileURLWithPath:lokkhonioPath];
        NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        [webViewMain loadRequest:request];
        webViewMain.scalesPageToFit = YES;
    });
}

- (IBAction)actionVideo:(id)sender
{
    if (buttonVideo.alpha == 0.7f) {
        [self.view makeToast:@"এখানে প্রযোজ্য নয় !!!"];
        return;
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Warning!!!" message:@"ভিডিও দেখার সময় ইন্টারনেট চালু রাখুন!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"DENY" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        NSLog(@"DENID");
        
    }];
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"ACCEPT" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        webViewMain.scalesPageToFit = NO;
        customLoaderView.alpha = 1.0f;
        [customLoaderView startAnimation];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [self playVideoWithId:self.videoId];
        });
    }];
    [alert addAction:okAction];
    [alert addAction:otherAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

- (IBAction)actionQuestionAnswers:(id)sender
{
    if (buttonFaq.alpha == 0.7f) {
        [self.view makeToast:@"এখানে প্রযোজ্য নয় !!!"];
        return;
    }
    
    customLoaderView.alpha = 1.0f;
    [customLoaderView startAnimation];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSString    *lokkhonioPath = [[AppSupporter sharedInstance] getFaqFilePath:self.fileName];
        NSURL *targetURL = [NSURL fileURLWithPath:lokkhonioPath];
        NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        [webViewMain loadRequest:request];
        webViewMain.scalesPageToFit = YES;
    });
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    //NSLog(@"webViewDidStartLoad");
//    NSString *padding = @"document.body.style.margin='0';document.body.style.padding = '0'";
//    [webView stringByEvaluatingJavaScriptFromString:padding];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //NSLog(@"webViewDidFinishLoad");
    customLoaderView.alpha = 0.0f;
    [customLoaderView stopAnimation];
    
    //webViewMain.scrollView.contentInset = UIEdgeInsetsMake(-6, -2, -2, -8);
    
    CGSize  contentSize = webViewMain.scrollView.contentSize;
    CGFloat webHeight   = CGRectGetHeight(webViewMain.frame);
    if (contentSize.height < webHeight ) {
        CGFloat d = (webHeight - contentSize.height) / 2;
        [webViewMain.scrollView setContentOffset:CGPointMake(0, -d) animated:NO];
    }else{
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //NSLog(@"didFailLoadWithError");
    customLoaderView.alpha = 0.0f;
    [customLoaderView stopAnimation];
}

@end
