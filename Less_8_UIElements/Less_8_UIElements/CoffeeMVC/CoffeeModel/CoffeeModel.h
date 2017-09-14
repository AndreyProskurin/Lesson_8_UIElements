//
//  CoffeeModel.h
//  Less_8_UIElements
//
//  Created by Andrey Proskurin on 07.09.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoffeeModel : NSObject

@property (strong, nonatomic) NSMutableArray *coffeeModelsArray;

+ (NSMutableArray *)listOfCoffees;
- (void)refreshDataList:(NSArray *)dataList;

@end
