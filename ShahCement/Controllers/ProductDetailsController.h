//
//  ProductDetailsController.h
//  ShahCement
//
//  Created by Huq Majharul on 2/15/18.
//  Copyright © 2018 SmartMux Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ProductDetailsController : UIViewController
{
    IBOutlet    UIWebView                   *webViewMain;
    IBOutlet    UIView                      *viewButtonBar;
    IBOutlet    UIButton                    *buttonBack;
    
    IBOutlet    UIButton                    *buttonLokkhonio;
    IBOutlet    UIButton                    *buttonVideo;
    IBOutlet    UIButton                    *buttonFaq;
    IBOutlet    UIButton                    *buttonAudio;
    
    IBOutlet    UIImageView                 *imageViewTopBar;
    
    IBOutlet NSLayoutConstraint *topButtonWidth;
    IBOutlet NSLayoutConstraint *bottomImageViewHeightConstraint;
}

@property(nonatomic,strong) NSString *fileName;
@property(nonatomic,strong) NSString *videoId;
@property(nonatomic,strong) NSString *thumbnail;
@property(nonatomic,strong) AVAudioPlayer *audioPlayer;

@end
