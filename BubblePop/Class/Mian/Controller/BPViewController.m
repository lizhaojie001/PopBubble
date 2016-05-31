//
//  BPViewController.m
//  BubblePop
//
//  Created by ios on 16/4/18.
//  Copyright © 2016年 Ios. All rights reserved.
//

#import "BPViewController.h"
#import "BPButton.h"
#import  "BPNextController.h"
#import "BPTools.h"
#import "UIView+BPView.h"

#define X  (int)self.view.bounds.size.width

#define Y (int)self.view.frame.size.height
@interface BPViewController ()
@property     dispatch_source_t  timer;
//@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *restartItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *historyItem;
/**Setting*/
@property(nonatomic,strong) NSString * nameLabel;
/** lastScore*/
@property(nonatomic,strong) NSString * lastScore;
@property (nonatomic,strong) UILabel * scoreLabel;
/** saveScore*/
@property(nonatomic,strong) NSMutableArray * scoreArray;
/** Score*/
@property(nonatomic,assign) CGFloat score;
/** set   restart condition*/
@property (nonatomic,assign) int a;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *restartButton;
@property (weak, nonatomic) IBOutlet UIToolbar *ToolBar;
/** save Prebutton*/
@property(nonatomic,strong) BPButton * prevButton;
/** clickCounts*/
@property(nonatomic,assign) NSUInteger  clickCounts;
@end

@implementation BPViewController
- (IBAction)Restart:(UIBarButtonItem *)sender {

    [self deleteBubble];
    [[BPTools tools] restart];
      self.numberOfBubble = self.numberOfB;
    self.numberOfBubble -= arc4random()%5;
    if (sender.enabled == YES) {
         [self setZeroScore];
        //[self cancelTimer];
         //[self setTimer];

        [self setAlter];
    }else{
   // [self setAlter];
    [self popBubble];
    }

    MYLog(@"%s",__func__);
}
- (IBAction)History:(UIBarButtonItem *)sender {

    [self showLastScore];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.restartButton.enabled = NO;
    self.restartItem.image = [[UIImage imageNamed:@"washing_13"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
 self.historyItem.image = [[UIImage imageNamed:@"washing_07"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    [self setZeroScore];
    [self setAllItems];
    [self setAlter];

    //addNSNotification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(passValue:) name:@"passValue" object:nil];
    // Do any additional setup after loading the view.
}
//setZeroScore
- (void)setZeroScore{
    self.score = 0;
    self.scoreLabel.text= [NSString stringWithFormat:@"score:%.1f",self.score];
}
#pragma mark -NSNotification
-(void)passValue:(NSNotification*)notfication {
//    autore= NO;
//    MYLog(@"----------auto:%d",autore);
   
    BPButton * button = notfication.object;
          MYLog(@"preButton:%@",self.prevButton);

    self.score += button.tag==self.prevButton.tag?button.tag*1.5:button.tag*1.0;
self.scoreLabel.text= [NSString stringWithFormat:@"score:%.1f",self.score];

    MYLog(@"%ld",(long)button.tag);
    [UIView animateWithDuration:1 animations:^{
        button.frame = CGRectMake(0,0,200 ,200  );
        button.alpha = 0;
        //[button removeFromSuperview];
    }];
    self.prevButton = button ;
    [[BPTools tools].rectArr removeObject:button];
    MYLog(@"containsObject::%d"  , [[BPTools tools].rectArr containsObject:button]);
    MYLog(@"[BPTools tools].rectrectArr.count:%lu",(unsigned long)[BPTools tools].rectArr.count);
    MYLog(@"self.view.subviews containsObject:button::%d",[self.view.subviews containsObject:button]);
    dispatch_async(dispatch_get_main_queue(), ^{
  [button performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:1];
    });

   // [button removeFromSuperview];
  MYLog(@"(unsigned long)self.view.subviews.count ============ %lu",(unsigned long)self.view.subviews.count);

    //self.clickCounts --;
    [self Restart:nil];


}


- (void)viewWillDisappear:(BOOL)animated{
    [self deleteBubble];
    [[BPTools tools] restart];
    [self setZeroScore];
    [self cancelTimer];
}

#pragma mark - popBubble
- (void)popBubble{


    for (int i = 0; i < self.numberOfBubble; i ++) {
        int W = 50;
         int H = 50;
        int x = [self getRandomNumber:1 to:X-W];
        int y = [self getRandomNumber:64 to:Y-self.ToolBar.frame.size.height-H];
        BPButton * button = [[BPButton alloc]initWithFrame:CGRectMake(x, y, 50, 50)];
        
        if ([BPTools layoutView:button andController:self]==NO) {
            i --;
            continue;
        }

    }
    MYLog(@"----------------------%lu",(unsigned long)[[BPTools tools] rectArr].count);
     for (BPButton * view in [BPTools tools].rectArr) {
          [self.view addSubview:view];
         CGRect frame = view.frame;
            view.frame = CGRectMake(arc4random()%100,arc4random()%100,0, 0);
         [UIView animateWithDuration:0.5 animations:^{
              view.frame = frame;
         }];


     }
    self.clickCounts = self.numberOfBubble;
         self.restartButton.enabled = NO;
}
- (int)getRandomNumber:(int)from to:(int)to{
    return (int)(from+(arc4random()%(to - from + 1)));
}
#pragma mark - removeFromSuperview
- (void)deleteBubble{
    for (BPButton * view in [BPTools tools].rectArr) {
        MYLog(@"[BPTools tools].rectArr:%lu",(unsigned long)[BPTools tools].rectArr.count);
        [view removeFromSuperview];
        MYLog(@"%lu",(unsigned long)self.view.subviews.count);

    }
}
#pragma mark -  setTimer
- (void) setTimer{

    NSTimeInterval timeInterval = self.second;
  if (_timer == nil) {
        __block int timeout = timeInterval;

        if (timeout!= 0 ) {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);

            dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);

            dispatch_source_set_event_handler(_timer, ^{
                if(timeout<=0){ //timeover

                    [self cancelTimer];
dispatch_sync(dispatch_get_main_queue(), ^{
self.lastScore = self.scoreLabel.text;
 [self showYourScore];
     MYLog(@"%@",[NSThread currentThread]);

});
 
    [self deleteBubble];
    [[BPTools tools] restart];
      }else{

                    int second = timeout;
                    dispatch_async(dispatch_get_main_queue(), ^{

            self.secondLabel.text = [NSString stringWithFormat:@"%ds",second];
                         self.lastScore = [NSString stringWithFormat:@"%.1f",self.score];
                        self.restartButton.enabled = NO;

                        if (self.clickCounts == 0) {


                                [self showYourScore];

                        }
                    });
                    timeout--;
                }
            });
            dispatch_resume(_timer);
        }
}
}
#pragma mark -  Set UIAlertController
- (void)setAlter{
    if (self.a==0) {


    UIAlertController * alter = [UIAlertController alertControllerWithTitle:@"Please input your name" message:@"anyOne" preferredStyle:UIAlertControllerStyleAlert];
    //UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

   // }];
    UIAlertAction *action2 =[UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
         UITextField * textFiled = alter.textFields[0];
        self.nameLabel = textFiled.text;
        
        MYLog(@"%@",self.name);
        [self setTimer];
        [self popBubble];

    }];

    [alter addAction:action2];
    [alter addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.textColor = [UIColor purpleColor];
        textField.placeholder = @"YOU NAME";
        self.nameLabel = textField.text;

    }];
    [self presentViewController:alter animated:YES completion:^
     {


     }];
    }
}
#pragma mark - Items
- (void)setAllItems{

    //self.scoreLabel.backgroundColor = [UIColor redColor];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.scoreLabel];

    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"washing_09"] imageWithRenderingMode:3] style:UIBarButtonItemStylePlain target:self action:@selector(goToNextView)];
}

- (void)goToNextView{
    BPNextController *Vc= [[BPNextController alloc]init];

    Vc.block = ^(NSUInteger time,NSUInteger numberOfBubble){

        self.second =time;
        self.numberOfB = numberOfBubble;
        self.restartButton.enabled = YES;
        [[BPTools tools] setValue:nil forKey:@"rectArr"];
        for (UIView * view in self.view.subviews) {
            if ([view.class isSubclassOfClass:[BPButton class]]) {
                [view removeFromSuperview];

            }
             MYLog(@"%@",[NSThread currentThread]);
        }
    };

    [self.navigationController pushViewController:Vc animated:YES];
}

#pragma mark -  cancelTimer
- (void)cancelTimer{
    if (_timer !=nil) {
        dispatch_source_cancel(_timer);

        _timer =nil;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.secondLabel.text = @"0s";
        });
    }
    
    
}






#pragma mark - writeTofile
- (void)keepUsersAndScore{
    NSFileManager * fileManager=[NSFileManager defaultManager];
        NSString *  Path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSAllDomainsMask, YES ).firstObject ;
    NSString *  path = [Path stringByAppendingString:@"/Score.plist"];
    if (![fileManager fileExistsAtPath:path]) {
        NSMutableDictionary * dic = [NSMutableDictionary dictionary];
        dic[self.nameLabel] = [NSString stringWithFormat:@"%.1f",[self Max]];
        [dic writeToFile:path atomically:YES];
    }else{
        NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithContentsOfFile:path];


        dic[self.nameLabel] = [NSString stringWithFormat:@"%.1f",[self Max]];
        [dic writeToFile:path atomically:YES];
        
    }



}
- (CGFloat)Max{
    CGFloat max =0;
    for (NSNumber * str in self.scoreArray) {
        if (max <   [str doubleValue]) {
            max = [str doubleValue];
        }
    }
    return max;
}


#pragma mark - show your score
- (void)showYourScore{
    self.restartButton.enabled = YES;
    [self.scoreArray addObject:@(self.score)];
    UIAlertView * view = [[UIAlertView alloc]initWithTitle:@"US:" message:[NSString stringWithFormat:@"%.1f",[self Max]]  delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];

    [view show];
    [self keepUsersAndScore];
    [self cancelTimer];

}
- (void)showLastScore{
    self.lastScore =  self.scoreArray.count == 0? @"0":[NSString stringWithFormat:@"%@",self.scoreArray.lastObject ];

    UIAlertView * view = [[UIAlertView alloc]initWithTitle:@"US:" message:self.lastScore delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];

    [view show];
    //[self cancelTimer];
}
#pragma - mark lazyLoad
- (NSUInteger)second {
    if (_second == 0) {
        return 60;
    }
    return _second;

    
}
- (UILabel *)scoreLabel {
	if(_scoreLabel == nil) {
		_scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 100)];
        _scoreLabel.font = [UIFont systemFontOfSize:10];

        _scoreLabel.textAlignment = NSTextAlignmentCenter;
        self.scoreLabel.numberOfLines = 0;
	}
	return _scoreLabel;
}
- (NSUInteger)numberOfBubble{

    
    if (_numberOfBubble == 0) {
 return 15;
    }
    return _numberOfBubble;
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"passValue" object:nil];
}
- (NSMutableArray *)scoreArray {
	if(_scoreArray == nil) {
		_scoreArray = [NSMutableArray array];
	}
	return _scoreArray;
}

@end
