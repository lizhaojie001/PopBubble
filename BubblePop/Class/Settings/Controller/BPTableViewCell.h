//
//  BPTableViewCell.h
//  BubblePop
//
//  Created by ios on 16/4/18.
//  Copyright © 2016year Ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BPTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *titleImageView;
@property (weak, nonatomic) IBOutlet UILabel *showResult;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *unitLabel;

@end
