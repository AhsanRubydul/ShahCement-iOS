//
//  CustomLoader.m
//  ShahCement
//
//  Created by Majharul Huq on 2019/10/25.
//  Copyright © 2019 SmartMux Limited. All rights reserved.
//

#import "CustomLoader.h"

@implementation CustomLoader

- (void)commonInit {
    
    self.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.3f];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    NSString* className = NSStringFromClass([self class]);
    [[NSBundle bundleForClass:[self class]] loadNibNamed:className owner:self options:nil];
    
    self.contentView.frame = self.bounds;
    [self addSubview:self.contentView];
    
    imageView.animationImages = [[NSArray alloc] initWithObjects:
                                 [UIImage imageNamed:@"loader_shahcement_00.png"],
                                 [UIImage imageNamed:@"loader_shahcement_01.png"],
                                 [UIImage imageNamed:@"loader_shahcement_02.png"],
                                 [UIImage imageNamed:@"loader_shahcement_03.png"],
                                 [UIImage imageNamed:@"loader_shahcement_04.png"],
                                 [UIImage imageNamed:@"loader_shahcement_05.png"],
                                 [UIImage imageNamed:@"loader_shahcement_06.png"],
                                 [UIImage imageNamed:@"loader_shahcement_07.png"],
                                 [UIImage imageNamed:@"loader_shahcement_08.png"],
                                 [UIImage imageNamed:@"loader_shahcement_09.png"],
                                 [UIImage imageNamed:@"loader_shahcement_10.png"],
                                 [UIImage imageNamed:@"loader_shahcement_11.png"],
                                 [UIImage imageNamed:@"loader_shahcement_12.png"],
                                 [UIImage imageNamed:@"loader_shahcement_13.png"],
                                 [UIImage imageNamed:@"loader_shahcement_14.png"],
                                 [UIImage imageNamed:@"loader_shahcement_15.png"],
                                 [UIImage imageNamed:@"loader_shahcement_16.png"],
                                 [UIImage imageNamed:@"loader_shahcement_17.png"],
                                 [UIImage imageNamed:@"loader_shahcement_18.png"],
                                 [UIImage imageNamed:@"loader_shahcement_19.png"],
                                 [UIImage imageNamed:@"loader_shahcement_20.png"],
                                 [UIImage imageNamed:@"loader_shahcement_21.png"],
                                 [UIImage imageNamed:@"loader_shahcement_22.png"],
                                 [UIImage imageNamed:@"loader_shahcement_23.png"],
                                 [UIImage imageNamed:@"loader_shahcement_24.png"],
                                 [UIImage imageNamed:@"loader_shahcement_25.png"],
                                 [UIImage imageNamed:@"loader_shahcement_26.png"],
                                 [UIImage imageNamed:@"loader_shahcement_27.png"],
                                 [UIImage imageNamed:@"loader_shahcement_28.png"],
                                 [UIImage imageNamed:@"loader_shahcement_29.png"],
                                 [UIImage imageNamed:@"loader_shahcement_30.png"],
                                 [UIImage imageNamed:@"loader_shahcement_31.png"],
                                 [UIImage imageNamed:@"loader_shahcement_32.png"],
                                 nil];
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)startAnimation
{
    if(![imageView isAnimating]){
        [imageView startAnimating];
    }
}

- (void)stopAnimation
{
    if([imageView isAnimating]){
        [imageView stopAnimating];
    }
}

@end
