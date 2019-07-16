//
//  CommonListView.h
//  ObjectiveCLab/Common/MVC/Views
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonListView : UITableView

+ (nullable CommonListView *)commonListViewNibOwner:(id)owner;
+ (CommonListView *)settingCommonListView:(CommonListView *)commonListView withView:(UIView *) selfView;

@end

@interface UITableView (Common)

@end
