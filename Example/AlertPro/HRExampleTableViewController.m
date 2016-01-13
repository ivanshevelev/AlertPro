//
//  HRExampleTableViewController.m
//  AlertPro
//
//  Created by Ivan Shevelev on 13/01/16.
//  Copyright © 2016 Ivan Shevelev. All rights reserved.
//

#import "HRExampleTableViewController.h"

#import "UIViewController+HRAlertViewController.h"

static NSString * const kHRExampleTableViewControllerErrorDomain = @"com.hirerussians.alertPro.exampleTableViewController.errorDomain";

@interface HRExampleTableViewController ()

@end

@implementation HRExampleTableViewController

-(void)showHandleAlertWithMessage:(NSString *)message {
    [self hrShowAlertWithTitle:@"Handle!"
                       message:message];
}

-(NSError *)sampleError {
    return [NSError errorWithDomain:kHRExampleTableViewControllerErrorDomain
                               code:400
                           userInfo:@{NSLocalizedDescriptionKey : NSLocalizedString(@"Sample Error Localized Description", nil)}];
}

#pragma mark - Alerts

- (IBAction)titleMessageButtonTitlesAndHandlerButtonTapped:(id)sender {
    [self hrShowAlertWithTitle:@"Title!"
                       message:@"Message"
                 buttonsTitles:@[@"First", @"Second"]
                    andHandler:^(UIAlertAction * _Nullable action, NSInteger indexOfAction) {
        [self showHandleAlertWithMessage:[NSString stringWithFormat:@"%ld with name: '%@' is tapped", (long)indexOfAction, action.title]];
    }];
}

- (IBAction)titleMessageOKAndHandlerButtonTapped:(id)sender {
    [self hrShowAlertWithTitle:@"Title"
                       message:@"Message"
                    andHandler:^(UIAlertAction * _Nullable action) {
        [self showHandleAlertWithMessage:[NSString stringWithFormat:@"Tapped button with name: '%@'", action.title]];
    }];
}


- (IBAction)titleMessageAndOKButtonTapped:(id)sender {
    [self hrShowAlertWithTitle:@"Title"
                       message:@"Message"];
}

- (IBAction)errorTitleAndMessageButtonTapped:(id)sender {
    [self hrShowErrorAlertWithMessage:@"Message"];
}

-(IBAction)errorTitleMessageAndHandler:(id)sender {
    [self hrShowErrorAlertWithMessage:@"Message" andHandler:^(UIAlertAction * _Nullable action) {
        [self showHandleAlertWithMessage:[NSString stringWithFormat:@"Tapped button with name: '%@'", action.title]];
    }];
}


- (IBAction)successTitleAndMessageButtonTapped:(id)sender {
    [self hrShowSuccessAlertWithMessage:@"Message"];
}

-(IBAction)successTitleMessageAndHandler:(id)sender {
    [self hrShowSuccessAlertWithMessage:@"Message" andHandler:^(UIAlertAction * _Nullable action) {
        [self showHandleAlertWithMessage:[NSString stringWithFormat:@"Tapped button with name: '%@'", action.title]];
    }];
}

- (IBAction)errorTitleAndNSErrorLocalizedDescriptionButtonTapped:(id)sender {
    NSError *error = [self sampleError];
    [self hrShowAlertWithError:error];
}

-(IBAction)errorTitleAndNSErrorLocalizedDescriptionAndHandlerButtonTapped:(id)sender {
    NSError *error = [self sampleError];
    [self hrShowAlertWithError:error
                    andHandler:^(UIAlertAction * _Nullable action) {
        [self showHandleAlertWithMessage:[NSString stringWithFormat:@"Tapped button with name: '%@'", action.title]];
    }];
}

#pragma mark - Sheets

- (IBAction)titleMessageButtonTitlesAndHandlerAndCancelHandlerButtonTapped:(id)sender {
    [self hrShowActionSheetWithTitle:@"Title"
                             message:@"Message"
                        buttonTitles:@[@"First", @"Second"] actionHandler:^(NSInteger indexOfAction, NSString * _Nonnull title) {
        [self showHandleAlertWithMessage:[NSString stringWithFormat:@"Tapped button with name: '%@'", title]];
    } andCancelActionHandler:^{
        [self showHandleAlertWithMessage:@"Cancel button is tapped"];
    }];
}

- (IBAction)titleButtonTitlesAndHandlerAndCancelHandlerButtonTapped:(id)sender {
    [self hrShowActionSheetWithTitle:@"Title" buttonTitles:@[@"First", @"Second"] actionHandler:^(NSInteger indexOfAction, NSString * _Nonnull title) {
        [self showHandleAlertWithMessage:[NSString stringWithFormat:@"Tapped button with name: '%@'", title]];
    } andCancelActionHandler:^{
        [self showHandleAlertWithMessage:@"Cancel button is tapped"];
    }];
}

- (IBAction)buttonTitlesAndHandlerAndCancelHandlerButtonTapped:(id)sender {
    [self hrShowActionSheetWithTitles:@[@"First", @"Second"]
                        actionHandler:^(NSInteger indexOfAction, NSString * _Nonnull title) {
        [self showHandleAlertWithMessage:[NSString stringWithFormat:@"Tapped button with name: '%@'", title]];
    } andCancelActionHandler:^{
        [self showHandleAlertWithMessage:@"Cancel button is tapped"];
    }];
}

- (IBAction)buttonTitlesAndHandlerButtonTapped:(id)sender {
    [self hrShowActionSheetWithTitles:@[@"First", @"Second"]
                        actionHandler:^(NSInteger indexOfAction, NSString * _Nonnull title) {
        [self showHandleAlertWithMessage:[NSString stringWithFormat:@"Tapped button with name: '%@'", title]];
    }];
}


- (IBAction)buttonTitlesAndHandlerWithoutCancelButtonButtonTapped:(id)sender {
    [self hrShowActionSheetWithoutCancelWithTitles:@[@"First", @"Second"] actionHandler:^(NSInteger indexOfAction, NSString * _Nonnull title) {
        [self showHandleAlertWithMessage:[NSString stringWithFormat:@"Tapped button with name: '%@'", title]];
    }];
}

@end
