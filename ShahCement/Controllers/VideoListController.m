//
//  VideoListController.m
//  ShahCement
//
//  Created by Huq Majharul on 3/12/18.
//  Copyright © 2018 SmartMux Limited. All rights reserved.
//

#import "VideoListController.h"
#import "DataSource.h"
#import "VideoPlayerController.h"
#import <SDWebImage/SDWebImage.h>
#import "AppSupporter.h"

@interface VideoListController ()
@property (weak, nonatomic) IBOutlet UITableView    *tableViewMain;
@end

@implementation VideoListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableViewMain.backgroundColor   = APP_VIEW_BACKGROUND_COLOR;
    self.tableViewMain.tableFooterView   = [[UIView alloc] initWithFrame : CGRectZero];
    self.tableViewMain.separatorStyle    = UITableViewCellSeparatorStyleNone;
    
    buttonBack.tintColor = APP_THEME_COLOR;
    buttonBack.imageView.image = [buttonBack.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [self adjustBottomBar];
    
    BOOL iPhoneX = [[AppSupporter sharedInstance] isIphoneXDevices];
    if(iPhoneX){
        CGRect frame = imageViewTopBar.frame;
        frame.origin.y += IPHONEX_EXTRA_HEIGHT;
        imageViewTopBar.frame = frame;
        
        frame = self.tableViewMain.frame;
        frame.origin.y += IPHONEX_EXTRA_HEIGHT;
        frame.size.height -= IPHONEX_EXTRA_HEIGHT;
        self.tableViewMain.frame = frame;
        
        frame = buttonBack.frame;
        frame.origin.y = imageViewTopBar.frame.origin.y + (imageViewTopBar.frame.size.height - frame.size.height) / 2;
        buttonBack.frame = frame;
    }
    
    if (IS_OUTLINE_ON) {
        [imageViewTopBar.layer setBorderColor:[UIColor yellowColor].CGColor];
        [imageViewTopBar.layer setBorderWidth:2.0f];
        
        [self.tableViewMain.layer setBorderColor:[UIColor blueColor].CGColor];
        [self.tableViewMain.layer setBorderWidth:2.0f];
        
        [imageViewBottomBar.layer setBorderColor:[UIColor yellowColor].CGColor];
        [imageViewBottomBar.layer setBorderWidth:2.0f];
    }
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

- (IBAction)actionBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 210.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return [DataSource videoListIds].count;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    VideoCell *cell = [theTableView dequeueReusableCellWithIdentifier:@"VideoCell"];
    
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"VideoCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.tag = indexPath.row;
    
    //cell.imageViewThumb.image   = [UIImage imageNamed:[dictionary valueForKey:@"image"]];
    [cell.imageViewThumb sd_setImageWithURL:[NSURL URLWithString:[[DataSource videoListThumbnails] objectAtIndex:indexPath.row]]
                 placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    cell.labelTitle.text        = [[DataSource videoListTitles] objectAtIndex:indexPath.row];
    cell.labelDuration.text     = [[DataSource videoListDurations] objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *videoId = [[DataSource videoListIds] objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"VideoPlayerController" sender:videoId];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"VideoPlayerController"]) {
        NSLog(@"%@",segue.identifier);
        VideoPlayerController *controller = segue.destinationViewController;
        NSString *videoId = sender;
        controller.videoId = videoId;
    }
}

@end

@implementation VideoCell

@synthesize viewContainer;
@synthesize imageViewThumb;
@synthesize labelTitle;
@synthesize labelDuration;
@synthesize imageViewDuration;

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.backgroundColor                    = [UIColor clearColor];
    self.contentView.backgroundColor        = [UIColor clearColor];
    self.selectionStyle                     = UITableViewCellSelectionStyleNone;
    
    self.viewContainer.backgroundColor      = [UIColor colorWithWhite:1.0f alpha:0.8f];
    
    self.imageViewThumb.backgroundColor     = [UIColor whiteColor];
    self.imageViewThumb.layer.masksToBounds = YES;
    
    labelTitle.backgroundColor = [UIColor clearColor];
    labelTitle.font = [UIFont fontWithName:APP_ENGLISH_SEMI_BOLD_FONT size:12.0f];
    labelTitle.textColor = [UIColor blackColor];
    
    labelDuration.backgroundColor = [UIColor clearColor];
    labelDuration.font = [UIFont fontWithName:APP_ENGLISH_REGULAR_FONT size:11.0f];
    labelDuration.textColor = [UIColor darkGrayColor];
}

@end

