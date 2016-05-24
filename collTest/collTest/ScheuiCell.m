//
//  ScheuiCell.m
//  doctor
//
//  Created by xhr on 15/7/20.
//  Copyright (c) 2015年 Haoranxu. All rights reserved.
//

#import "ScheuiCell.h"
#define App_Frame_Width  [[UIScreen mainScreen] bounds].size.width
@interface ScheuiCell()
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *bc;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *c_w;
@property (weak, nonatomic) IBOutlet UIView *showView;

@end
@implementation ScheuiCell

- (void)awakeFromNib {
    NSLog(@"%f--%f",self.frame.size.width,
          App_Frame_Width/7/4);
    self.showView.layer.borderColor = [UIColor grayColor].CGColor;
    self.showView.layer.borderWidth = 1;
    
    [self.showView.layer setMasksToBounds:YES];
        [self.showView.layer setCornerRadius:App_Frame_Width/7/4];//设置矩形四个圆角半径
    
    
//    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
////    view.backgroundColor = DocNavColor;
//    self.selectedBackgroundView = view;
}

//- (void)setModel:(NumberSourcesModel *)model
//{
//    _model = model;
//    self.number.text = [NSString stringWithFormat:@"%d 号",model.num ];
//    self.bc.text = model.treat_bc_name;
//    self.time.text = model.treat_time;
//}
@end
