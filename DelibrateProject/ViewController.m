//
//  ViewController.m
//  DelibrateProject
//
//  Created by 林喜 on 6/20/17.
//  Copyright © 2017 HRBEduYun. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "SLToolsModal.h"
#import "SLXTimerVC.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate,UItableViewDataSource -
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SLToolsModal *modal = _dataSource[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    cell.textLabel.text = modal.title;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
//        SLXTimerVC *vc = [[[self.storyboard instantiateInitialViewController]loadNibNamed:@"SLXTimerVC" owner:self options:nil]firstObject];
        
        SLXTimerVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SLXTimerVC"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}
#pragma mark - seter geterr Methods
- (UITableView *)tableView{
    if (!_tableView) {
        CGRect rect = self.view.frame;
        _tableView = [[UITableView alloc]initWithFrame:rect style:UITableViewStylePlain];
        UIView *aview = [[UIView alloc]init];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
        _tableView.tableFooterView = aview;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor grayColor];
        
        
    }
    return _tableView;
}
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        NSArray *array = @[@"NSTimer使用（精简）"];
        NSUInteger count = 0;
        for (NSString *title in array) {
            SLToolsModal *modal = [[SLToolsModal alloc]init];
            modal.title = title;
            modal.modalId =count;
            count++;
            [_dataSource addObject:modal];
        }
    }
    return _dataSource;
}




@end
