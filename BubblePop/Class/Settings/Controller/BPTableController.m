//
//  BPTableController.m
//  BubblePop
//
//  Created by ios on 16/4/18.
//  Copyright © 2016年 Ios. All rights reserved.
//

#import "BPTableController.h"
#import "BPTableViewCell.h"
@interface BPTableController ()

@end

@implementation BPTableController
static NSString * Identifier = @"Cell1";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Settings";
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:0 target:self action:@selector(popToViewController:animated:)];
    [self.tableView registerNib:[UINib nibWithNibName:@"BPTableViewCell" bundle:nil] forCellReuseIdentifier:Identifier];
   self.tableView.tableFooterView = [[UIView alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
      cell.titleImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"washing_0%ld",indexPath.row+1]];
    // Configure the cell...

   // cell.backgroundImageView.image = [UIImage imageNamed:@"backgroundImage"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController * view = [[UIViewController alloc]init];
    view.view.backgroundColor = [UIColor redColor];
    BPTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    view.title= cell.categoryLabel.text;
    [self.navigationController pushViewController:view animated:YES];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
