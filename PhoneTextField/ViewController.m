//
//  ViewController.m
//  PhoneTextField
//
//  Created by Lee on 2017/12/26.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "ViewController.h"
#import "LeePhoneTextField.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet LeePhoneTextField *phoneTextField;

@end

@implementation ViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.phoneTextField.text = @"13262296892";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
