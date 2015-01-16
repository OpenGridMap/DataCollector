//
//  DetailedDiscusstionViewController.m
//  DataCollector
//
//  Created by allen on 23/12/14.
//  Copyright (c) 2014 allen. All rights reserved.
//

#import "DetailedItermViewController.h"
#import "DataIterm.h"

@interface DetailedItermViewController ()
- (void)configureView;

@end

@implementation DetailedItermViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(DataIterm*)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureView];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *stringFromDate = [formatter stringFromDate:[_detailItem publischDate]];
    //NSLog([_detailItem title]);
    self.title=[_detailItem title];
    _dateField.text=stringFromDate;
    _titleField.text=[_detailItem title];
    _autherField.text=[_detailItem author];
    _contentField.text=[_detailItem content];
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
