//
//  GameViewController.m
//  Fun Multiplications For Kids
//
//  Created by Thanh Dao on 4/16/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "GameViewController.h"
#import "Question.h"
#import "FruitView.h"

#define MAX_QUESTION_NUMBER 10



#define QUESTION_NUMBER_LABEL_Y 10 
#define QUESTION_NUMBER_LABEL_HEIGH 20
#define QUESTION_NUMBER_LABEL_WIDTH 125
#define LEVEL_LABEL_WIDTH 70
#define SCORE_LABEL_WIDTH 85

#define QUESTION_LABEL_WIDTH 50
#define QUESTION_LABEL_HEIGH 50
#define QUESTION_LABEL_X 22
#define QUESTION_LABEL_Y 50
#define DISTANCE_BETWEEN_QUESTION_LABEL 5

#define FRUIT_VIEW_WIDTH 320
#define FRUIT_VIEW_HEIGHT 320
#define FRUIT_VIEW_X      0
#define FRUIT_VIEW_Y      90

#define RESULT_BUTTON_ONE_X 30
#define RESULT_BUTTON_TWO_X 130
#define RESULT_BUTTON_THREE_X 230
#define RESULT_BUTTON_Y 420 
#define RESULT_BUTTON_WIDTH 60
#define RESULT_BUTTON_HEIGH 40

#define RESULT_BUTTON_NUMBER 3

#define PERFECT_SCORE 100
#define PASS_SCORE 60

static int _totalScore;
@interface GameViewController ()
{
    NSArray *_questionArray;
    int _questionNum;
    UIButton *_resultButton[RESULT_BUTTON_NUMBER];
}
@property (nonatomic, assign) int levelScore;
@property (nonatomic, strong) UIButton *backButton;

@property (nonatomic, strong) UIImageView *backGroundImage;
@property (nonatomic, strong) FruitView *fruitView;
@property (nonatomic, strong) UIImageView *resultLevelView;

@property (nonatomic, strong) NSArray *levelDescriptionArray;

@property (nonatomic, strong) UILabel *questionNumLabel;
@property (nonatomic, strong) UILabel *levelNumLabel;
@property (nonatomic, strong) UILabel *scoreLabel;
@property (nonatomic, strong) UILabel *operandOneLabel;
@property (nonatomic, strong) UILabel *operandTwoLabel;
@property (nonatomic, strong) UILabel *operatorLabel;
@property (nonatomic, strong) UILabel *equalLabel;
@property (nonatomic, strong) UILabel *resultLabel;
@property (nonatomic, strong) UILabel *resultMessageLabel;

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, strong) NSString *soundFilePath;

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.levelScoreArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 11; i++) {
            [self.levelScoreArray addObject: [NSNumber numberWithInt: 0]];
        }
        NSString *dataPath   = [[NSBundle mainBundle]
                                pathForResource: @"LevelDescription"
                                         ofType: @"plist"];
        _levelDescriptionArray= [[NSMutableArray alloc] initWithContentsOfFile: dataPath];

    }
    return self;
}

- (void)setBackGroundImage{
    // Back ground Image
    _backGroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backGround.jpg"]];
    _backGroundImage.frame = self.view.bounds;
    [_backGroundImage setContentMode: UIViewContentModeScaleToFill];
    [self.view addSubview:_backGroundImage];
}

- (void)setBackButton{
    // Create back Button
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_backButton];
    _backButton.frame = CGRectMake(BACK_BUTTON_X, BACK_BUTTON_Y, BACK_BUTTON_WIDTH, BACK_BUTTON_HEIGH);
    [_backButton setImage:[UIImage imageNamed:@"backButton.png"]
                 forState:UIControlStateNormal];
    [_backButton addTarget:self
                    action:@selector(backHome:)
          forControlEvents:UIControlEventTouchUpInside];
}

- (void)setGameInformation{
    // Create game information label
    NSString *questionNumString = [NSString stringWithFormat:@"Question: %d/%d", _questionNum, MAX_QUESTION_NUMBER];
    _questionNumLabel = [[UILabel  alloc] initWithFrame:CGRectMake(_backButton.frame.size.width, QUESTION_NUMBER_LABEL_Y, QUESTION_NUMBER_LABEL_WIDTH, QUESTION_NUMBER_LABEL_HEIGH)];
    [self.questionNumLabel setText:questionNumString];
    _questionNumLabel.textColor = [UIColor whiteColor];

    self.questionNumLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.questionNumLabel];
    
    NSString *levelString = [NSString stringWithFormat:@"Level %d", self.level];
    _levelNumLabel = [[UILabel  alloc] initWithFrame:CGRectMake(_backButton.frame.size.width + _questionNumLabel.frame.size.width,QUESTION_NUMBER_LABEL_Y, LEVEL_LABEL_WIDTH, QUESTION_NUMBER_LABEL_HEIGH)];
    _levelNumLabel.text = levelString;
    _levelNumLabel.textColor = [UIColor whiteColor];
    _levelNumLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_levelNumLabel];
    
    _scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(_backButton.frame.size.width + _questionNumLabel.frame.size.width + _levelNumLabel.frame.size.width,QUESTION_NUMBER_LABEL_Y, SCORE_LABEL_WIDTH, QUESTION_NUMBER_LABEL_HEIGH)];
    NSString *scoreString = [NSString stringWithFormat:@"Score: %d", _levelScore];
    _scoreLabel.text = scoreString;
    _scoreLabel.textColor = [UIColor whiteColor];
    _scoreLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_scoreLabel];
    
    //NSString *gameInformationString
}

- (void)setQuestionLabels{
    // Create question Label CGRect
    CGRect operandOneLabelCGRect = CGRectMake(QUESTION_LABEL_X, QUESTION_LABEL_Y, QUESTION_LABEL_WIDTH, QUESTION_LABEL_HEIGH);
    CGRect operatorLabelCGRect   = CGRectMake(operandOneLabelCGRect.origin.x + operandOneLabelCGRect.size.width + DISTANCE_BETWEEN_QUESTION_LABEL,QUESTION_LABEL_Y, QUESTION_LABEL_WIDTH, QUESTION_LABEL_HEIGH);
    CGRect operandTwoLabelCGRect = CGRectMake(operatorLabelCGRect.origin.x + operatorLabelCGRect.size.width + DISTANCE_BETWEEN_QUESTION_LABEL,QUESTION_LABEL_Y, QUESTION_LABEL_WIDTH, QUESTION_LABEL_HEIGH);
    CGRect equalLabelCGRect = CGRectMake(operandTwoLabelCGRect.origin.x + operandTwoLabelCGRect.size.width + DISTANCE_BETWEEN_QUESTION_LABEL,QUESTION_LABEL_Y, QUESTION_LABEL_WIDTH, QUESTION_LABEL_HEIGH);
    CGRect resultLabelCGRect = CGRectMake(equalLabelCGRect.origin.x + equalLabelCGRect.size.width + DISTANCE_BETWEEN_QUESTION_LABEL,QUESTION_LABEL_Y, QUESTION_LABEL_WIDTH + DISTANCE_BETWEEN_QUESTION_LABEL, QUESTION_LABEL_HEIGH);
    
    // Operand One Label
    NSString *operandOneString = [NSString stringWithFormat:@"%d", self.level + 1];
    _operandOneLabel = [[UILabel alloc] initWithFrame: operandOneLabelCGRect];
    _operandOneLabel.text = operandOneString;
    _operandOneLabel.textColor = [UIColor whiteColor];
    _operandOneLabel.font = [UIFont fontWithName: @"TrebuchetMS-Bold" size:30];
    _operandOneLabel.textAlignment = NSTextAlignmentCenter;
    _operandOneLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_operandOneLabel];
    
    // Operand Two label
    NSString *operandTwoString = [NSString stringWithFormat:@"%d", self.question.operandTwo];
    _operandTwoLabel = [[UILabel alloc] initWithFrame: operandTwoLabelCGRect];
    _operandTwoLabel.text = operandTwoString;
    _operandTwoLabel.textColor = [UIColor whiteColor];
    _operandTwoLabel.font = [UIFont fontWithName: @"TrebuchetMS-Bold" size:30];
    _operandTwoLabel.textAlignment = NSTextAlignmentCenter;
    _operandTwoLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_operandTwoLabel];
    
    // Operator label
    _operatorLabel = [[UILabel alloc] initWithFrame: operatorLabelCGRect];
    _operatorLabel.text = @"X";
    _operatorLabel.textColor = [UIColor whiteColor];
    _operatorLabel.font = [UIFont fontWithName: @"TrebuchetMS-Bold" size:24];
    _operatorLabel.textAlignment = NSTextAlignmentCenter;
    _operatorLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_operatorLabel];
    
    // Equal label
    _equalLabel = [[UILabel alloc] initWithFrame: equalLabelCGRect];
    _equalLabel.text = @"=";
    _equalLabel.textColor = [UIColor whiteColor];
    _equalLabel.font = [UIFont fontWithName: @"TrebuchetMS-Bold" size:24];
    _equalLabel.textAlignment = NSTextAlignmentCenter;
    _equalLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_equalLabel];
    
    //Result Label
    _resultLabel = [[UILabel alloc] initWithFrame: resultLabelCGRect];
    _resultLabel.text = @"?";
    _resultLabel.textColor = [UIColor whiteColor];
    _resultLabel.font = [UIFont fontWithName: @"TrebuchetMS-Bold" size:30];
    _resultLabel.textAlignment = NSTextAlignmentCenter;
    _resultLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_resultLabel];
}

- (void)generateQuestion{
    
    self.question = [[Question alloc] initWithQuestionAtLevel: self.level + 1];

}

- (void)viewWillAppear:(BOOL)animated{
    [self setBackGroundImage];

    //Generate question
    _questionNum += 1;
    self.question.operandTwo = [[self.question.operandTwoArray objectAtIndex: _questionNum] intValue];
    
    int imageIndex = _questionNum % [self.question.operandTwoImageArray count];
    NSString *operandTwoImageString = [self.question.operandTwoImageArray objectAtIndex: imageIndex];
    _question.operandTwoImage = [UIImage imageNamed: operandTwoImageString];
     
    
    [self setQuestionLabels];
    [self setBackButton];
    [self setGameInformation];
    
    // Create Fruit View
    CGRect fruitViewRect = CGRectMake(FRUIT_VIEW_X, FRUIT_VIEW_Y, FRUIT_VIEW_WIDTH, FRUIT_VIEW_HEIGHT);
    self.fruitView = [[FruitView alloc] initWithFrame: fruitViewRect
                                          andQuestion: self.question];
    [self.view addSubview: self.fruitView];
    
    CGRect resultButtonFrame[3];
    resultButtonFrame[0] = CGRectMake(RESULT_BUTTON_ONE_X, RESULT_BUTTON_Y, RESULT_BUTTON_WIDTH, RESULT_BUTTON_HEIGH);
    resultButtonFrame[1] = CGRectMake(RESULT_BUTTON_TWO_X, RESULT_BUTTON_Y, RESULT_BUTTON_WIDTH, RESULT_BUTTON_HEIGH);
    resultButtonFrame[2] = CGRectMake(RESULT_BUTTON_THREE_X, RESULT_BUTTON_Y, RESULT_BUTTON_WIDTH, RESULT_BUTTON_HEIGH);
    
    // Generate 3 Button Result 
    self.question.result = self.question.operandOne * _question.operandTwo;
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 3; i++) {
        NSNumber *resultNumber = [NSNumber numberWithInt: self.question.result + i];
        [resultArray addObject: resultNumber];
    }
    for (int i = 0; i < 3; i++) {
        int index = arc4random() % 3;
        [resultArray exchangeObjectAtIndex: i withObjectAtIndex: index];
    }
    for (int i = 0; i < 3; i++) {
        _resultButton[i] = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        _resultButton[i].frame = resultButtonFrame[i];
        NSString *buttonText = [NSString stringWithFormat: @"%d", [[resultArray objectAtIndex: i] intValue]];

        [_resultButton[i] setTitle: buttonText
                         forState: UIControlStateNormal];
        _resultButton[i].tag = [[resultArray objectAtIndex: i] intValue];
        [self.view addSubview: _resultButton[i]];
        [_resultButton[i] addTarget: self
                            action: @selector(checkResult:)
                  forControlEvents: UIControlEventTouchUpInside];
    }
 
}

- (void)showUpdateScore{
    // updateScore Label
    NSString *scoreString = [NSString stringWithFormat:@"Score: %d", _levelScore];
    _scoreLabel.text = scoreString;
    [self.view addSubview:_scoreLabel];
}

- (void)clickSound{
   _soundFilePath = [[NSBundle mainBundle]pathForResource:@"Click" ofType:@"wav"];
    [self playSound];
}

- (void)playSound{
    NSError *error;
    if (self.audioPlayer != nil) {
        self.audioPlayer = nil;
        
    }
    self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath: _soundFilePath] error:&error];
    
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        _audioPlayer.delegate = self;
        [_audioPlayer prepareToPlay];
        [_audioPlayer play];
    }
}
- (void)checkResult:(id)sender{
    [self clickSound];
    
    UIButton *button = (UIButton *)sender;
    // Remove answer button
    for (int i = 0; i < RESULT_BUTTON_NUMBER; i++) {
        [_resultButton[i] removeFromSuperview];
    }
    [self.fruitView removeFromSuperview];
    
    // Show Result
    NSString *result = [NSString stringWithFormat: @"%d",self.question.result];
    self.resultLabel.text = result;
    [self.view addSubview: self.resultLabel];
    
    CGRect questionResultViewFrame = CGRectMake(65, 150, 150, 200);
    CGPoint questionResultViewCenter = CGPointMake(160, 260);
    
    // Check Result
    if(button.tag == self.question.result)
        {
            //Answer correct, update score
            self.levelScore += self.question.questionScore ;
            _totalScore += self.levelScore;
            [self showUpdateScore];
            QuestionResultView  *correctView = [[QuestionResultView alloc] initWithFrame: questionResultViewFrame
                                                                        andAnswerCorrect: YES];
            correctView.center = questionResultViewCenter;
            [self.view addSubview: correctView];
            _soundFilePath = [[NSBundle mainBundle]pathForResource:@"Clapping" ofType:@"wav"];
        } else {
            // Underline the answer
            NSDictionary *underlineAttribute = @{NSUnderlineStyleAttributeName: @1};
            //self.resultLabel.attributed = underlineAttribute;
            self.resultLabel.attributedText = [[NSAttributedString alloc] initWithString: result
                    attributes: underlineAttribute];
            
            QuestionResultView  *wrongView = [[QuestionResultView alloc] initWithFrame: questionResultViewFrame andAnswerCorrect: NO];
            wrongView.center = questionResultViewCenter;
            [self.view addSubview: wrongView];
            _soundFilePath = [[NSBundle mainBundle]pathForResource:@"Ohh" ofType:@"wav"];
        }
    
    [self playSound];

    if (_questionNum < 10) {
        // Next Question
        UIButton *nextQuestionButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        CGRect nextQuestionButtonFrame = CGRectMake(160, 200, 120, 40);
        CGPoint centerFrame = CGPointMake(160, 400);
        [nextQuestionButton setTitle: @"Next Question" forState: UIControlStateNormal];
        nextQuestionButton.frame = nextQuestionButtonFrame;
        nextQuestionButton.center = centerFrame;
        [self.view addSubview: nextQuestionButton];
        [nextQuestionButton addTarget: self
                               action: @selector(nextQuestion:)
                     forControlEvents: UIControlEventTouchUpInside];
    } else{
        //[_levelScoreArray ]
        
        [self.levelScoreArray replaceObjectAtIndex: self.level - 1 withObject: [NSNumber numberWithInt: self.levelScore]];

        UIButton *seeResultButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        CGRect seeResultButtonFrame = CGRectMake(160, 200, 120, 40);
        CGPoint centerFrame = CGPointMake(160, 400);
        [seeResultButton setTitle: @"See Result" forState: UIControlStateNormal];
        seeResultButton.frame = seeResultButtonFrame;
        seeResultButton.center = centerFrame;
        [self.view addSubview: seeResultButton];
        [seeResultButton addTarget: self
                               action: @selector(seeResult:)
                     forControlEvents: UIControlEventTouchUpInside];
    }
}

- (void)nextQuestion:(id)sender{

    for (id view in self.view.subviews) {
        if ([view isKindOfClass: [QuestionResultView class]]) {

            [view removeFromSuperview];
        }
    }
    [self clickSound];

    [sender removeFromSuperview];
    [self viewWillAppear: YES];
    
}

- (void)setResultMessageLabel{
    _resultMessageLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, 280, 150)];
    _resultMessageLabel.center = CGPointMake(160, 100);
    _resultMessageLabel.textAlignment = NSTextAlignmentCenter;
    _resultMessageLabel.textColor = [UIColor whiteColor];
    _resultMessageLabel.backgroundColor = [UIColor clearColor];
    _resultMessageLabel.numberOfLines = 5;
    [self.view addSubview: _resultMessageLabel];
}

- (void)setResultLevelView{
    _resultLevelView = [[UIImageView alloc] initWithFrame: CGRectMake(65, 150, 170, 200)];
    _resultLevelView.center = CGPointMake(160, 260);
    _resultLevelView.backgroundColor = [UIColor clearColor];
    //[_resultLevelView ani]
    //[self.view addSubview: _resultLevelView];
}

- (void)seeResult:(id)sender{
    for ( id view in self.view.subviews) {
            [view removeFromSuperview];
    }

    [self setBackGroundImage];
    [self setBackButton];
    [self setGameInformation];
    
    [self setResultMessageLabel];
    [self setResultLevelView];
    
    if (self.levelScore < PASS_SCORE) {
        [self notPassLevel];
    } else{
        
        // Check Final Level
        if (self.level == 11) {
            [self finishAllLevel];
        } else {
            [self passLevel];
        }
    }
}

- (void)notPassLevel{
        
    [_resultLevelView setImage: [UIImage imageNamed: @"professor1.png"]];
    _resultMessageLabel.text = [NSString stringWithFormat: @" Your total score: %d \n Please try the level again and achieve more than 60 to promote to next level",self.levelScore];
    
    _soundFilePath = [[NSBundle mainBundle]pathForResource:@"levelFail" ofType:@"mp3"];
    [self playSound];

    [UIView transitionWithView: self.view duration:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self.view addSubview: _resultLevelView];
        
    } completion:^(BOOL finished){
        }];

    
    UIButton *tryAgainButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    CGRect tryAgainButtonFrame = CGRectMake(160, 200, 120, 40);
    CGPoint centerFrame = CGPointMake(160, 400);
    [tryAgainButton setTitle: @"Try Again" forState: UIControlStateNormal];
    tryAgainButton.frame = tryAgainButtonFrame;
    tryAgainButton.center = centerFrame;
    [self.view addSubview: tryAgainButton];
    [tryAgainButton addTarget: self
                       action: @selector(tryAgain:)
             forControlEvents: UIControlEventTouchUpInside];
}

- (void)finishAllLevel{
    
    _soundFilePath = [[NSBundle mainBundle]pathForResource:@"finish" ofType:@"wav"];
    [self playSound];

    [_resultLevelView setImage:[UIImage imageNamed:@"professor4.png"]];
    _resultMessageLabel.text = @"Congratulation! You finished all level.";
    

    UIImageView *trophyImageView    = [[UIImageView alloc] initWithFrame: _resultLevelView.frame];
    [trophyImageView setImage: [UIImage imageNamed: @"trophy.png"]];

    [UIView transitionWithView: self.view duration:3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [self.view addSubview: _resultLevelView];
    } completion:^(BOOL finished){
        
        _soundFilePath = [[NSBundle mainBundle]pathForResource:@"passLevel" ofType:@"wav"];
        [UIView transitionWithView:self.view duration:2 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            [_resultLevelView removeFromSuperview];
            [self playSound];
            
            [self.view addSubview: trophyImageView];
            
        } completion: nil];

        
    }];
    
         

    
    _questionNum = 0;
    _levelScore = 0;
    UIButton *playAgainButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    CGRect playAgainButtonFrame = CGRectMake(160, 200, 120, 40);
    CGPoint centerFrame = CGPointMake(160, 400);
    [playAgainButton setTitle: @"Play Again" forState: UIControlStateNormal];
    playAgainButton.frame = playAgainButtonFrame;
    playAgainButton.center = centerFrame;
    [self.view addSubview: playAgainButton];
    [playAgainButton addTarget: self
                        action: @selector(playAgain:)
              forControlEvents: UIControlEventTouchUpInside];
}

- (void)passLevel{
    
    if (self.levelScore == PERFECT_SCORE) {
        _soundFilePath = [[NSBundle mainBundle]pathForResource:@"passLevel" ofType:@"wav"];

        [_resultLevelView  setImage: [UIImage imageNamed:@"professor2.png"]];
        NSString *message = [NSString stringWithFormat:@"Your total score: %d \n This is awesome! \n All your answers are correct! \n You are promoted to \n %@!",self.levelScore,[_levelDescriptionArray objectAtIndex: self.level]];
        _resultMessageLabel.text = message;
    }
    else {
        
        _soundFilePath = [[NSBundle mainBundle]pathForResource:@"passLevel" ofType:@"wav"];

        [_resultLevelView setImage:[UIImage imageNamed:@"plane.png"]];
        NSString *message = [NSString stringWithFormat: @"Your total score: %d \n Congratulations! You are promoted to %@!",self.levelScore,[_levelDescriptionArray objectAtIndex: self.level]];
        _resultMessageLabel.text = message;
    }
    
    [self playSound];

    [UIView transitionWithView: self.view duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [self.view addSubview: _resultLevelView];

    } completion:^(BOOL finished){
    }];

    
    UIButton *nextLevelButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    CGRect nextLevelButtonFrame = CGRectMake(160, 450, 120, 40);
    CGPoint centerFrame = CGPointMake(160, 430);
    [nextLevelButton setTitle: @"Next Level" forState: UIControlStateNormal];
    nextLevelButton.frame = nextLevelButtonFrame;
    nextLevelButton.center = centerFrame;
    [nextLevelButton addTarget: self
                        action: @selector(nextLevel:)
              forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: nextLevelButton];
}

- (void)tryAgain: (id)sender{
    [self clickSound];
    [self resetLevel];
    
    [self viewWillAppear: YES];
}

- (void)playAgain: (id)sender{
    [self clickSound];
    [self resetLevel];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)nextLevel:(id)sender{
    [self clickSound];
    self.level += 1;
    [self resetLevel];
    [self generateQuestion];

    [self viewWillAppear: YES];
}

- (void)backHome:(id)sender {
    [self clickSound];
    [self resetLevel];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)resetLevel {
    for ( id view in self.view.subviews) {
        [view removeFromSuperview];
    }
    self.levelScore = 0;
    _questionNum = 0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (void)setNotificationScoreLabel{
    UILabel* notificationScoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, 280, 20)];
    notificationScoreLabel.center = CGPointMake(160, 50);
    notificationScoreLabel.text = [NSString stringWithFormat:@"Your total score: %d",self.levelScore];
    notificationScoreLabel.textAlignment = NSTextAlignmentCenter;
    notificationScoreLabel.textColor = [UIColor whiteColor];
    notificationScoreLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview: notificationScoreLabel];
}
*/


@end
