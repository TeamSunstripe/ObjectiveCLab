//
//  CommonButton.m
//  ObjectiveCLab/Common/MVC/Views
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import "CommonButton.h"

@implementation CommonButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self designButton];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self designButton];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//影付きのボタン
- (void)designButton {
    self.layer.shadowOffset = CGSizeMake(1, 1);
    self.layer.shadowColor = UIColor.grayColor.CGColor;
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 1.0;
}

// 押された時の動作
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self touchStartAnimation];
}

// 押され終わった時の動作
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    [self touchEndAnimation];
}

// 動作が中断された時の動作
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    [self touchEndAnimation];
}

//ボタンが押された時のアニメーション
- (void)touchStartAnimation {
    [UIView beginAnimations:@"touchStartAnimation" context:nil];
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.transform = CGAffineTransformMakeScale(0.8, 0.8);
        self.alpha = 0.8;
    } completion:^(BOOL finished) {
        
    }];
    [UIView commitAnimations];
}

//ボタンから手が離れた時のアニメーション
- (void)touchEndAnimation {
    [UIView beginAnimations:@"touchEndAnimation" context:nil];
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.transform = CGAffineTransformMakeScale(1.0 , 1.0);
        self.alpha = 1.0;
    } completion:^(BOOL finished) {
        
    }];
    [UIView commitAnimations];
}

+ (nullable CommonButton *)commonButtonNibOwner:(id)owner {
    CommonButton *commonButton = nil;
    NSString *selectNibName = NSStringFromClass([CommonButton class]);
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
        commonButton = (CommonButton *)nibViews.firstObject;
    }
    return commonButton;
}

+ (CommonButton *)settingCommonButton:(CommonButton *)commonButton withView:(UIView *) selfView {
    if (!commonButton){
        commonButton = [CommonButton commonButtonNibOwner:self];
    }
    if (![selfView.subviews containsObject:commonButton]) {
        commonButton.frame = selfView.frame;
        [selfView addSubview:commonButton];
    }
    return commonButton;
}

@end

@implementation UIButton(Common)

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
