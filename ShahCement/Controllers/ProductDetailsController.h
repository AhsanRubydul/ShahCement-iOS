//
//  ProductDetailsController.h
//  ShahCement
//
//  Created by Huq Majharul on 2/15/18.
//  Copyright © 2018 SmartMux Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailsController : UIViewController
{
    IBOutlet    UIWebView                   *webViewMain;
    IBOutlet    UIView                      *viewButtonBar;
    IBOutlet    UIButton                    *buttonBack;
    
    IBOutlet    UIButton                    *buttonLokkhonio;
    IBOutlet    UIButton                    *buttonVideo;
    IBOutlet    UIButton                    *buttonFaq;
    
    IBOutlet    UIImageView                 *imageViewTopBar;
    IBOutlet    UIImageView                 *imageViewBottomBar;
}

@property(nonatomic,strong) NSString *fileName;
@property(nonatomic,strong) NSString *videoId;

@end
