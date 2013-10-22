//
//  CardDisplayViewController.h
//  CardViewer
//
//  Created by Benjamin Shyong on 10/22/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardDisplayViewController : UIViewController
  @property (nonatomic) NSUInteger rank;
  @property (nonatomic, strong) NSString *suit;
@end
