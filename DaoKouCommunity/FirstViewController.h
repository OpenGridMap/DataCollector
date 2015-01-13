//
//  FirstViewController.h
//  DataCollector
//
//  Created by allen on 29/11/14.
//  Copyright (c) 2014 allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Discusstion.h"
#import "User.h"

@interface FirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray* objects;
@property NSMutableArray* statusCells;//存储cell，用于计算高度


@end

