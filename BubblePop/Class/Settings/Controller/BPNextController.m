//
//  BPNextController.m
//  BubblePop
//
//  Created by ios on 16/4/19.
//  Copyright © 2016年 Ios. All rights reserved.
//

#import "BPNextController.h"
#import "BPTableViewCell.h"

typedef NS_ENUM(NSUInteger, MyChoies) {
    TimerValue = 0,
    RangeValue,
    ThemeValue,
};
@interface BPNextController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BPNextController

static NSString * Identifier = @"Cell1";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Settings";
   // self.view.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:0 target:self action:@selector(popToViewController:animated:)];
    [self.tableView registerNib:[UINib nibWithNibName:@"BPTableViewCell" bundle:nil] forCellReuseIdentifier:Identifier];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
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
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
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
    cell.backgroundColor = [UIColor clearColor];
    // cell.backgroundImageView.image = [UIImage imageNamed:@"backgroundImage"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BPTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];

   [self setAlterSheet:indexPath andCell:cell];


    [self.tableView reloadData];

}
-(void ) setAlterSheet:(NSIndexPath *)indexPath andCell:(BPTableViewCell*)cell{
    switch (indexPath.row) {


        case TimerValue:{

            UIAlertController * alter = [UIAlertController alertControllerWithTitle:@"Please Choose Timer" message:@"0-100s" preferredStyle:UIAlertControllerStyleActionSheet];

  UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"30s" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    cell.showResult.text = action.title;
  }];
            UIAlertAction * action4 = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    cell.showResult.text = @"60s";
            }];
            UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"60s" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    cell.showResult.text = action.title;
            }];  UIAlertAction * action3 = [UIAlertAction actionWithTitle:@"100s" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                cell.showResult.text = action.title;
            }];
            [alter addAction:action1];
            [alter addAction:action2];
            [alter addAction:action3];
            [alter addAction:action4];
            [self presentViewController:alter animated:YES completion:^{

            }] ;

        }
            break;

        default:
            break;
    }

}
#pragma mark - item
 



@end
