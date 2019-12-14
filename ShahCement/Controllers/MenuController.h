//
//  MenuController.h
//  ShahCement
//
//  Created by Huq Majharul on 2018/02/14.
//  Copyright © 2018 SmartMux Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuController : UIViewController
{
    IBOutlet    UITableView     *tableViewList;
    IBOutlet    UIView          *viewTableViewHeader;
    IBOutlet    UILabel         *labelFooter;
}

@end

@interface MenuCell : UITableViewCell
{
}

@property (nonatomic,weak) IBOutlet  UIImageView  *imageViewThumb;
@property (nonatomic,weak) IBOutlet  UILabel      *labelTitle;

@end
