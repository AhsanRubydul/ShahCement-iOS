//
//  MenuController.m
//  ShahCement
//
//  Created by Huq Majharul on 2018/02/14.
//  Copyright © 2018 SmartMux Limited. All rights reserved.
//

#import "MenuController.h"
#import "DataSource.h"
#import <MessageUI/MessageUI.h>
#import <UIKit/UIKit.h>

typedef enum
{
    MENU_VIDEO = 0,
    MENU_JOGAJOG
} MenuType;


@interface MenuController ()<MFMailComposeViewControllerDelegate>

@end

@implementation MenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    tableViewList.backgroundColor   = [UIColor clearColor];
    tableViewList.separatorColor    = [UIColor clearColor];
    
    self.view.backgroundColor = [UIColor redColor];
    CGFloat gap = (CGRectGetHeight(tableViewList.frame) - 56.0f * [DataSource menu].count) / 3;
    tableViewList.contentInset = UIEdgeInsetsMake(gap, 0, -gap, 0);
    
    NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
    labelFooter.text = [NSString stringWithFormat:@"v.%@",version];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return [DataSource menu].count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56.0f;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuCell *cell = [theTableView dequeueReusableCellWithIdentifier:@"MenuCell"];
    
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.labelTitle.text = [[[[DataSource menu] objectAtIndex:indexPath.row] valueForKey:@"title"] uppercaseString];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case MENU_VIDEO:{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Warning!!!" message:@"ভিডিও দেখার সময় ইন্টারনেট চালু রাখুন!" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"DENY" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                
            }];
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"ACCEPT" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                [self performSegueWithIdentifier:@"VideoListController" sender:self];
            }];
            [alert addAction:okAction];
            [alert addAction:otherAction];
            [self presentViewController:alert animated:YES completion:nil];
        }break;
        case MENU_JOGAJOG:{
            if ([MFMailComposeViewController canSendMail]) {
                MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc] init];
                mailVC.mailComposeDelegate = self;
                [mailVC setSubject:@"Subject text here..."];
                [mailVC setMessageBody:@"Body of the content here..." isHTML:NO];
                [mailVC setToRecipients:@[@"shahcement@abulkhairgroup.com"]];
                [self presentViewController:mailVC animated:YES completion:nil];
            } else {
                //This device cannot send email
            }
        }break;
        default:
            break;
    }
}

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

@end

@implementation MenuCell

@synthesize imageViewThumb;
@synthesize labelTitle;

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    self.backgroundColor                   = [UIColor clearColor];
    self.contentView.backgroundColor       = [UIColor clearColor];
    self.selectionStyle                    = UITableViewCellSelectionStyleNone;
    
    labelTitle.backgroundColor  = [UIColor clearColor];
    labelTitle.font = [UIFont fontWithName:APP_ENGLISH_SEMI_BOLD_FONT size:18.0f];
    labelTitle.textColor = [UIColor whiteColor];
}

@end
