//
//  NewItermViewController.m
//  DataCollector
//
//  Created by allen on 19/03/15.
//  Copyright (c) 2015 allen. All rights reserved.
//
#import <MapKit/MapKit.h>
#import "CLLocationValueTrasformer.h"
#import "MapViewController.h"
#import "CustomSelectorsFormViewController.h"
//#import "DynamicSelectorsFormViewController.h"
#import "NewItermViewController.h"


NSString *const kSelectorPush = @"selectorPush";
NSString *const kSelectorPopover = @"selectorPopover";
NSString *const kSelectorActionSheet = @"selectorActionSheet";
NSString *const kSelectorAlertView = @"selectorAlertView";
NSString *const kSelectorLeftRight = @"selectorLeftRight";
NSString *const kSelectorPushDisabled = @"selectorPushDisabled";
NSString *const kSelectorActionSheetDisabled = @"selectorActionSheetDisabled";
NSString *const kSelectorLeftRightDisabled = @"selectorLeftRightDisabled";
NSString *const kSelectorPickerView = @"selectorPickerView";
NSString *const kSelectorPickerViewInline = @"selectorPickerViewInline";
NSString *const kMultipleSelector = @"multipleSelector";
NSString *const kMultipleSelectorPopover = @"multipleSelectorPopover";
NSString *const kDynamicSelectors = @"dynamicSelectors";
NSString *const kCustomSelectors = @"customSelectors";
NSString *const kPickerView = @"pickerView";
NSString *const kSelectorWithSegueId = @"selectorWithSegueId";
NSString *const kSelectorWithSegueClass = @"selectorWithSegueClass";
NSString *const kSelectorWithNibName = @"selectorWithNibName";
NSString *const kSelectorWithStoryboardId = @"selectorWithStoryboardId";
NSString *const XLFormRowDescriptorTypeSelectorPickerViewInline = @"selectorPickerViewInline";
NSString *const kButtonWithSegueId = @"buttonWithSegueId";
NSString *const kButtonWithSegueClass = @"buttonWithSegueClass";
NSString *const kSwitchBool = @"switchBool";

@interface NewItermViewController ()
@end



#pragma mark - NSValueTransformer

@interface NSArrayValueTrasformer : NSValueTransformer
@end

@implementation NSArrayValueTrasformer

+ (Class)transformedValueClass
{
    return [NSString class];
}

+ (BOOL)allowsReverseTransformation
{
    return NO;
}

- (id)transformedValue:(id)value
{
    if (!value) return nil;
    if ([value isKindOfClass:[NSArray class]]){
        NSArray * array = (NSArray *)value;
        return [NSString stringWithFormat:@"%@ Item%@", @(array.count), array.count > 1 ? @"s" : @""];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [NSString stringWithFormat:@"%@ - ;) - Transformed", value];
    }
    return nil;
}

@end


@interface ISOLanguageCodesValueTranformer : NSValueTransformer
@end

@implementation ISOLanguageCodesValueTranformer

+ (Class)transformedValueClass
{
    return [NSString class];
}

+ (BOOL)allowsReverseTransformation
{
    return NO;
}

- (id)transformedValue:(id)value
{
    if (!value) return nil;
    if ([value isKindOfClass:[NSString class]]){
        return [[NSLocale currentLocale] displayNameForKey:NSLocaleLanguageCode value:value];
    }
    return nil;
}

@end




@implementation NewItermViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initializeForm];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeForm];
    }
    return self;
}

- (void)initializeForm
{
    
    //
    //    XLFormDescriptor * form;
    //    XLFormSectionDescriptor * section;
    //    XLFormRowDescriptor * row;
    //
    //    form = [XLFormDescriptor formDescriptorWithTitle:@"Add Event"];
    //
    //    // First section
    //    section = [XLFormSectionDescriptor formSection];
    //    [form addFormSection:section];
    //
    //    // Title
    //    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"title" rowType:XLFormRowDescriptorTypeText];
    //    [row.cellConfigAtConfigure setObject:@"Title" forKey:@"textField.placeholder"];
    //    [section addFormRow:row];
    //
    //    // Location
    //    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"location" rowType:XLFormRowDescriptorTypeText];
    //    [row.cellConfigAtConfigure setObject:@"Location" forKey:@"textField.placeholder"];
    //    [section addFormRow:row];
    //
    //    // Second Section
    //    section = [XLFormSectionDescriptor formSection];
    //    [form addFormSection:section];
    //
    //    // All-day
    //    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"all-day" rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"All-day"];
    //    [section addFormRow:row];
    //
    //    // Starts
    //    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"starts" rowType:XLFormRowDescriptorTypeDateTimeInline title:@"Starts"];
    //    row.value = [NSDate dateWithTimeIntervalSinceNow:60*60*24];
    //    [section addFormRow:row];
    
    
    XLFormDescriptor * form = [XLFormDescriptor formDescriptorWithTitle:@"Workflow"];
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    // First section
    section = [XLFormSectionDescriptor formSectionWithTitle:@"MetaData"];
    [form addFormSection:section];
    
        // Title
        row = [XLFormRowDescriptor formRowDescriptorWithTag:@"title" rowType:XLFormRowDescriptorTypeText];
        [row.cellConfigAtConfigure setObject:@"Title" forKey:@"textField.placeholder"];
        [section addFormRow:row];
    
        [section addFormRow:[XLFormRowDescriptor formRowDescriptorWithTag:kSwitchBool rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Use default GPS"]];

    
        // --------- Custom Selectors
        row = [XLFormRowDescriptor formRowDescriptorWithTag:kCustomSelectors rowType:XLFormRowDescriptorTypeButton
                                                      title:@"Choose Location by Hand"];
    
        // set up the selector controller class
        //row.action.viewControllerClass = [MapViewController class];
        //row.action.viewControllerClass = [CustomSelectorsFormViewController class];
        row.valueTransformer = [CLLocationValueTrasformer class];
        // Set up the default value
        row.value = [[CLLocation alloc] initWithLatitude:-33 longitude:-56];
        [section addFormRow:row];
    


    
    
    
        // Button with SegueId
//        XLFormRowDescriptor * buttonWithSegueId = [XLFormRowDescriptor formRowDescriptorWithTag:kButtonWithSegueClass rowType:XLFormRowDescriptorTypeButton title:@"Button with Segue Idenfifier"];
//        buttonWithSegueId.action.formSegueIdenfifier = @"MapViewControllerSegue";
//        [section addFormRow:buttonWithSegueId];
    
        // Selector Push
        row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorPush rowType:XLFormRowDescriptorTypeSelectorPush title:@"Catagory"];
        row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Cable"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Converter"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Generator"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Line"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"Cabinet"]
                            ];
        row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Converter"];
        [section addFormRow:row];
    
        // Selector Popover
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad){
            row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorPopover rowType:XLFormRowDescriptorTypeSelectorPopover title:@"Catagory"];
            row.selectorOptions = @[@"Cable", @"Converter", @"Generator", @"Line", @"Cabinet", @"Plant"];
            row.value = @"converter";
            [section addFormRow:row];
        }
    
    
    // --------- MultipleSelector
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kMultipleSelector rowType:XLFormRowDescriptorTypeMultipleSelector title:@"Catagory"];
    row.selectorOptions = @[@"Cable", @"Converter", @"Generator", @"Line", @"Cabinet", @"Option 6"];
    row.value = @[@"Option 1", @"Generator", @"Line", @"Cabinet", @"Option 6"];
    [section addFormRow:row];

    // --------- PickerSelector
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorPickerView rowType:XLFormRowDescriptorTypeSelectorPickerView title:@"Catagory"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Cable"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Converter"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Generator"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Line"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"Cabinet"]
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Line"];
    [section addFormRow:row];
    
    
    // Second section
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Data"];
    [form addFormSection:section];
    
    // Selector Push
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorPush rowType:XLFormRowDescriptorTypeSelectorPush title:@"Image"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Cable"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Converter"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Generator"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Line"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"Cabinet"]
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Converter"];
    [section addFormRow:row];
    
    // --------- Custom Selectors
    // selector with SegueId
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kCustomSelectors rowType:XLFormRowDescriptorTypeButton
                                                  title:@"Audio"];
    // set up the selector controller class
    //row.action.viewControllerClass = [MapViewController class];
    //row.action.viewControllerClass = [CustomSelectorsFormViewController class];
    //row.action.formSegueIdenfifier = @"MapViewControllerSegue";

    row.valueTransformer = [CLLocationValueTrasformer class];
    // Set up the default value
    row.value = [[CLLocation alloc] initWithLatitude:-33 longitude:-56];
    [section addFormRow:row];

    
//    // --------- Inline Selectors
//
//    section = [XLFormSectionDescriptor formSectionWithTitle:@"Inline Selectors"];
//    [form addFormSection:section];
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:kMultipleSelector rowType:XLFormRowDescriptorTypeSelectorPickerViewInline title:@"Inline Picker View"];
//    row.selectorOptions = @[@"Option 1", @"converter", @"Generator", @"Line", @"Cabinet", @"Option 6"];
//    row.value = @"Option 6";
//    [section addFormRow:row];

    
    
//    // Multiple selector with value tranformer
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:kMultipleSelector rowType:XLFormRowDescriptorTypeMultipleSelector title:@"Multiple Selector"];
//    row.selectorOptions = @[@"Option 1", @"converter", @"Generator", @"Line", @"Cabinet", @"Option 6"];
//    row.value = @[@"Option 1", @"Generator", @"Line", @"Cabinet", @"Option 6"];
//    row.valueTransformer = [NSArrayValueTrasformer class];
//    [section addFormRow:row];
//    
//    
//    // Language multiple selector
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:kMultipleSelector rowType:XLFormRowDescriptorTypeMultipleSelector title:@"Multiple Selector"];
//    row.selectorOptions = [NSLocale ISOLanguageCodes];
//    row.selectorTitle = @"Languages";
//    row.valueTransformer = [ISOLanguageCodesValueTranformer class];
//    row.value = [NSLocale preferredLanguages];
//    [section addFormRow:row];
//    
//    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad){
//        // Language multiple selector popover
//        row = [XLFormRowDescriptor formRowDescriptorWithTag:kMultipleSelectorPopover rowType:XLFormRowDescriptorTypeMultipleSelectorPopover title:@"Multiple Selector PopOver"];
//        row.selectorOptions = [NSLocale ISOLanguageCodes];
//        row.valueTransformer = [ISOLanguageCodesValueTranformer class];
//        row.value = [NSLocale preferredLanguages];
//        [section addFormRow:row];
//    }
    
    
    // --------- Dynamic Selectors
    
//    section = [XLFormSectionDescriptor formSectionWithTitle:@"Dynamic Selectors"];
//    [form addFormSection:section];
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:kDynamicSelectors rowType:XLFormRowDescriptorTypeButton title:@"Dynamic Selectors"];
//    row.action.viewControllerClass = [DynamicSelectorsFormViewController class];
//    [section addFormRow:row];
//    
//    // --------- Custom Selectors
//    
//    section = [XLFormSectionDescriptor formSectionWithTitle:@"Custom Selectors"];
//    [form addFormSection:section];
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:kCustomSelectors rowType:XLFormRowDescriptorTypeButton title:@"Custom Selectors"];
//    row.action.viewControllerClass = [CustomSelectorsFormViewController class];
//    [section addFormRow:row];
//    
//    section = [XLFormSectionDescriptor formSectionWithTitle:@"Disabled & Required Selectors"];
//    [form addFormSection:section];
    
    
    
//    // Disabled Selector Push
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorPushDisabled rowType:XLFormRowDescriptorTypeSelectorPush title:@"Push"];
//    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"converter"];
//    row.disabled = YES;
//    [section addFormRow:row];
//    
//    
//    
//    // --------- Disabled Selector Action Sheet
//    
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorActionSheetDisabled rowType:XLFormRowDescriptorTypeSelectorActionSheet title:@"Sheet"];
//    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Generator"];
//    row.disabled = YES;
//    [section addFormRow:row];
//    
//    // --------- Disabled Selector Left Right
//    
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorLeftRightDisabled rowType:XLFormRowDescriptorTypeSelectorLeftRight title:@"Left Right"];
//    row.leftRightSelectorLeftOptionSelected = [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"converter"];
//    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Right Line"];
//    row.disabled = YES;
//    [section addFormRow:row];
    
    
    // --------- Selector definition types
    
//    section = [XLFormSectionDescriptor formSectionWithTitle:@"Selectors"];
//    [form addFormSection:section];
//    
//    // selector with segue class
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorWithSegueClass rowType:XLFormRowDescriptorTypeSelectorPush title:@"Selector with Segue Class"];
//    row.action.formSegueClass = NSClassFromString(@"UIStoryboardPushSegue");
//    row.action.viewControllerClass = [MapViewController class];
//    row.valueTransformer = [CLLocationValueTrasformer class];
//    row.value = [[CLLocation alloc] initWithLatitude:-33 longitude:-56];
//    [section addFormRow:row];
//    
//    // selector with SegueId
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorWithSegueClass rowType:XLFormRowDescriptorTypeSelectorPush title:@"Selector with Segue Idenfifier"];
//    row.action.formSegueIdenfifier = @"MapViewControllerSegue";
//    row.valueTransformer = [CLLocationValueTrasformer class];
//    row.value = [[CLLocation alloc] initWithLatitude:-33 longitude:-56];
//    [section addFormRow:row];
//    
//    // selector using StoryboardId
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorWithStoryboardId rowType:XLFormRowDescriptorTypeSelectorPush title:@"Selector with StoryboardId"];
//    row.action.viewControllerStoryboardId = @"MapViewController";
//    row.valueTransformer = [CLLocationValueTrasformer class];
//    row.value = [[CLLocation alloc] initWithLatitude:-33 longitude:-56];
//    [section addFormRow:row];
//    
//    // selector with NibName
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorWithNibName rowType:XLFormRowDescriptorTypeSelectorPush title:@"Selector with NibName"];
//    row.action.viewControllerNibName = @"MapViewController";
//    row.valueTransformer = [CLLocationValueTrasformer class];
//    row.value = [[CLLocation alloc] initWithLatitude:-33 longitude:-56];
//    [section addFormRow:row];
               

    
    
    
    self.form = form;
}


-(UIStoryboard *)storyboardForRow:(XLFormRowDescriptor *)formRow
{
    return [UIStoryboard storyboardWithName:@"Main" bundle:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
