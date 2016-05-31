//
//  BPScoreController.m
//  BubblePop
//
//  Created by ios on 16/4/25.
//  Copyright © 2016year Ios. All rights reserved.
//

#import "BPScoreController.h"
#import "BPScore.h"
#import "BPPath.h"
@interface BPScoreController ()
/** saveDataSource*/
@property(nonatomic,strong) NSArray * soureArr;
@end

@implementation BPScoreController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"PlayerAndScore";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"❀" style:0 target:self action:@selector(backToPre:)];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)backToPre:(UIBarButtonItem*)item{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.soureArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" ];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:[BPPath path]];
    cell.detailTextLabel.text =   dic[self.soureArr[indexPath.row]];
    cell.textLabel.text = self.soureArr[indexPath.row];
   
    
    return cell;
}


 
- (NSArray *)soureArr {
	if(_soureArr == nil) {
        _soureArr = [BPScore allKeys];
	}
	return _soureArr;
}

@end
