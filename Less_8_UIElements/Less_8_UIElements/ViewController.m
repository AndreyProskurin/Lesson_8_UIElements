//
//  ViewController.m
//  Less_8_UIElements
//
//  Created by Andrey Proskurin on 01.09.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "ViewController.h"
#import "CoffeeModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *coffeeImageView;
@property (weak, nonatomic) IBOutlet UITextView *coffeeDescriptionTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.coffeeModel)
    {
        self.navigationItem.title = self.coffeeModel.coffeeName;
        self.coffeeDescriptionTextView.text = self.coffeeModel.coffeeDescription;
        
        if (self.coffeeModel.coffeeImage)
        {
            self.coffeeImageView.image = self.coffeeModel.coffeeImage;
        }
    }

    
}

@end
