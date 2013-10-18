//
//  MemoryGameViewController.h
//  MemoryGame
//
//  Created by Benjamin Shyong on 10/10/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface MemoryGameViewController : UIViewController
  - (Deck *)createDeck; //abstract
  @property (nonatomic)NSUInteger startingCardCount;
  -(void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card;
@end
