//
//  ThirdViewController.m
//  Less_8_UIElements
//
//  Created by Andrey Proskurin on 05.09.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)backActionButton:(UIButton *)sender {
//    [self.navigationController popToRootViewControllerAnimated:YES];
    
    NSArray *viewControllers = self.navigationController.viewControllers; // возвращение массива всех viewControllers
    
    UIViewController *firstVC = viewControllers[1];
    
    [self.navigationController popToViewController:firstVC animated:YES];
}


@end
