//
//  FISViewController.m
//  Open-Me
//
//  Created by Joe Burgess on 3/4/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()
@property (strong, nonatomic) IBOutlet UIView *buttonsContainer;
@property (weak, nonatomic) IBOutlet UIView *textFieldContainer;
@property (weak, nonatomic) IBOutlet UITextField *outputTextField;
@property (strong, nonatomic) IBOutlet UIButton *oneButton;
@property (strong, nonatomic) IBOutlet UIButton *twoButton;
@property (strong, nonatomic) IBOutlet UIButton *threeButton;
@property (strong, nonatomic) IBOutlet UIButton *fourButton;
@property (strong, nonatomic) IBOutlet UIButton *fiveButton;
@property (strong, nonatomic) IBOutlet UIButton *sixButton;
@property (strong, nonatomic) IBOutlet UIButton *sevenButton;
@property (strong, nonatomic) IBOutlet UIButton *eightButton;
@property (strong, nonatomic) IBOutlet UIButton *nineButton;
@property (strong, nonatomic) IBOutlet UIButton *zeroButton;
@property (strong, nonatomic) IBOutlet UIButton *divideButton;
@property (strong, nonatomic) IBOutlet UIButton *multiplyButton;
@property (strong, nonatomic) IBOutlet UIButton *subtractionButton;
@property (strong, nonatomic) IBOutlet UIButton *additionButton;
@property (strong, nonatomic) IBOutlet UIButton *equalButton;
@property (strong, nonatomic) IBOutlet UIButton *decimalButton;
@property (strong, nonatomic) NSDictionary *viewsDictionary;
@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.view removeConstraints:self.view.constraints];
    
    self.viewsDictionary = @{ @"bottomContainer": self.buttonsContainer,
                              @"topContainer": self.textFieldContainer,
                              @"output" : self.outputTextField,
                              @"one" : self.oneButton,
                              @"two" : self.twoButton,
                              @"three" : self.threeButton,
                              @"four" : self.fourButton,
                              @"five" : self.fiveButton,
                              @"six" : self.sixButton,
                              @"seven" : self.sevenButton,
                              @"eight" : self.eightButton,
                              @"nine" : self.nineButton,
                              @"zero" : self.zeroButton,
                              @"divide" : self.divideButton,
                              @"multiply" : self.multiplyButton,
                              @"subtract" : self.subtractionButton,
                              @"addition" : self.additionButton,
                              @"equal" : self.equalButton,
                              @"decimal" : self.decimalButton };
    
    for (UIView *view in self.viewsDictionary.allValues) {
        [self prepareViewForAutolayout:view];
    }
    
    [self addContainerConstraints];
    [self addTextFieldConstraints];
    [self addButtonConstrains];
    
}

- (void)addContainerConstraints
{
    NSArray *HtopContainerConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[topContainer]|"
                                                                               options:0
                                                                               metrics:nil
                                                                                 views:self.viewsDictionary];
    
    [self.view addConstraints:HtopContainerConstraint];
    
    NSArray *HbottomContainerConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[bottomContainer]|"
                                                                                  options:0
                                                                                  metrics:nil
                                                                                    views:self.viewsDictionary];
    
    [self.view addConstraints:HbottomContainerConstraint];
    
    NSArray *VContainerConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topContainer][bottomContainer(==topContainer)]|"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:self.viewsDictionary];
    
    [self.view addConstraints:VContainerConstraints];
}

- (void)addTextFieldConstraints
{
    NSArray *HtextField = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[output]-20-|"
                                                                  options:0
                                                                  metrics:nil
                                                                    views:self.viewsDictionary];
    
    [self.textFieldContainer addConstraints:HtextField];
    
    NSArray *VtextField = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[output]"
                                                                  options:0
                                                                  metrics:nil
                                                                    views:self.viewsDictionary];
    
    [self.textFieldContainer addConstraints:VtextField];
}

- (void)addButtonConstrains
{
    // code Refactored
    
    [self addButtonRowConstraints:@[self.viewsDictionary[@"one"], self.viewsDictionary[@"two"], self.viewsDictionary[@"three"], self.viewsDictionary[@"divide"]]
                       horizontal:YES];
    
    [self addButtonRowConstraints:@[self.viewsDictionary[@"four"], self.viewsDictionary[@"five"], self.viewsDictionary[@"six"], self.viewsDictionary[@"multiply"]]
                       horizontal:YES];
    
    [self addButtonRowConstraints:@[self.viewsDictionary[@"seven"], self.viewsDictionary[@"eight"], self.viewsDictionary[@"nine"], self.viewsDictionary[@"subtract"]]
                       horizontal:YES];
    
    [self addButtonRowConstraints:@[self.viewsDictionary[@"zero"], self.viewsDictionary[@"decimal"], self.viewsDictionary[@"equal"], self.viewsDictionary[@"addition"]]
                       horizontal:YES];
    
    [self addButtonRowConstraints:@[self.viewsDictionary[@"one"], self.viewsDictionary[@"four"], self.viewsDictionary[@"seven"], self.viewsDictionary[@"zero"]]
                       horizontal:NO];
    
    [self addButtonRowConstraints:@[self.viewsDictionary[@"two"], self.viewsDictionary[@"five"], self.viewsDictionary[@"eight"], self.viewsDictionary[@"decimal"]]
                       horizontal:NO];
    
    [self addButtonRowConstraints:@[self.viewsDictionary[@"three"], self.viewsDictionary[@"six"], self.viewsDictionary[@"nine"], self.viewsDictionary[@"equal"]]
                       horizontal:NO];
    
    [self addButtonRowConstraints:@[self.viewsDictionary[@"divide"], self.viewsDictionary[@"multiply"], self.viewsDictionary[@"subtract"], self.viewsDictionary[@"addition"]]
                       horizontal:NO];
    
    
//    NSArray *HfirstRowConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[one][two(==one)][three(==one)][divide(==one)]|"
//                                                                           options:0
//                                                                           metrics:nil
//                                                                             views:self.viewsDictionary];
//    [self.buttonsContainer addConstraints:HfirstRowConstraint];
//    
//    NSArray *HsecondRowConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[four(==one)][five(==one)][six(==one)][multiply(==one)]|"
//                                                                            options:0
//                                                                            metrics:nil
//                                                                              views:self.viewsDictionary];
//    [self.buttonsContainer addConstraints:HsecondRowConstraint];
//    
//    NSArray *HthirdRowConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[seven(==one)][eight(==one)][nine(==one)][subtract(==one)]|"
//                                                                           options:0
//                                                                           metrics:nil
//                                                                             views:self.viewsDictionary];
//    [self.buttonsContainer addConstraints:HthirdRowConstraint];
//    
//    NSArray *HfourthRowConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[zero(==one)][decimal(==one)][equal(==one)][addition(==one)]|"
//                                                                            options:0
//                                                                            metrics:nil
//                                                                              views:self.viewsDictionary];
//    [self.buttonsContainer addConstraints:HfourthRowConstraint];
    
//    
//    NSArray *VfirstColumnConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[one][four(==one)][seven(==one)][zero(==one)]|"
//                                                                              options:0
//                                                                              metrics:nil
//                                                                                views:self.viewsDictionary];
//    [self.buttonsContainer addConstraints:VfirstColumnConstraint];
//    
//    NSArray *VsecondColumnConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[two(==one)][five(==one)][eight(==one)][decimal(==one)]|"
//                                                                               options:0
//                                                                               metrics:nil
//                                                                                 views:self.viewsDictionary];
//    [self.buttonsContainer addConstraints:VsecondColumnConstraint];
//    
//    NSArray *VthirdColumnConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[three(==one)][six(==one)][nine(==one)][equal(==one)]|"
//                                                                              options:0
//                                                                              metrics:nil
//                                                                                views:self.viewsDictionary];
//    [self.buttonsContainer addConstraints:VthirdColumnConstraint];
//    
//    NSArray *VfourthColumnConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[divide(==one)][multiply(==one)][subtract(==one)][addition(==one)]|"
//                                                                               options:0
//                                                                               metrics:nil
//                                                                                 views:self.viewsDictionary];
//    [self.buttonsContainer addConstraints:VfourthColumnConstraint];

    
}

- (void)addButtonRowConstraints:(NSArray *)views horizontal:(BOOL)horizontal
{
    NSDictionary *localViewDictionary = @{ @"view1" : views[0],
                                           @"view2" : views[1],
                                           @"view3" : views[2],
                                           @"view4" : views[3]  };
    NSString *visualFormat = @"";
    if (horizontal) {
        visualFormat = @"H:|[view1][view2(==view1)][view3(==view1)][view4(==view1)]|";
    } else {
        visualFormat = @"V:|[view1][view2(==view1)][view3(==view1)][view4(==view1)]|";
    }
    
    NSArray *localConstraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat
                                                                        options:0
                                                                        metrics:nil
                                                                          views:localViewDictionary];
    [self.buttonsContainer addConstraints:localConstraints];
}

- (void)prepareViewForAutolayout:(UIView *)view
{
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [view removeConstraints:view.constraints];
}

@end
