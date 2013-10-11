//
//  Card.m
//  MemoryGame
//
//  Created by Benjamin Shyong on 10/10/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import "Card.h"

@implementation Card
  -(int)match:(NSArray *)otherCards{
    int score = 0;
    
    for (Card *card in otherCards) {
      if ([card.contents isEqualToString:self.contents]) {
        score = 1;
      }
    }
    return score;
  }
@end
