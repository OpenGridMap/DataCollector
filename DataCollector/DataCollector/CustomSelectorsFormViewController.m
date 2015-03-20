//
//  CustomSelectorsFormViewController.m
//  DataCollector
//
//  Created by allen on 19/03/15.
//  Copyright (c) 2015 allen. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "CLLocationValueTrasformer.h"
#import "MapViewController.h"

#import "CustomSelectorsFormViewController.h"

NSString *const kSelectorMap = @"selectorMap";
NSString *const kSelectorMapPopover = @"selectorMapPopover";

@implementation CustomSelectorsFormViewController

-(id)init
{
    self = [super init];
    if (self) {
        XLFormDescriptor * form = [XLFormDescriptor formDescriptorWithTitle:@"Custom Selectors"];
        XLFormSectionDescriptor * section;
        XLFormRowDescriptor * row;
        
        // Basic Information
        section = [XLFormSectionDescriptor formSection];
        section.footerTitle = @"CustomSelectorsFormViewController.h";
        [form addFormSection:section];
        
        
        // Selector Push
        row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorMap rowType:XLFormRowDescriptorTypeSelectorPush title:@"Coordinate"];
        //row.action.viewControllerClass = [MapViewController class];
        row.valueTransformer = [CLLocationValueTrasformer class];
        row.value = [[CLLocation alloc] initWithLatitude:-33 longitude:-56];
        [section addFormRow:row];
        
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad){
            // Selector PopOver
            row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorMapPopover rowType:XLFormRowDescriptorTypeSelectorPopover title:@"Coordinate PopOver"];
            //row.action.viewControllerClass = [MapViewController class];
            row.valueTransformer = [CLLocationValueTrasformer class];
            row.value = [[CLLocation alloc] initWithLatitude:-33 longitude:-56];
            [section addFormRow:row];
        }
        
        self.form = form;
        
    }
    return self;
}

@end
