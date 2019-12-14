//
//  CustomLoader.h
//  ShahCement
//
//  Created by Majharul Huq on 2019/10/25.
//  Copyright © 2019 SmartMux Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomLoader : UIView
{
    IBOutlet UIImageView    *imageView;
}

@property (strong, nonatomic) IBOutlet UIView *contentView;

- (void)startAnimation;
- (void)stopAnimation;

@end

NS_ASSUME_NONNULL_END
