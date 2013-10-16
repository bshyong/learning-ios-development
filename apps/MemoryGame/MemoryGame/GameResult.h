//
//  GameResult.h
//  MemoryGame
//
//  Created by Benjamin Shyong on 10/16/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject

+ (NSArray *)allGameResults;

@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (readonly, nonatomic) NSTimeInterval duration;
@property (nonatomic) int score;


@end
