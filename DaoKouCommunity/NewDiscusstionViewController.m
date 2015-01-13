//
//  NewDiscusstionViewController.m
//  DataCollector
//
//  Created by allen on 23/12/14.
//  Copyright (c) 2014 allen. All rights reserved.
//

#import "NewDiscusstionViewController.h"

@interface NewDiscusstionViewController ()

@end

@implementation NewDiscusstionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
   
    //Customize left bar button item
//    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(goBack:)];
//    leftBarButtonItem.tintColor = [UIColor colorWithRed:85.0f/255.0f green:160.0f/255.0f blue:185.0f/255.0f alpha:1.0];
//    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)goBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
