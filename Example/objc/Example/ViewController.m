//
//  ViewController.m
//  Example
//
//  Created by Soumen Bhuin on 28/07/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

#import "ViewController.h"
#import <SBSpinnerView/SBSpinnerView.h>

@interface ViewController ()
@property (nonatomic, strong) IBOutlet SBSpinnerView *spinner;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.spinner.color = [UIColor redColor];
    [self.spinner startAnimating];
}


@end
