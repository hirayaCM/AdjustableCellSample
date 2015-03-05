//
//  DetailViewController.h
//  AdjustableCellSample
//
//  Created by hiraya.shingo on 2015/03/05.
//  Copyright (c) 2015年 hiraya.shingo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

