//
//  CommonListViewCell.m
//  ObjectiveCLab/Common/MVC/Views
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import "CommonListViewCell.h"

@implementation CommonListViewCell

+ (nullable CommonListViewCell *)commonListViewCellNibOwner:(id)owner {
    CommonListViewCell *commonListViewCell = nil;
    NSString *selectNibName = NSStringFromClass([CommonListViewCell class]);
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
        commonListViewCell = (CommonListViewCell *)nibViews.firstObject;
    }
    return commonListViewCell;
}

+ (CommonListViewCell *)settingCommonListViewCell:(CommonListViewCell *)commonListViewCell withView:(UIView *) selfView {
    if (!commonListViewCell){
        commonListViewCell = [CommonListViewCell commonListViewCellNibOwner:self];
    }
    if (![selfView.subviews containsObject:commonListViewCell]) {
        commonListViewCell.frame = selfView.frame;
        [selfView addSubview:commonListViewCell];
    }
    return commonListViewCell;
}

@end

@implementation UITableViewCell (Common)

@end

