//
//  PlayingCard.h
//  MemoryGame
//
//  Created by Benjamin Shyong on 10/10/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
  @property (strong, nonatomic) NSString *suit;
  @property (nonatomic) NSUInteger rank;
  + (NSArray *)validSuits;
  + (NSUInteger)maxRank;
@end
