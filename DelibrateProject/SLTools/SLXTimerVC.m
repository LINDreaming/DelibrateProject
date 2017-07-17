//
//  SLXTimerVC.m
//  DelibrateProject
//
//  Created by 林喜 on 7/14/17.
//  Copyright © 2017 HRBEduYun. All rights reserved.
//

#import "SLXTimerVC.h"
#import "NSString+addition.h"
@interface SLXTimerVC ()

@property(nonatomic,strong)NSTimer *timer;
@property (weak, nonatomic) IBOutlet UILabel *timeLb;
@property (weak, nonatomic) IBOutlet UIButton *pauseBtn;

@end

@implementation SLXTimerVC
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self stopTimer];
}


- (void)viewDidLoad {
    [super viewDidLoad];
   

}

#pragma mark -IBMethods 
- (IBAction)handleStartAction:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    sender.isSelected ? [self beginTimer]:[self stopTimer];
}
- (IBAction)handlePauseAction:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    sender.isSelected ? [self pauseTimer]:[self startTimer];

}


// 暂停timer

- (void)pauseTimer{
    // fireDate 设置计时暂停：
    [_timer setFireDate:[NSDate distantFuture]];
    
}
- (void)startTimer{
    // fireDate 设置计时开始
    [_timer setFireDate:[NSDate distantPast]];
}
- (void)beginTimer{
    __block NSInteger timeCount=0;
    self.view.backgroundColor = [UIColor whiteColor];
    //启动timer;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.f repeats:YES block:^(NSTimer * _Nonnull timer) {
        timeCount++;
        NSLog(@"timeCount == %ld",(long)timeCount);
        _timeLb.text = [NSString stringWithTimeInterval:timeCount];
    }];
}

// 停止timer;
- (void)stopTimer{
    [_timer invalidate];
    _timeLb.text = @"00:00";
    _pauseBtn.selected = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
