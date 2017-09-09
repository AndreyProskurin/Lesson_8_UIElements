//
//  CoffeeModel.h
//  Less_8_UIElements
//
//  Created by Andrey Proskurin on 09.09.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoffeeModel : NSObject

@property (strong, nonatomic) NSString *coffeeName;
@property (strong, nonatomic) NSNumber *coffeePrice;
@property (strong, nonatomic) NSString *coffeeDescription;

@property (strong, nonatomic) NSMutableArray *coffeeList;

@end
