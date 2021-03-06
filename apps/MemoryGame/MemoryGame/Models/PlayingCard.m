//
//  PlayingCard.m
//  MemoryGame
//
//  Created by Benjamin Shyong on 10/10/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

  -(int)match:(NSArray *)otherCards{
    int score = 0;
    if([otherCards count] == 1){
      id otherCard = [otherCards lastObject];
      if ([otherCard isKindOfClass:[PlayingCard class]]) {
        PlayingCard *otherCard = [otherCards lastObject];
        if ([otherCard.suit isEqualToString:self.suit]) {
          score = 1;
        }else if (otherCard.rank == self.rank){
          score = 4;
        }
      }
    }
    return score;
  }

  - (NSString *)contents{
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
  }

  // must synthesize suit since we implemented both setter and getter
  @synthesize suit = _suit;

  + (NSArray *)validSuits{
    static NSArray *validSuits = nil;
    if (!validSuits) validSuits = @[@"♥", @"♦", @"♠", @"♣"];
    return validSuits;
  }

  - (void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit]) {
      _suit = suit;
    }
  }

  - (NSString *)suit{
    return _suit ? _suit : @"?";
  }

  + (NSArray *)rankStrings{
    static NSArray *rankStrings = nil;
    if(!rankStrings) rankStrings = @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
    return rankStrings;
  }

  + (NSUInteger)maxRank{
    return [self rankStrings].count -1;
  }

  - (void)setRank:(NSUInteger)rank{
    if (rank <= [PlayingCard maxRank]){
      _rank = rank;
    }
  }
@end
