//
//  ResultsViewController.h
//  Sonar
//
//  Created by Aula1 on 25/01/16.
//  Copyright (c) 2016 Grupo 1. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CoasterViewControllerDelegate

-(void) editionDidFinished;

@end

@interface CoasterViewController : UIViewController

@property (nonatomic) int idCoasterSelected;

@property (nonatomic, strong) id <CoasterViewControllerDelegate> delegate;

@end
