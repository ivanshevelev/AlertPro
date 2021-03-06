//
//  AlertProTests.m
//  AlertProTests
//
//  Created by Ivan Shevelev on 01/13/2016.
//  Copyright (c) 2016 Ivan Shevelev. All rights reserved.
//

@import XCTest;

#import <AlertPro/UIViewController+HRAlertViewController.h>

@interface Tests : XCTestCase

@property (nonatomic, strong) UIViewController *viewController;

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    self.viewController = [[UIViewController alloc] init];
}

-(void)testAlertCreating {
    
    NSString *title = @"Title";
    
    NSString *message = @"Message";
    
    NSArray *buttonTitles = @[@"1", @"2", @"3"];
    
    void(^handler)(UIAlertAction *, NSInteger) = ^void(UIAlertAction *alertAction, NSInteger indexOfAction) {
        
    };
    
    UIAlertController *alertController = [self.viewController hrAlertWithTitle:title
                                                                       message:message
                                                                 buttonsTitles:buttonTitles
                                                                    andHandler:handler];
    
    XCTAssert(alertController.title == title, @"Titles cant be not equal");
    XCTAssert(alertController.message == message, @"Messages cant be not equal");
    XCTAssert(alertController.actions.count == buttonTitles.count, @"Count of actions cant be not equal");
    
    for (NSUInteger i = 0; i < alertController.actions.count; i++) {
        UIAlertAction *action = alertController.actions[i];
        NSString *actionTitle = buttonTitles[i];
        XCTAssert([action.title isEqualToString:actionTitle], @"Action titles cant be not equal");
    }
}

-(void)testActionSheetCreating {
    
    NSString *title = @"Title";
    NSString *message = @"Message";
    
    NSArray *buttonTitles = @[@"1", @"2", @"3"];
    
    void(^handler)(NSInteger, NSString *) = ^void(NSInteger indexOfAction, NSString *title) {
        
    };
    
    UIPopoverArrowDirection direction = UIPopoverArrowDirectionDown;
    
    UIView *sourceView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    
    UIAlertController *alertController = [self.viewController hrAlertControllerWithTitle:title
                                                                                 message:message
                                                                           buttonsTitles:buttonTitles
                                                                   popoverArrowDirection:direction
                                                                              sourceView:sourceView
                                                                              sourceRect:sourceView.frame
                                                                        andActionHandler:handler];
    
    XCTAssert(alertController.title == title, @"Titles cant be not equal");
    XCTAssert(alertController.message == message, @"Messages cant be not equal");
    XCTAssert(alertController.actions.count == buttonTitles.count, @"Count of actions cant be not equal");
    
    for (NSUInteger i = 0; i < alertController.actions.count; i++) {
        UIAlertAction *action = alertController.actions[i];
        NSString *actionTitle = buttonTitles[i];
        XCTAssert([action.title isEqualToString:actionTitle], @"Action titles cant be not equal");
    }
    
    UIPopoverPresentationController *popoverPresentationController = alertController.popoverPresentationController;
    
    if (popoverPresentationController) {
        XCTAssert(alertController.popoverPresentationController.permittedArrowDirections == direction);
        XCTAssert(alertController.popoverPresentationController.sourceView == sourceView);
        XCTAssert(CGRectEqualToRect(alertController.popoverPresentationController.sourceRect, sourceView.frame));
    }
    
}

@end

