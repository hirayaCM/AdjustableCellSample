//
//  CustomCell.h
//  AdjustableCellSample
//
//  Created by hiraya.shingo on 2015/03/05.
//  Copyright (c) 2015年 hiraya.shingo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end
