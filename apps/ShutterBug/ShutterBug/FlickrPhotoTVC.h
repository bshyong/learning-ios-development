//
//  FlickrPhotoTVC.h
//  ShutterBug
//
//  Created by Benjamin Shyong on 10/23/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//
//  Will call setImageURL: as part of any "Show Image" segue

#import <UIKit/UIKit.h>

@interface FlickrPhotoTVC : UITableViewController
  @property (nonatomic, strong) NSArray *photos; // array of NSDictionaries
@end
