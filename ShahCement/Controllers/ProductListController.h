//
//  ProductListController.h
//  ShahCement
//
//  Created by Huq Majharul on 2018/02/14.
//  Copyright © 2018 SmartMux Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLAnimatedImageView.h"

@interface ProductListController : UIViewController
{
    IBOutlet    UIImageView         *imageViewTopBar;
    IBOutlet    UIImageView         *imageViewSubTopBar;
    IBOutlet    UIImageView         *imageViewBottomBar;
    IBOutlet    UIImageView         *imageViewSplash;
    IBOutlet    UIButton            *buttonMenu;
    
}
@property (weak, nonatomic) IBOutlet UIView *moreView;


@property (weak, nonatomic) IBOutlet UIButton *buttonToggle;

@property (nonatomic, weak) IBOutlet FLAnimatedImageView         *imageViewGif;
@property (nonatomic, weak) IBOutlet UICollectionView            *collectionView;
@property (nonatomic, weak) IBOutlet UICollectionViewFlowLayout  *collectionLayout;
@end

@interface ProductCell : UICollectionViewCell
{
}

@property (nonatomic, strong) IBOutlet  UIImageView    *imageViewThumb;

@end
