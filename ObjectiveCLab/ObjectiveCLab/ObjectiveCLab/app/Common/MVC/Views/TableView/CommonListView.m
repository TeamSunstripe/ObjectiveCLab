//
//  CommonListView.m
//  ObjectiveCLab/Common/MVC/Views
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import "CommonListView.h"

@implementation CommonListView

+ (nullable CommonListView *)commonListViewNibOwner:(id)owner {
    CommonListView *commonListView = nil;
    NSString *selectNibName = NSStringFromClass([CommonListView class]);
    NSString *selectNibFile = [[NSBundle mainBundle] pathForResource:selectNibName ofType:@"nib"];
    if(!selectNibFile )
    {
        NSLog(@"------- not selectNibName \n\n%@\n\n------",selectNibName);
        return nil;
    }
    
    // NSBundleから読み込むほうが簡単
    NSLog(@"%@", [[NSBundle mainBundle] loadNibNamed:selectNibName owner:self options:nil]);
    
    UINib *nibFile =[UINib nibWithNibName:selectNibName bundle:[NSBundle mainBundle]];
    NSArray *nibViews = [nibFile instantiateWithOwner:self options:nil];
    if (nibViews) {
        commonListView = (CommonListView *)nibViews.firstObject;
    }
    return commonListView;
}

+ (CommonListView *)settingCommonListView:(CommonListView *)commonListView withView:(UIView *) selfView {
    if (!commonListView){
        commonListView = [CommonListView commonListViewNibOwner:self];
    }
    if (![selfView.subviews containsObject:commonListView]) {
        commonListView.frame = selfView.frame;
        [selfView addSubview:commonListView];
    }
    return commonListView;
}

@end

@implementation UITableView (Common)

@end
