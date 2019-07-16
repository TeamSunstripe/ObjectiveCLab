//
//  CommonListViewCell.h
//  ObjectiveCLab/Common/MVC/Views
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonListViewCell : UITableViewCell

+ (nullable CommonListViewCell *)commonListViewCellNibOwner:(id)owner;
+ (CommonListViewCell *)settingCommonListViewCell:(CommonListViewCell *)commonListViewCell withView:(UIView *) selfView;

@end

@interface UITableViewCell (Common)

@end
