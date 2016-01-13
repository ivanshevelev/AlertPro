//
//  UIViewController+HRAlertViewController.m
//  HireRussians
//
//  Created by Ivan Shevelev on 10/11/15.
//  Copyright © 2015 Sibers. All rights reserved.
//

#import "UIViewController+HRAlertViewController.h"

@implementation UIViewController (HRAlertView)

-(void)hrShowAlertWithTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
              buttonsTitles:(NSArray<NSString *> *)buttonTitles
                 andHandler:(void (^ __nullable)(UIAlertAction * _Nullable action, NSInteger indexOfAction))handler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    for (NSString *btnTitle in buttonTitles) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:btnTitle
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           if (handler) {
                                                               handler(action, [alertController.actions indexOfObject:action]);
                                                           }
                                                       }];
        [alertController addAction:action];
    }
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)hrShowAlertWithTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                 andHandler:(void (^ __nullable)(UIAlertAction * _Nullable action))handler {
    [self hrShowAlertWithTitle:title
                       message:message
                 buttonsTitles:@[NSLocalizedString(@"OK", nil)]
                    andHandler:^(UIAlertAction * _Nullable action, NSInteger indexOfAction) {
                        if (handler) {
                            handler(action);
                        }
                    }];
}

-(void)hrShowAlertWithTitle:(nullable NSString *)title
                    message:(nullable NSString *)message {
    [self hrShowAlertWithTitle:title
                       message:message
                    andHandler:nil];
}

-(void)hrShowErrorAlertWithMessage:(nullable NSString *)message {
    [self hrShowAlertWithTitle:NSLocalizedString(@"Error!", nil)
                       message:message];
}

-(void)hrShowErrorAlertWithMessage:(nullable NSString *)message
                        andHandler:(void (^ __nullable)(UIAlertAction * _Nullable action))handler {
    [self hrShowAlertWithTitle:NSLocalizedString(@"Error!", nil)
                       message:message
                    andHandler:handler];
}

-(void)hrShowSuccessAlertWithMessage:(nullable NSString *)message {
    [self hrShowAlertWithTitle:NSLocalizedString(@"Success!", nil)
                       message:message];
}

-(void)hrShowSuccessAlertWithMessage:(nullable NSString *)message
                          andHandler:(void (^ __nullable)(UIAlertAction * _Nullable action))handler {
    [self hrShowAlertWithTitle:NSLocalizedString(@"Success!", nil)
                       message:message
                    andHandler:handler];
}

-(void)hrShowAlertWithError:(nullable NSError *)error {
    [self hrShowErrorAlertWithMessage:error.localizedDescription];
}

-(void)hrShowAlertWithError:(nullable NSError *)error
                 andHandler:(void (^ __nullable)(UIAlertAction * _Nullable action))handler {
    [self hrShowAlertWithTitle:NSLocalizedString(@"Error!", nil)
                       message:error.localizedDescription
                    andHandler:handler];
}

@end

@implementation UIViewController (HRActionSheet)

-(void)hrShowActionSheetWithTitle:(nullable NSString *)title
                          message:(nullable NSString *)message
                     buttonTitles:(nullable NSArray<NSString *> *)titles
                    actionHandler:(nullable void(^)(NSInteger indexOfAction, NSString * _Nonnull title))handler
           andCancelActionHandler:(nullable void(^)())cancelActionHandler {
    UIAlertController *alertController = [self hrAlertControllerWithTitle:title
                                                                  message:message
                                                            buttonsTitles:titles
                                                         andActionHandler:handler];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil)
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             if (cancelActionHandler) {
                                                                 cancelActionHandler();
                                                             }
                                                         }];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController
                       animated:YES
                     completion:nil];
}

-(void)hrShowActionSheetWithTitle:(nullable NSString *)title
                     buttonTitles:(nullable NSArray<NSString *> *)titles
                    actionHandler:(nullable void(^)(NSInteger indexOfAction, NSString * _Nonnull title))handler
           andCancelActionHandler:(nullable void(^)())cancelActionHandler {
    [self hrShowActionSheetWithTitle:title
                             message:nil
                        buttonTitles:titles
                       actionHandler:handler
              andCancelActionHandler:cancelActionHandler];
}

-(void)hrShowActionSheetWithMessage:(nullable NSString *)message
                       buttonTitles:(nullable NSArray<NSString *> *)titles
                      actionHandler:(nullable void(^)(NSInteger indexOfAction, NSString * _Nonnull title))handler
             andCancelActionHandler:(nullable void(^)())cancelActionHandler {
    [self hrShowActionSheetWithTitle:nil
                             message:message
                        buttonTitles:titles
                       actionHandler:handler
              andCancelActionHandler:cancelActionHandler];
}


-(void)hrShowActionSheetWithTitles:(nullable NSArray<NSString *> *)titles
                     actionHandler:(nullable void(^)(NSInteger indexOfAction, NSString * _Nonnull title))handler
            andCancelActionHandler:(nullable void(^)())cancelActionHandler {
    UIAlertController *alertController = [self hrAlertControllerWithTitles:titles andActionHandler:handler];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil)
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             if (cancelActionHandler) {
                                                                 cancelActionHandler();
                                                             }
                                                         }];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController
                       animated:YES
                     completion:nil];
}

-(void)hrShowActionSheetWithTitles:(nullable NSArray<NSString *> *)titles
                     actionHandler:(nullable void(^)(NSInteger indexOfAction, NSString * _Nonnull title))handler {
    [self hrShowActionSheetWithTitles:titles
                        actionHandler:handler
               andCancelActionHandler:nil];
}

-(void)hrShowActionSheetWithoutCancelWithTitles:(nullable NSArray<NSString *> *)titles
                                  actionHandler:(nullable void(^)(NSInteger indexOfAction, NSString * _Nonnull title))handler {
    UIAlertController *alertController = [self hrAlertControllerWithTitles:titles andActionHandler:handler];
    [self presentViewController:alertController
                       animated:YES
                     completion:nil];
}

#pragma mark - Private

-(UIAlertController *)hrAlertControllerWithTitle:(NSString *)title
                                         message:(NSString *)message
                                   buttonsTitles:(NSArray *)titles
                                 andActionHandler:(nullable void(^)(NSInteger indexOfAction, NSString * _Nonnull title))handler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    for (NSString *title in titles) {
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:title
                                                              style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                                                  if (handler) {
                                                                      handler([alertController.actions indexOfObject:action], action.title);
                                                                  }
                                                              }];
        [alertController addAction:alertAction];
    }
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        [alertController setModalPresentationStyle:UIModalPresentationPopover];
        UIPopoverPresentationController *popPresenter = [alertController popoverPresentationController];
        if (popPresenter) {
            CGRect rect = self.view.frame;
            
            rect.origin.x = self.view.frame.size.width / 2 - 100;
            rect.origin.y = self.view.frame.size.height / 2 - 100;
            rect.size.width = 200;
            rect.size.height = 200;
            popPresenter.sourceView = self.view;
            popPresenter.sourceRect = rect;
            popPresenter.permittedArrowDirections = UIPopoverArrowDirectionUnknown;
            [popPresenter setPermittedArrowDirections:0];
        }
    }
    return alertController;
}

-(UIAlertController *)hrAlertControllerWithTitle:(NSString *)title
                                   buttonsTitles:(NSArray *)titles
                                andActionHandler:(nullable void(^)(NSInteger indexOfAction, NSString * _Nonnull title))handler {
    return [self hrAlertControllerWithTitle:title
                                    message:nil
                              buttonsTitles:titles
                           andActionHandler:handler];
}

-(UIAlertController *)hrAlertControllerWithMessage:(NSString *)message
                                   buttonsTitles:(NSArray *)titles
                                andActionHandler:(nullable void(^)(NSInteger indexOfAction, NSString * _Nonnull title))handler {
    return [self hrAlertControllerWithTitle:nil
                                    message:message
                              buttonsTitles:titles
                           andActionHandler:handler];
}

-(UIAlertController *)hrAlertControllerWithTitles:(NSArray *)titles
                               andActionHandler:(nullable void(^)(NSInteger indexOfAction, NSString * _Nonnull title))handler {
    return [self hrAlertControllerWithTitle:nil
                                    message:nil
                              buttonsTitles:titles
                           andActionHandler:handler];
}

@end
