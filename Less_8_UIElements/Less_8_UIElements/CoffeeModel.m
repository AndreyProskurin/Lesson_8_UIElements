//
//  CoffeeModel.m
//  Less_8_UIElements
//
//  Created by Andrey Proskurin on 09.09.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "CoffeeModel.h"

@interface CoffeeModel ()



@end

@implementation CoffeeModel

- (NSMutableArray *)coffeeList {
    
    if (!_coffeeList) {
        _coffeeList = [NSMutableArray arrayWithObjects:@"Cappucino", @"Mocha", @"Latte",
                                                       @"Americano", @"Macchiato", @"Espresso",
                                                       @"Ristretto", @"Doppio", nil];
    }
    
    return _coffeeList;
}

@end
