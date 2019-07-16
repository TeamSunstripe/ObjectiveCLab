//
//  CommonImageView.h
//  ObjectiveCLab/Common/MVC/Views
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonImageView : UIImageView

+ (nullable CommonImageView *)commonImageViewNibOwner:(id)owner;
+ (CommonImageView *)settingCommonImageView:(CommonImageView *)commonImageView withView:(UIView *) selfView;

@end

@interface UIImageView (Common)

@end
