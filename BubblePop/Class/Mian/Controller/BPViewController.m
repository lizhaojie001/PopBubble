//
//  BPViewController.m
//  BubblePop
//
//  Created by ios on 16/4/18.
//  Copyright © 2016年 Ios. All rights reserved.
//

#import "BPViewController.h"
 
#import  "BPNextController.h"
@interface BPViewController ()
@property     dispatch_source_t  timer;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *restartItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *historyItem;
@property (nonatomic,strong) NSString * nameLol;
@property (nonatomic,strong) UILabel * scoreLabel;
@end

@implementation BPViewController
- (IBAction)Restart:(UIBarButtonItem *)sender {
    NSLog(@"%s",__func__);
}
- (IBAction)History:(UIBarButtonItem *)sender {
}
- (NSUInteger)second {
    return _second;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.restartItem.image = [[UIImage imageNamed:@"washing_13"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
 self.historyItem.image = [[UIImage imageNamed:@"washing_07"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.second =6;

    [self setAllItems];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setAlter];
    //[self setTimer];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
         
}
#pragma mark -  设置定时器
- (void) setTimer{

    NSTimeInterval timeInterval = self.second;
  //  if (_timer == nil) {
        __block int timeout = timeInterval;
        if (timeout!= 0 ) {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);

            dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
            dispatch_source_set_event_handler(_timer, ^{
                if(timeout<=0){ //倒计时结束，关闭
                    NSLog(@"%@",     [NSThread currentThread]);
                    dispatch_source_cancel(_timer);
#warning 设置游戏结束
                    NSLog(@"倒计时结束");
                    _timer = nil;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.secondLabel.text = @"00";
                    });
                }else{

                    int second = timeout;
                    dispatch_async(dispatch_get_main_queue(), ^{

            self.secondLabel.text = [NSString stringWithFormat:@"%ds",second];


                    });
                    timeout--;
                }
            });
            dispatch_resume(_timer);
     //   }
}
}
#pragma mark -   设置弹出框输入
- (void)setAlter{
    UIAlertController * alter = [UIAlertController alertControllerWithTitle:@"Please input your name" message:@"anyOne" preferredStyle:UIAlertControllerStyleAlert];
    //UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

   // }];
    UIAlertAction *action2 =[UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField * textFiled = alter.textFields[0];
        self.nameLol = textFiled.text;
        
        NSLog(@"%@",self.name);
          [self setTimer];

    }];
    //UITextField * nameTextField = alter.textFields.firstObject;
   // [alter addAction:action1];
    [alter addAction:action2];
    [alter addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.textColor = [UIColor purpleColor];
        textField.placeholder = @"YOU NAME";
    }];
    [self presentViewController:alter animated:YES completion:^
     {
        // self.nameLabel.text = alter.textFields.firstObject.text;

     }];
}
#pragma mark - Items
- (void)setAllItems{
    self.scoreLabel.text= [NSString stringWithFormat:@"score:%d",0];
    self.scoreLabel.textAlignment = NSTextAlignmentCenter;
    //self.scoreLabel.backgroundColor = [UIColor redColor];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.scoreLabel];

    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"washing_09"] imageWithRenderingMode:3] style:UIBarButtonItemStylePlain target:self action:@selector(goToNextView)];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)goToNextView{
    BPNextController *Vc= [[BPNextController alloc]init];
    Vc.block = ^(NSUInteger time){
        self.second =time;
    };
    [self.navigationController pushViewController:Vc animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)viewDidDisappear:(BOOL)animated {
    if (_timer !=nil) {
        dispatch_source_cancel(_timer);

        _timer =nil;
    }

    NSLog(@"界面消失");
}
- (NSString *)name{
    return _nameLol;
}
- (UILabel *)scoreLabel {
	if(_scoreLabel == nil) {
		_scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 100)];
        _scoreLabel.font = [UIFont systemFontOfSize:10];
	}
	return _scoreLabel;
}

@end
