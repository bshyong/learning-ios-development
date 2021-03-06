//
//  Card.h
//  MemoryGame
//
//  Created by Benjamin Shyong on 10/10/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

  @property (strong, nonatomic) NSString * contents;
  @property (nonatomic, getter = isFaceUp) BOOL faceUp;
  @property (nonatomic, getter = isUnplayable) BOOL unplayable;

  - (int)match:(NSArray *)otherCards;

@end
