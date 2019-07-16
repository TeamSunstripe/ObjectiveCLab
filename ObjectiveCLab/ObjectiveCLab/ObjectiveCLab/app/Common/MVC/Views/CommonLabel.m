//
//  CommonLabel.m
//  ObjectiveCLab/Common/MVC/Views
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import "CommonLabel.h"

@implementation CommonLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (nullable CommonLabel *)commonLabelNibOwner:(id)owner {
    CommonLabel *commonLabel = nil;
    NSString *selectNibName = NSStringFromClass([CommonLabel class]);
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
        commonLabel = (CommonLabel *)nibViews.firstObject;
    }
    return commonLabel;
}

+ (CommonLabel *)settingCommonLabel:(CommonLabel *)commonLabel withView:(UIView *) selfView {
    if (!commonLabel){
        commonLabel = [CommonLabel commonLabelNibOwner:self];
    }
    if (![selfView.subviews containsObject:commonLabel]) {
        commonLabel.frame = selfView.frame;
        [selfView addSubview:commonLabel];
    }
    return commonLabel;
}

@end

@implementation UILabel (Common)


@end
