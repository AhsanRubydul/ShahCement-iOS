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

@interface ProductListController ()<MFMailComposeViewControllerDelegate> {
    NSArray         *arrProductList;
}

@end

@implementation ProductListController

#pragma mark life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        
    _imageViewGif.backgroundColor = APP_THEME_COLOR;
    
    [self setupIPhoneXRelatedCases];
    [self setupSplashSyncedAnimation];
    
    [self setupBottomImage];
    [self setupCollectionView];
}

#pragma mark setup helper
- (void)setupIPhoneXRelatedCases {
    // TODO: Recheck that, are these really necessary ?
    BOOL iPhoneX = [[AppSupporter sharedInstance] isIphoneXDevices];
    if(iPhoneX){
        CGRect frame = imageViewTopBar.frame;
        frame.origin.y += IPHONEX_EXTRA_HEIGHT;
        imageViewTopBar.frame = frame;
        
        frame = imageViewSubTopBar.frame;
        frame.origin.y += IPHONEX_EXTRA_HEIGHT;
        imageViewSubTopBar.frame = frame;
        
        frame = buttonMenu.frame;
        frame.origin.y = imageViewTopBar.frame.origin.y + (imageViewTopBar.frame.size.height - frame.size.height) / 2;
        buttonMenu.frame = frame;
    }
}

- (void)setupSplashSyncedAnimation {
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
}

- (void)setupBottomImage {
    CGRect screenSize = [UIScreen mainScreen].bounds;
    CGSize size = [UIImage imageNamed:@"bottombar"].size;
    
    CGFloat height = size.height * screenSize.size.width / size.width;
    _bottomImageViewHeightConstraint.constant = height;
    
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
}

- (void)setupCollectionView {
    CGFloat itemWidth = (CGRectGetWidth(self.view.frame) - (TOTAL_COL + 1) * SPACEGAP) / TOTAL_COL;
    CGFloat itemHeight = itemWidth;

    self.collectionLayout.sectionInset = UIEdgeInsetsMake(SPACEGAP,SPACEGAP,SPACEGAP,SPACEGAP);
    self.collectionLayout.itemSize = CGSizeMake(itemWidth, itemHeight);
    self.collectionLayout.minimumInteritemSpacing = SPACEGAP;
    self.collectionLayout.minimumLineSpacing = SPACEGAP;
    _mViewCollectionView.backgroundColor = APP_VIEW_BACKGROUND_COLOR;
    
    arrProductList = [DataSource productList];// [[AppSupporter sharedInstance] getProductThumbs];
    [_mViewCollectionView reloadData];
}

#pragma mark Collection datasource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return arrProductList.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductCell     *cell   = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProductCell" forIndexPath:indexPath];
    NSString *imageName = [[arrProductList objectAtIndex:indexPath.row] valueForKey:@"name"];
    NSString        *path   = [[AppSupporter sharedInstance] getProductThumbPath];
    cell.imageViewThumb.image = [UIImage imageWithContentsOfFile:[path stringByAppendingPathComponent:imageName]];
    return cell;
}

#pragma mark Collectionview delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"ProductDetailsController" sender:indexPath];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(nullable id) sender {
    
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
        controller.thumbnail = [[arrProductList objectAtIndex:indexPath.row] valueForKey:@"name"];
    }
    
  

    NSLog(@"%@",segue.destinationViewController);
}

#pragma mark IBActions
- (IBAction)actionMenu:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
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

- (IBAction)actionSecondWebsite:(id)sender {
    [self performSegueWithIdentifier:@"VideoPlayerController" sender:@"https://houseful-offer-2021.shahcement.com"];
}

- (IBAction)actionWhatsAppPhone:(id)sender {
    NSString *urlString = @"whatsapp://send?phone=+8801958075553";
    NSURL *url = [NSURL URLWithString:urlString];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
        if (!success) {
            NSURL *storeLinkURL = [NSURL URLWithString:@"https://apps.apple.com/us/app/whatsapp-messenger/id310633997"];
            [[UIApplication sharedApplication]openURL:storeLinkURL options:@{} completionHandler:nil];
        }
    }];
}

#pragma mark MFMailCompose Delegates
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end

@implementation ProductCell

@synthesize imageViewThumb;


-(void)awakeFromNib
{
    [super awakeFromNib];
    
    self.backgroundColor                    = [UIColor clearColor];
    self.contentView.backgroundColor        = [UIColor clearColor];
    
    imageViewThumb.backgroundColor = APP_NAV_BACKGROUND_COLOR;
    
}

@end
