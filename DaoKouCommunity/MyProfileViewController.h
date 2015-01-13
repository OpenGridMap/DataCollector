//
//  MyProfileViewController.h
//  DataCollector
//
//  Created by allen on 29/11/14.
//  Copyright (c) 2014 allen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *company;
@property (weak, nonatomic) IBOutlet UILabel *position;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)changeImage:(id)sender;

@end
