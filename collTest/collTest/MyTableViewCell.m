//
//  MyTableViewCell.m
//  collTest
//
//  Created by xhr on 16/5/20.
//  Copyright (c) 2016年 徐浩然. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib {
     [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"MyTableViewCellID";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

@end
