//
//  LeePhoneTextField.m
//  PhoneTextField
//
//  Created by Lee on 2017/12/26.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "LeePhoneTextField.h"

@interface LeePhoneTextField()<UITextFieldDelegate>



@end

@implementation LeePhoneTextField

-(void)awakeFromNib{
    [super awakeFromNib];
    self.delegate = self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.delegate = self;
    }
    return self;
}


#pragma mark - override
-(NSString *)text{
    if ([super text].length >= 13) {
        return [[super text] stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    return [super text];
}

-(void)setText:(NSString *)text{
    if(!self.isFirstResponder){
        NSMutableString *inputText = [[text stringByReplacingOccurrencesOfString:@" " withString:@""] mutableCopy];
        if ([self verificationText:inputText]) {
            [inputText insertString:@" " atIndex:3];
            [inputText insertString:@" " atIndex:8];
            [super setText:inputText];
            return;
        }
        [super setText:@""];
    }else{
        [super setText:text];
    }
    
    

}

-(BOOL)verificationText:(NSString *)text{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self matches %@", @"^\\d{11}$"];
    return [predicate evaluateWithObject:text];
}


#pragma mark - delegate

//-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
//    if (action == @selector(paste:)) {
//        return NO;
//    }
//    return [super canPerformAction:action withSender:sender];
//}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSString *regexStr = @"^\\d?$";
    NSPredicate *dicate = [NSPredicate predicateWithFormat:@"self matches %@", regexStr];
    if ((range.location == 3 || range.location == 8) && range.length == 0) {
        textField.text = [textField.text stringByAppendingString:@" "];
    }
    if (range.length > 0 && (range.location == 4 || range.location == 9)) {
        textField.text = [textField.text substringToIndex:range.location];
    }
    return ([dicate evaluateWithObject:string] || range.length > 0) && range.location <= 12;
    
}




@end
