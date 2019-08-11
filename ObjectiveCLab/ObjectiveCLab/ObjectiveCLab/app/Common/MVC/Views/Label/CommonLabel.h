//
//  CommonLabel.h
//  ObjectiveCLab/Common/MVC/Views
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonLabel : UILabel

+ (nullable CommonLabel *)commonLabelNibOwner:(id)owner;

+ (CommonLabel *)settingCommonLabel:(CommonLabel *)commonView withView:(UIView *) selfView;

@end

@interface UILabel (Common)

@end
