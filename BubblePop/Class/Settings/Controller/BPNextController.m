//
//  BPNextController.m
//  BubblePop
//
//  Created by ios on 16/4/19.
//  Copyright © 2016year Ios. All rights reserved.
//

#import "BPNextController.h"
#import "BPTableViewCell.h"
#import "BPTools.h"
#import "BPButton.h"
#import "BPScoreController.h"
#import "BPIntroduce.h"
typedef NS_ENUM(NSUInteger, MyChoies) {
    TimerValue = 0,
    RangeValue,
    ThemeValue,
};
@interface BPNextController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/**时长*/
@property (nonatomic,strong) NSString * timeStr;
/** 泡泡数目*/
@property(nonatomic,strong) NSString * numberOfBubble;
@end

@implementation BPNextController

static NSString * Identifier = @"Cell1";
- (void)viewDidLoad {

    [super viewDidLoad];
    self.timeStr = @"60";
    self.numberOfBubble = @"15";
    self.title = @"Settings";
   // self.view.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"❀" style:0 target:self action:@selector(backToPre:)];
    [self.tableView registerNib:[UINib nibWithNibName:@"BPTableViewCell" bundle:nil] forCellReuseIdentifier:Identifier];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc]init];
}
#pragma mark - ToPre
- (void)backToPre:(UIBarButtonItem *)item{



        self.block( [self.timeStr integerValue],[self.numberOfBubble integerValue]);
        //  self.preVc.numberOfBubble = [self.numberOfBubble integerValue];
      

     [self.navigationController popViewControllerAnimated:YES];




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
        cell.categoryLabel.text = @"Time";


    }else if (indexPath.row == 1){
        cell.categoryLabel.text = @"Counts";
        //cell.showResult.hidden =YES;
        cell.unitLabel.hidden = YES;

    }else if (indexPath.row ==2){
        cell.categoryLabel.text = @"Theme";
        cell.unitLabel.hidden = YES;
        cell.showResult.hidden =YES;
    }else if(indexPath.row == 3){
        cell.categoryLabel.text = @"Score";
        cell.unitLabel.hidden = YES;
        cell.showResult.hidden =YES;
    }else{
        cell.categoryLabel.text = @"Other";
        cell.unitLabel.hidden = YES;
        cell.showResult.hidden =YES;
    }
    cell.titleImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"washing_0%ld",(long)indexPath.row+1]];
    // Configure the cell...
    cell.contentView.backgroundColor = [UIColor colorWithRed:249/255.0 green:62/255.0 blue:112/255.0 alpha:0.7];;
    // cell.backgroundImageView.image = [UIImage imageNamed:@"backgroundImage"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 3) {
        [self.navigationController pushViewController:[[BPScoreController alloc]init] animated:YES];
        
    }else if(indexPath.row == 4){
        [self.navigationController pushViewController:[BPIntroduce new] animated:YES];

    }else{
        BPTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];

        [self setAlterSheet:indexPath andCell:cell];


        [self.tableView reloadData];
    }


}
-(void ) setAlterSheet:(NSIndexPath *)indexPath andCell:(BPTableViewCell*)cell{
    switch (indexPath.row) {


        case TimerValue:{

            UIAlertController * alter = [UIAlertController alertControllerWithTitle:@"Please Choose Timer" message:@"30-60s" preferredStyle:UIAlertControllerStyleActionSheet];

  UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"30s" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
 cell.showResult.text = [self captureString:action.title];
      self.timeStr = cell.showResult.text;
  }];
            UIAlertAction * action4 = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                  
            }];
            UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"45s" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    cell.showResult.text = [self captureString:action.title];
                self.timeStr = cell.showResult.text;
            }];  UIAlertAction * action3 = [UIAlertAction actionWithTitle:@"60s" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
               cell.showResult.text = [self captureString:action.title];
                self.timeStr = cell.showResult.text;
            }];
            [alter addAction:action1];
            [alter addAction:action2];
            [alter addAction:action3];
            [alter addAction:action4];
            [self presentViewController:alter animated:YES completion:^{ 
            }] ;

        }
            break;
        case RangeValue:
        {

            UIAlertController * alter = [UIAlertController alertControllerWithTitle:@"Please Choose Count" message:@"0-15" preferredStyle:UIAlertControllerStyleActionSheet];

            UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"3" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                cell.showResult.text = action.title;
                self.numberOfBubble =cell.showResult.text;
               // self.timeStr = cell.showResult.text;
            }];
            UIAlertAction * action7= [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
               // cell.showResult.text = [self captureString:action.title];
              //  self.numberOfBubble =cell.showResult.text;
              //  self.timeStr = cell.showResult.text;
            }];
            UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"6" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                cell.showResult.text = action.title;
                self.numberOfBubble =cell.showResult.text;
               // self.timeStr = cell.showResult.text;
            }];  UIAlertAction * action3 = [UIAlertAction actionWithTitle:@"9" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                cell.showResult.text = action.title;
                self.numberOfBubble =cell.showResult.text;
               // self.timeStr = cell.showResult.text;
            }];
            UIAlertAction * action4 = [UIAlertAction actionWithTitle:@"12" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                cell.showResult.text = action.title;
                self.numberOfBubble =cell.showResult.text;
                // self.timeStr = cell.showResult.text;
            }];
            UIAlertAction * action5 = [UIAlertAction actionWithTitle:@"15" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                cell.showResult.text = action.title;
                self.numberOfBubble =cell.showResult.text;
                // self.timeStr = cell.showResult.text;
            }];
          //  UIAlertAction * action6 = [UIAlertAction actionWithTitle:@"30" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                cell.showResult.text = action.title;
//                self.numberOfBubble =cell.showResult.text;
//                // self.timeStr = cell.showResult.text;
//            }];
            [alter addAction:action1];
            [alter addAction:action2];
            [alter addAction:action3];
            [alter addAction:action4];
            [alter addAction:action5];
            //[alter addAction:action6];
            [alter addAction:action7];

            [self presentViewController:alter animated:YES completion:^{
            }] ;
            
        }

            break;
        default:
            break;
    }

}
//interception of string
- (NSString *)captureString:(NSString *)str{
    NSRange  range =  [str rangeOfString:@"s"];
    str = [str substringToIndex:range.location];
    MYLog(@"%@",str);

    return str;
 }
 
 



@end
