//
//  BPTableViewController.m
//  BubblePop
//
//  Created by ios on 16/4/19.
//  Copyright © 2016年 Ios. All rights reserved.
//

#import "BPTableViewController.h"
#import "BPTableViewCell.h"
@interface BPTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
 

@end

@implementation BPTableViewController
static NSString * Identifier = @"Cell1";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Settings";
    
    self.view.backgroundColor = [UIColor clearColor];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:0 target:self action:@selector(popToViewController:animated:)];
    [self.tableView registerNib:[UINib nibWithNibName:@"BPTableViewCell" bundle:nil] forCellReuseIdentifier:Identifier];
    self.tableView.tableFooterView = [[UIView alloc]init];
}

#pragma mark - Table view data source
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}


- (BPTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier ];
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    if (indexPath.row == 0) {
        cell.categoryLabel.text = @"设置时长";

    }else if (indexPath.row == 1){
        cell.categoryLabel.text = @"泡泡数目";

    }else if (indexPath.row ==2){
        cell.categoryLabel.text = @"主题背景";

    }else if(indexPath.row == 3){
        cell.categoryLabel.text = @"分数详情";
    }else{
        cell.categoryLabel.text = @"其他功能";
    }
    cell.titleImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"washing_0%lu",indexPath.row+1]];
    // Configure the cell...

    // cell.backgroundImageView.image = [UIImage imageNamed:@"backgroundImage"];
    return cell;
}
 

@end
