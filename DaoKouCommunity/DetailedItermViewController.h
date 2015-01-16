//
//  DetailedDiscusstionViewController.h
//  DataCollector
//
//  Created by allen on 23/12/14.
//  Copyright (c) 2014 allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataIterm.h"

@interface DetailedItermViewController : UIViewController

@property (strong, nonatomic) DataIterm* detailItem;

@property (weak, nonatomic) IBOutlet UITextField *dateField;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *autherField;
@property (weak, nonatomic) IBOutlet UITextField *contentField;


@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;


@end
