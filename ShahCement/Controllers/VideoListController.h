//
//  VideoListController.h
//  ShahCement
//
//  Created by Huq Majharul on 3/12/18.
//  Copyright © 2018 SmartMux Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoListController : UIViewController
{
    IBOutlet    UIButton        *buttonBack;
    IBOutlet    UIImageView     *imageViewTopBar;
    __weak IBOutlet NSLayoutConstraint *bottomImageViewHeightConstraint;
}
@end

@interface VideoCell : UITableViewCell
{
}

@property (nonatomic, strong) IBOutlet  UIView         *viewContainer;
@property (nonatomic, strong) IBOutlet  UIImageView    *imageViewThumb;
@property (nonatomic, strong) IBOutlet  UILabel        *labelTitle;
@property (nonatomic, strong) IBOutlet  UILabel        *labelDuration;
@property (nonatomic, strong) IBOutlet  UIImageView    *imageViewDuration;
@end
