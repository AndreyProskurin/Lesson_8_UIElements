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

- (instancetype)initWithCoffeeName:(NSString *)coffeeName coffeePrice:(NSNumber *)coffeePrice CoffeeDescription:(NSString *)coffeeDescription coffeeImage:(UIImage *)coffeeImage {
    
    self = [super init];
    if (self) {
        _coffeeName = coffeeName;
        _coffeePrice = coffeePrice;
        _coffeeDescription = coffeeDescription;
        _coffeeImage = coffeeImage;
    }
    return self;
}

+ (NSArray *)coffeeNameArray {
    return @[@"Cappuccino", @"Mocha", @"Latte", @"Americano",
             @"Macchiato", @"Espresso", @"Ristretto", @"Doppio"];
}

+ (NSArray *)coffeePriceArray {
    return @[@(17), @(15), @(18), @(13),
             @(16), @(12), @(17), @(20)];
}

+ (NSDictionary *)coffeeDescriptionDictionary {
    
    NSString *cappucinoDescription = @"One of the most popular espresso drinks, a cappuccino done right should be equal parts espresso, steamed milk and foamed milk (about 60 ml each).";
    NSString *mochaDescription = @"With 60 ml of espresso, 60 ml of chocolate and 30 ml of steamed milk, a mocha is a the right choice if you want something sweet.";
    NSString *latteDescription = @"The latte gets its name because it’s full of milk. It is generally just a 60 ml shot of espresso with 300 ml steamed milk — and only 2ml foamed milk.";
    NSString *americanoDescription = @"If you like the taste of espresso, but don’t like how quickly it goes you’d be happy with an Americano. It’s a shot of espresso (30 ml) with twice the amount of water (60 ml).";
    NSString *macchiatoDescription = @"With a macchiato you get a shot of espresso (or sometimes two) with just a dot of foamed milk.";
    NSString *espressoDescription = @"A small shot of caffeine — but more than enough to get the job done — usually about 30 ml.";
    NSString *ristrettoDescription = @"A ristretto is the coffee choice for those who like to get straight to the point. It’s a very concentrated espresso shot — only 22 ml.";
    NSString *doppioDescription = @"Doppio means double in Italian, and that’s exactly what you get with espresso. Rather than the expected 30 ml shot of espresso, a doppio gets you a 60 ml shot.";
    
    NSArray *descriptionArray = @[cappucinoDescription, mochaDescription, latteDescription, americanoDescription,
                                  macchiatoDescription, espressoDescription, ristrettoDescription, doppioDescription];
    
    NSMutableDictionary *coffeeDescriptionDictionary = [NSMutableDictionary dictionary];
    
    for (NSUInteger i = 0; i < descriptionArray.count; i++) {
        
        [coffeeDescriptionDictionary setObject:[descriptionArray objectAtIndex:i]
                                        forKey:[[CoffeeModel coffeeNameArray] objectAtIndex:i]];
    }
    
    return coffeeDescriptionDictionary;
}

- (NSMutableArray *)coffeeList {
    
    if (!_coffeeList) {
        _coffeeList = [[NSMutableArray alloc] init];
        for (NSUInteger i = 0; i < [[CoffeeModel coffeeNameArray] count]; i++) {
            
            NSString *currentCoffeeName = [[CoffeeModel coffeeNameArray] objectAtIndex:i];
            NSNumber *currentCoffeePrice = [[CoffeeModel coffeePriceArray] objectAtIndex:i];
            NSString *currentCoffeeDescription = [[CoffeeModel coffeeDescriptionDictionary] objectForKey:currentCoffeeName];
            UIImage *coffeeImage = [UIImage imageNamed:currentCoffeeName];
            
            CoffeeModel *coffeeModel = [[CoffeeModel alloc] initWithCoffeeName:currentCoffeeName
                                                                   coffeePrice:currentCoffeePrice
                                                             CoffeeDescription:currentCoffeeDescription
                                                                   coffeeImage:coffeeImage];
            
            [_coffeeList addObject:coffeeModel];
        }
    }
    
    return _coffeeList;
}

@end
