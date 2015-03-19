//
//  CustomCell.h
//  AdjustableCellSample
//
//  Created by hiraya.shingo on 2015/03/05.
//  Copyright (c) 2015年 hiraya.shingo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lesson1Cell : UITableViewCell

@property (nonatomic) NSDictionary *data;

+ (CGFloat)heightForRowWithTableView:(UITableView *)tableView
                                data:(NSDictionary *)data
                      cellIdentifier:(NSString *)cellIdentifier;

@end
