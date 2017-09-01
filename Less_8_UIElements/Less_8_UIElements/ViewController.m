//
//  ViewController.m
//  Less_8_UIElements
//
//  Created by Andrey Proskurin on 01.09.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "ViewController.h"

typedef struct {
    
    CGFloat weight;
    NSUInteger age;
    
} Person;

@interface ViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    NSString *someString = @"I will be iOS developer";
    
    NSRange range = NSMakeRange(2, 4);
    NSString *resultString = [someString substringWithRange:range];
    NSLog(@"%@", resultString);
    
    Person person;
    person.age = 20;
    person.weight = 76;
    
    if (textField.tag == 5) {
        
        CGRect frame = textField.frame;
        
        frame.origin.y = self.emailTextField.frame.origin.y + self.emailTextField.frame.size.height + 40;
        
        textField.frame = frame;
    }
    
    
    
    NSLog(@"\ntextFieldDidBeginEditing\n");
    if (textField.tag == 5) {
        textField.secureTextEntry = YES;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"\ntextFieldDidEndEditing\n");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // автоматический переход между textField-ами
    if (textField.tag == 5) {
        [self.emailTextField becomeFirstResponder];
    } else {
        [self.passwordTextField becomeFirstResponder];
    }
    NSLog(@"\ntextFieldShouldReturn\n");
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (textField.text.length < 5) {
        return NO;
    }
    NSLog(@"\ntextFieldShouldEndEditing\n");
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField.tag == 5) {
        if (self.emailTextField.text.length < 5) {
            return NO;
        }
    }
    NSLog(@"\ntextFieldShouldBeginEditing\n");
    return YES;
}

// основной метод (вызывается во время редактирования [во время изменения текстового поля])
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSLog(@"\nshouldChangeCharactersInRange\n");
    
    if ([string isEqualToString:@"+"]) {
        return NO;
    }
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    return YES;
}


@end
