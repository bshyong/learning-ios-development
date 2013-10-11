//
//  Deck.h
//  MemoryGame
//
//  Created by Benjamin Shyong on 10/10/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

  - (void)addCard:(Card *)card atTop:(BOOL)atTop;
  - (Card *)drawRandomCard;

@end
