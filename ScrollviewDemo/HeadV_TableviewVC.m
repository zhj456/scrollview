//
//  HeadV_TableviewVC.m
//  ScrollviewDemo
//
//  Created by 赵娇 on 2018/5/10.
//  Copyright © 2018年 jucaidao. All rights reserved.
//

#import "HeadV_TableviewVC.h"

#define navH  self.navigationController.navigationBar.frame.size.height


static NSString*cellid=@"cid";


@interface HeadV_TableviewVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tabV;
@property (nonatomic, strong) UIView *topView;

@end

@implementation HeadV_TableviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor=[UIColor clearColor];
    
    
    [self showView];
    
    
}


-(void)showView{
    
    [self.view addSubview:self.topView];
    [self.view addSubview:self.tabV];
    
   
}


#pragma scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.tabV.contentOffset.y > 0 ) {
        self.topView.frame = CGRectMake(0, -self.tabV.contentOffset.y-navH, self.view.frame.size.width, 150) ;
        if (self.tabV.contentOffset.y >= 100) {
             self.topView.frame = CGRectMake(0, -100, self.view.frame.size.width, 150) ;
        }
        
         _tabV.frame=CGRectMake(0, CGRectGetMaxY(self.topView.frame), self.view.frame.size.width, self.view.frame.size.height-150-navH);
    }else{
        self.topView.frame = CGRectMake(0, -self.tabV.contentOffset.y, self.view.frame.size.width, 150) ;
        [self.view addSubview:self.topView];
        
    }
    
   
    
    
}


-(UIView*)topView{
    if (!_topView) {
        //创建顶部的条
       _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
        _topView.backgroundColor = [UIColor greenColor];
    }
    return _topView;
}
-(UITableView*)tabV{
    if (!_tabV) {
       _tabV=[[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topView.frame), self.view.frame.size.width, self.view.frame.size.height-150-navH) style:UITableViewStyleGrouped];
        _tabV.estimatedRowHeight=0;
        _tabV.estimatedSectionFooterHeight=0;
        _tabV.estimatedSectionHeaderHeight=0;
        _tabV.delegate=self;
        _tabV.dataSource=self;
        _tabV.rowHeight=50;
        [_tabV registerClass:[UITableViewCell class] forCellReuseIdentifier:cellid];
       
    }
    return _tabV;
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

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    cell.textLabel.text=[NSString stringWithFormat:@"hello===%ld",indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
@end
