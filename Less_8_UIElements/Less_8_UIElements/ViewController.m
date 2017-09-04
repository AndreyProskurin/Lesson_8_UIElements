//
//  ViewController.m
//  Less_8_UIElements
//
//  Created by Andrey Proskurin on 01.09.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "ViewController.h"



@interface ViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewTopConstraint;
@property (strong, nonatomic) NSArray *arrayOfTextFields;

@end

@implementation ViewController

- (IBAction)backgroundTapped:(UIView *)sender {
    [self.view endEditing:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayOfTextFields = @[self.firstNameTextField,
                               self.lastNameTextField,
                               self.emailTextField,
                               self.phoneNumberTextField,
                               self.passwordTextField,
                               self.confirmPasswordTextField];

}

#pragma mark - Keyboard -

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardDidShow:(NSNotification *)notification {
    NSValue *value = [notification.userInfo valueForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect keyboardframe = [value CGRectValue];
    self.contentViewTopConstraint.constant = 325.f - keyboardframe.size.height;
}

- (void)keyboardDidHide:(NSNotification *)notification {
    self.contentViewTopConstraint.constant = 206.f;
}

#pragma mark - textField -

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    for (NSUInteger i = 0; i < self.arrayOfTextFields.count - 1; i++) {
        if ([textField isEqual:[self.arrayOfTextFields objectAtIndex:i]]) {
            [[self.arrayOfTextFields objectAtIndex:i+1] becomeFirstResponder];
        } else {
            [textField resignFirstResponder];
        }

    }
    return NO;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    if (textField.tag == self.emailTextField.tag && ![self.emailTextField.text containsString:@"@"]) {
        self.infoLabel.text = @"E-mail is not correct.";
        return NO;
    }
    
    if (textField.tag == self.confirmPasswordTextField.tag && !([self.confirmPasswordTextField.text isEqualToString:self.passwordTextField.text])) {
        self.infoLabel.text = @"Passwords are not matched!";
        return NO;
    } else if ([self.confirmPasswordTextField.text isEqualToString:self.passwordTextField.text]) {
        self.infoLabel.text = @"Passwords are matched!";
        return YES;
    } else {
        return YES;
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    for (NSUInteger i = 0; i < self.arrayOfTextFields.count; i++) {
        if ([textField isEqual:[self.arrayOfTextFields objectAtIndex:i]]) {
            self.infoLabel.text = [NSString stringWithFormat:@"Enter your %@", [[self.arrayOfTextFields objectAtIndex:i] placeholder]];
            
            if ([textField isEqual:self.confirmPasswordTextField]) {
                self.infoLabel.text = @"Confirm your password";
            } else if ([textField isEqual:self.phoneNumberTextField]) {
                self.infoLabel.text = @"Enter your phone number";
            }
        }
        
    }

}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
}



@end
