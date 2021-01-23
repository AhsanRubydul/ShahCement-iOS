//
//  ProductListController.m
//  ShahCement
//
//  Created by Huq Majharul on 2018/02/14.
//  Copyright © 2018 SmartMux Limited. All rights reserved.
//

#import "ProductListController.h"
#import "DataSource.h"
#import "UIViewController+MMDrawerController.h"
#import "ProductDetailsController.h"
#import "AppSupporter.h"
#import "FLAnimatedImage.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <MessageUI/MessageUI.h>
#import <SafariServices/SafariServices.h>
#import "VideoPlayerController.h"

#define SPACEGAP   8.0f
#define TOTAL_COL  2

@interface ProductListController ()<AVAudioPlayerDelegate,MFMailComposeViewControllerDelegate>
{
    CGFloat         ITEM_WIDTH;
    CGFloat         ITEM_HEIGHT;
    NSArray         *arrProductList;
    AVAudioPlayer   *_audioPlayer;
}

@end

@implementation ProductListController

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultSent:
            //Email sent
            break;
        case MFMailComposeResultSaved:
            //Email saved
            break;
        case MFMailComposeResultCancelled:
            //Handle cancelling of the email
            break;
        case MFMailComposeResultFailed:
            //Handle failure to send.
            break;
        default:
            //A failure occurred while completing the email
            break;
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)actionForum:(id)sender {
   
    SFSafariViewController *svc = [[SFSafariViewController alloc] initWithURL: [NSURL URLWithString:@"https://www.nirmaneami.shahcement.com"]];
    [self presentViewController:svc animated:YES completion:nil];
    //[self performSegueWithIdentifier:@"VideoPlayerController" sender:@"https://www.nirmaneami.shahcement.com"];
    
}


- (IBAction)actionProduct:(UIButton *)sender {
    [self performSegueWithIdentifier:@"VideoPlayerController" sender:@"https://www.shahcement.com/cem-ii/"];
}

- (IBAction)actionVideo:(UIButton *)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Warning!!!" message:@"ভিডিও দেখার সময় ইন্টারনেট চালু রাখুন!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"DENY" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
    }];
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"ACCEPT" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        [self performSegueWithIdentifier:@"VideoListController" sender:self];
    }];
    [alert addAction:okAction];
    [alert addAction:otherAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

- (IBAction)actionPhone:(id)sender {
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:[NSURL URLWithString: @"tel:16281"] options:@{} completionHandler:nil];
    
}


- (IBAction)actionWebsite:(id)sender {
    
    [self performSegueWithIdentifier:@"VideoPlayerController" sender:@"https://www.shahcement.com/"];
}


- (IBAction)actionEmail:(id)sender {
    
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc] init];
        mailVC.mailComposeDelegate = self;
        [mailVC setSubject:@"Subject text here..."];
        [mailVC setMessageBody:@"Body of the content here..." isHTML:NO];
        [mailVC setToRecipients:@[@"shahcement@abulkhairgroup.com"]];
        [self presentViewController:mailVC animated:YES completion:nil];
    } else {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Warning!!!" message:@"আপনার আইফোন এর ইমেইল সেটিংস থেকে একটি অ্যাকাউন্ট সংযুক্ত করুণ!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
            
        }];
    
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}



- (IBAction)actionToggle:(UIButton *)sender {
    
    [_moreView setHidden:!_moreView.isHidden];
    [_buttonToggle setImage: (_moreView.isHidden ? [UIImage imageNamed:@"More.png"] : [UIImage imageNamed:@"Home.png"]) forState:UIControlStateNormal];
}







- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    _imageViewGif.backgroundColor = APP_THEME_COLOR;
    //self.view.backgroundColor = [UIColor whiteColor];
    
    [self adjustBottomBar];
    
    BOOL iPhoneX = [[AppSupporter sharedInstance] isIphoneXDevices];
    if(iPhoneX){
        CGRect frame = imageViewTopBar.frame;
        frame.origin.y += IPHONEX_EXTRA_HEIGHT;
        imageViewTopBar.frame = frame;
        
        frame = imageViewSubTopBar.frame;
        frame.origin.y += IPHONEX_EXTRA_HEIGHT;
        imageViewSubTopBar.frame = frame;
        
        frame = self.collectionView.frame;
        frame.origin.y += IPHONEX_EXTRA_HEIGHT;
        frame.size.height -= IPHONEX_EXTRA_HEIGHT;
        self.collectionView.frame = frame;
        
        frame = buttonMenu.frame;
        frame.origin.y = imageViewTopBar.frame.origin.y + (imageViewTopBar.frame.size.height - frame.size.height) / 2;
        buttonMenu.frame = frame;
    }
    
    if (IS_OUTLINE_ON) {
        [imageViewTopBar.layer setBorderColor:[UIColor yellowColor].CGColor];
        [imageViewTopBar.layer setBorderWidth:2.0f];
        
        [imageViewSubTopBar.layer setBorderColor:[UIColor greenColor].CGColor];
        [imageViewSubTopBar.layer setBorderWidth:2.0f];
        
        [self.collectionView.layer setBorderColor:[UIColor blueColor].CGColor];
        [self.collectionView.layer setBorderWidth:2.0f];
        
        [imageViewBottomBar.layer setBorderColor:[UIColor yellowColor].CGColor];
        [imageViewBottomBar.layer setBorderWidth:2.0f];
    }
    
    /*
    CGRect gifFrame = _imageViewGif.frame;
    gifFrame.size.width = gifFrame.size.width * 1.2;
    gifFrame.size.height = gifFrame.size.height * 1.2;
    gifFrame.origin.x = (CGRectGetWidth(self.view.frame) - gifFrame.size.width) / 2 ;
    gifFrame.origin.y = (CGRectGetHeight(self.view.frame) - gifFrame.size.height) / 2 ;
    _imageViewGif.frame = gifFrame;
    */
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"splash" ofType:@"gif"];
    NSData   *data = [NSData dataWithContentsOfFile:path];
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:data];
    _imageViewGif.animatedImage = image;
    
    
    
    [_imageViewGif setLoopCompletionBlock:^(NSUInteger i) {
        [UIView animateWithDuration: AVOID_ANIMATION ? 0.0 : 1.0
                         animations:^{
                             _imageViewGif.alpha = 0.0;
                         }
                         completion:^(BOOL finished){
                             [_imageViewGif removeFromSuperview];
                             [UIView animateWithDuration:AVOID_ANIMATION ? 0.0 : 2.0
                                              animations:^{
                                                  imageViewSplash.alpha = 0.0;
                                              }
                                              completion:^(BOOL finished){
                                                  [imageViewSplash removeFromSuperview];
                                              }];
                         }];
    }];
    
    
   // self.view.backgroundColor = [UIColor whiteColor];
    
    ITEM_WIDTH                      = (CGRectGetWidth(self.view.frame) - (TOTAL_COL + 1) * SPACEGAP) / TOTAL_COL;
    ITEM_HEIGHT                     = ITEM_WIDTH;

    self.collectionLayout.sectionInset                = UIEdgeInsetsMake(SPACEGAP,SPACEGAP,SPACEGAP,SPACEGAP);
    self.collectionLayout.itemSize                    = CGSizeMake(ITEM_WIDTH, ITEM_HEIGHT);
    self.collectionLayout.minimumInteritemSpacing     = SPACEGAP;
    self.collectionLayout.minimumLineSpacing          = SPACEGAP;
    self.collectionView.backgroundColor = APP_VIEW_BACKGROUND_COLOR;
    
    arrProductList = [DataSource productList];// [[AppSupporter sharedInstance] getProductThumbs];
}

- (void)adjustBottomBar
{
    CGRect screenSize = [UIScreen mainScreen].bounds;
    CGSize size = [UIImage imageNamed:@"bottombar"].size;
    
    CGRect frame = imageViewBottomBar.frame;
    frame.size.width = screenSize.size.width;
    frame.size.height = size.height * screenSize.size.width / size.width;
    imageViewBottomBar.frame = frame;
}

#pragma mark Collection Layout
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return arrProductList.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ProductCell     *cell   = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProductCell" forIndexPath:indexPath];
    NSString *imageName = [[arrProductList objectAtIndex:indexPath.row] valueForKey:@"name"];
    NSString        *path   = [[AppSupporter sharedInstance] getProductThumbPath];
    cell.imageViewThumb.image = [UIImage imageWithContentsOfFile:[path stringByAppendingPathComponent:imageName]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"ProductDetailsController" sender:indexPath];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(nullable id)sender
{
    
    if([segue.identifier isEqualToString:@"VideoPlayerController"]) {
        
        NSLog(@"%@",segue.identifier);
        VideoPlayerController *controller = segue.destinationViewController;
        NSString *videoId = sender;
        controller.videoId = videoId;
        controller.type = @"1";
    }
    
    if ([segue.destinationViewController isKindOfClass:[ProductDetailsController class]]) {
        
        NSIndexPath     *indexPath = sender;
        
        NSString *fileName = [[arrProductList objectAtIndex:indexPath.row] valueForKey:@"name"];
        
        NSArray *arr = [[[fileName componentsSeparatedByString:@"-"] objectAtIndex:1] componentsSeparatedByString:@"."];
        
        NSString *videoId = [[arrProductList objectAtIndex:indexPath.row] valueForKey:@"video_id"];
        
        ProductDetailsController *controller = segue.destinationViewController;
        controller.fileName = [arr objectAtIndex:0];
        controller.videoId = videoId;
    }
    
  

    NSLog(@"%@",segue.destinationViewController);
}

- (IBAction)actionMenu:(id)sender
{
    //[self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

@end

@implementation ProductCell

@synthesize imageViewThumb;

- (void)layoutSubviews
{
    [super layoutSubviews];
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    self.backgroundColor                    = [UIColor clearColor];
    self.contentView.backgroundColor        = [UIColor clearColor];
    
    imageViewThumb.backgroundColor = APP_NAV_BACKGROUND_COLOR;
    
}

@end
