//
//  FirstViewController.m
//  DataCollector
//
//  Created by allen on 29/11/14.
//  Copyright (c) 2014 allen. All rights reserved.
//

#import "FirstViewController.h"
#import "DetailedItermViewController.h"
#import "NewItermViewController.h"


@interface FirstViewController ()


@end

@implementation FirstViewController

//@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    // self.tableView.contentInset = UIEdgeInsetsMake(0, -15, 0, 0);
    
    //hide the navigationbar
    //self.navigationController.hidesBarsOnSwipe=TRUE;
    
    [self initData];
    
    //创建一个分组样式的UITableView, Already done in StoryBoard
    //_tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    //设置数据源，实现对应的UITableViewDataSource Protocol
    _tableView.dataSource=self;
    
    
    UIBarButtonItem *removeButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(remove)];
    self.navigationItem.leftBarButtonItem = removeButton;
    [self.view addSubview:_tableView];
    

}

#pragma mark loadData
-(void)initData{
    _objects=[[NSMutableArray alloc]init];
    // Create the modelx
    //    _quizArray = @[q1, q2, q3, q4, q5];
    //    _quizArray = [NSMutableArray arrayWithObjects:q1, q2];
    
    for (int i = 1; i <= 10; i++){
        NSDate *today = [NSDate date];
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSCalendarUnit unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
        NSDateComponents *dateComponents = [calendar components:unitFlags fromDate:today];
        NSRange days = [calendar rangeOfUnit:NSCalendarUnitDay
                                      inUnit:NSCalendarUnitMonth
                                     forDate:today];
        int r = arc4random() % days.length;
        [dateComponents setDay:r];
        NSDate *startDate = [calendar dateFromComponents:dateComponents];
        
        DataIterm* discusstion = [[[DataIterm alloc] init] initWithAuthor:[NSString stringWithFormat: @"user%d", i] publischDate:startDate content:[NSString stringWithFormat: @"This is the content description for data iterm%d.", i] title:[NSString stringWithFormat: @"title%d", i]  ];
        [_objects addObject:discusstion];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.objects.count;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *MyIdentifier = @"DiscussCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
//    }
//    
//    Discusstion *dis = _objects[indexPath.row];
//    
//    UIImageView *imageView;
//    imageView = (UIImageView *)[cell viewWithTag:1];
//    [imageView setImage:[UIImage imageNamed:dis.image]];
//    
//    cell.textLabel.text = dis.title;
//
//    UILabel *authorLabel;
//    authorLabel = (UILabel *)[cell viewWithTag:2];
//    authorLabel.text = dis.author;
//    
//    UILabel *contentLabel;
//    contentLabel = (UILabel *)[cell viewWithTag:3];
//    contentLabel.text = dis.content;
//    
//    
//    UILabel *dateLabel;
//    dateLabel = (UILabel *)[cell viewWithTag:4];
//    dateLabel.text = (NSString *)dis.publischDate;
//
//    
//    //cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BgCell"]];
//    return cell;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"DataCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:MyIdentifier];
    }
    DataIterm *object = _objects[indexPath.row];
    //    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    //    [imageView setImage:[UIImage imageNamed:dis.image]];
    
    cell.imageView.image = [UIImage imageNamed:@"creme_brelee.jpg"];
    cell.textLabel.text = object.title;
    cell.detailTextLabel.text = object.content;
    NSLog(@"%@", object.title);

    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundView.contentMode = UIViewContentModeTop;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}


#pragma mark Delete

- (void)remove {
    [_tableView setEditing:!_tableView.isEditing animated:true];
}


#pragma mark SwipeDelte
//实现了此方法向左滑动就会显示删除按钮
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    DataIterm *dis = _objects[indexPath.row];
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [_objects removeObject:dis];
        //考虑到性能这里不建议使用reloadData
        [tableView reloadData];
        //使用下面的方法既可以局部刷新又有动画效果
        //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];

        //如果当前组中没有数据则移除组刷新整个表格
//        if (group.contacts.count==0) {
//            [_objects removeObject:group];
//            [tableView reloadData];
//        }
    }
}


#pragma mark 重新设置单元格高度
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    //KCStatusTableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
//    KCStatusTableViewCell *cell= _statusCells[indexPath.row];
//    cell.status=_status[indexPath.row];
//    return cell.height;
//}

#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


#pragma mark 排序
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    DataIterm *sourceDis=_objects[sourceIndexPath.row];
    DataIterm *destinationDis=_objects[destinationIndexPath.row];

    DataIterm *tmpDis= destinationDis;
    destinationDis = sourceDis;
    sourceDis = tmpDis;
    //[_objects removeObject:destinationDis];
    //[_objects insertObject:sourceDis atIndex:destinationIndexPath.row];

}

//#pragma mark 取得当前操作状态，根据不同的状态左侧出现不同的操作按钮
//-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (_isInsert) {
//        return UITableViewCellEditingStyleInsert;
//    }
//    return UITableViewCellEditingStyleDelete;
//}




#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"newDiscuss"]) {
//        NewItermViewController *newViewController = segue.destinationViewController;
//        newViewController.hidesBottomBarWhenPushed = YES;  // This property needs to be set before pushing viewController to the navigationController's stack.
//        [self.navigationController pushViewController:newViewController animated:YES];
    }
    if ([[segue identifier] isEqualToString:@"PushToDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DataIterm *object = _objects[indexPath.row];
        [segue.destinationViewController setDetailItem:object];
    }
}


@end
