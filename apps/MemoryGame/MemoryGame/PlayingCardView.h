//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Benjamin Shyong on 10/17/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) BOOL faceUp;

- (void)pinch:(UIPinchGestureRecognizer *)gesture;

@end
