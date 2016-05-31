# PopBubble

#一个定时积分游戏 --点击泡泡
效果图
![](http://7xux50.com1.z0.glb.clouddn.com/pop.gif)
**其中用到了计时器**
```objc
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

[self deleteBubble];//游戏的功能,只使用定时器可以去掉
[[BPTools tools] restart];//游戏的功能,只使用定时器可以去掉
}else{

int second = timeout;
dispatch_async(dispatch_get_main_queue(), ^{

self.secondLabel.text = [NSString stringWithFormat:@"%ds",second];
self.lastScore = [NSString stringWithFormat:@"%.1f",self.score];
self.restartButton.enabled = NO;

if (self.clickCounts == 0) {


[self showYourScore];//游戏的功能,只使用定时器可以去掉

}
});
timeout--;
}
});
dispatch_resume(_timer);
}
}
}

```