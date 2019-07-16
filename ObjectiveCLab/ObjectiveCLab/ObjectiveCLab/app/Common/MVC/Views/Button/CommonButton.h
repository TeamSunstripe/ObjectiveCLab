//
//  CommonButton.h
//  ObjectiveCLab/Common/MVC/Views
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonButton : UIButton

+ (nullable CommonButton *)commonButtonNibOwner:(id)owner;
+ (CommonButton *)settingCommonButton:(CommonButton *)commonButton withView:(UIView *) selfView;

@end

@interface UIButton(Common)

@end
