//
//  LetraViewController.m
//  Navigation
//
//  Created by Patricia Machado de Abreu on 17/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "LetraViewController.h"


@interface LetraViewController ()
{
    Dictionary *dictionary;
    UIImageView *imageView;
    UIImage *image;
    UITextField *textField;
    UIBarButtonItem *next;
    UIBarButtonItem *back;
    UIBarButtonItem *editar;
    UIBarButtonItem *flexibleSpaceBarButtonItem;
    UIBarButtonItem *done;
    RLMResults *realm;
    NSArray *items;
}
@end

@implementation LetraViewController
@synthesize pagina, imagemTocada;

- (void)viewDidLoad {
    
    [self prepararPagina:pagina];
    
    imageView.frame = CGRectMake(70, 150, 800, 800);
    textField.frame = CGRectMake(0, -150, 800, 800);
    
    next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;

    back = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = back;
    
    
    self.navigationController.toolbarHidden = NO;
    
    flexibleSpaceBarButtonItem= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    editar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editar:)];
    
    done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
    
     items = [NSArray arrayWithObjects:flexibleSpaceBarButtonItem, editar, flexibleSpaceBarButtonItem, done, flexibleSpaceBarButtonItem, nil];
    
    self.toolbarItems = items;
    
    //    animaçao para aumentar a imagem
    UILongPressGestureRecognizer *pressionar = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(zoom: )];
    [imageView addGestureRecognizer:pressionar];

//    animacao para ouvir reproduzir o texto
//    UILongPressGestureRecognizer *pressionarText = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(touchesLabel:)];
//    [imageView addGestureRecognizer:pressionarText];
    
    [done setEnabled:NO];
    
}

-(void)viewWillAppear:(BOOL)animated
{


    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:3];
    
    imageView.frame = CGRectMake(40, 150, 200, 200);
    textField.frame = CGRectMake(30, 350, 300, 75);
    
    [UIView commitAnimations];

    

}

#pragma mark - My Methods

-(void) prepararPagina:(int)pagina
{
    UIColor *colorA = [UIColor colorWithRed:(115.0/255.0) green:(202.0/255.0) blue:(227.0/255.0) alpha:1.0];
    UIColor *colorB= [UIColor colorWithRed:(125.0/255.0) green:(152.0/255.0) blue:(30.0/255.0) alpha:1.0];
    UIColor *colorC = [UIColor colorWithRed:(6.0/255.0) green:(198.0/255.0) blue:(123.0/255.0) alpha:1.0];
    UIColor *colorD = [UIColor colorWithRed:(251.0/255.0) green:(153.0/255.0) blue:(148.0/255.0) alpha:1.0];
    UIColor *colorE = [UIColor colorWithRed:(4.0/255.0) green:(216.0/255.0) blue:(237.0/255.0) alpha:1.0];
    UIColor *colorF = [UIColor colorWithRed:(246.0/255.0) green:(236.0/255.0) blue:(159.0/255.0) alpha:1.0];
    UIColor *colorG = [UIColor colorWithRed:(164.0/255.0) green:(199.0/255.0) blue:(225.0/255.0) alpha:1.0];
    UIColor *colorH = [UIColor colorWithRed:(227.0/255.0) green:(98.0/255.0) blue:(70.0/255.0) alpha:1.0];
    UIColor *colorI = [UIColor colorWithRed:(9.0/255.0) green:(189.0/255.0) blue:(81.0/255.0) alpha:1.0];
    UIColor *colorJ = [UIColor colorWithRed:(164.0/255.0) green:(199.0/255.0) blue:(225.0/255.0) alpha:1.0];
    UIColor *colorK = [UIColor colorWithRed:(250.0/255.0) green:(202.0/255.0) blue:(114.0/255.0) alpha:1.0];
    UIColor *colorL = [UIColor colorWithRed:(4.0/255.0) green:(160.0/255.0) blue:(69.0/255.0) alpha:1.0];
    UIColor *colorM = [UIColor colorWithRed:(249.0/255.0) green:(225.0/255.0) blue:(212.0/255.0) alpha:1.0];
    UIColor *colorN = [UIColor colorWithRed:(235.0/255.0) green:(87.0/255.0) blue:(89.0/255.0) alpha:1.0];
    UIColor *colorO= [UIColor colorWithRed:(146.0/255.0) green:(192.0/255.0) blue:(215.0/255.0) alpha:1.0];
    UIColor *colorP = [UIColor colorWithRed:(250.0/255.0) green:(238.0/255.0) blue:(194.0/255.0) alpha:1.0];
    UIColor *colorQ = [UIColor colorWithRed:(180.0/255.0) green:(89.0/255.0) blue:(8.0/255.0) alpha:1.0];
    UIColor *colorR = [UIColor colorWithRed:(244.0/255.0) green:(193.0/255.0) blue:(115.0/255.0) alpha:1.0];
    UIColor *colorS = [UIColor colorWithRed:(216.0/255.0) green:(234.0/255.0) blue:(243.0/255.0) alpha:1.0];
    UIColor *colorT = [UIColor colorWithRed:(183.0/255.0) green:(185.0/255.0) blue:(186.0/255.0) alpha:1.0];
    UIColor *colorU = [UIColor colorWithRed:(249.0/255.0) green:(213.0/255.0) blue:(123.0/255.0) alpha:1.0];
    UIColor *colorV = [UIColor colorWithRed:(254.0/255.0) green:(246.0/255.0) blue:(165.0/255.0) alpha:1.0];
    UIColor *colorW = [UIColor colorWithRed:(232.0/255.0) green:(153.0/255.0) blue:(66.0/255.0) alpha:1.0];
    UIColor *colorX = [UIColor colorWithRed:(227.0/255.0) green:(216.0/255.0) blue:(4.0/255.0) alpha:1.0];
    UIColor *colorY = [UIColor colorWithRed:(195.0/255.0) green:(238.0/255.0) blue:(240.0/255.0) alpha:1.0];
    UIColor *colorZ = [UIColor colorWithRed:(64.0/255.0) green:(70.0/255.0) blue:(219.0/255.0) alpha:1.0];

    NSMutableArray *color = [[NSMutableArray alloc] initWithObjects:colorA,
                                                                    colorB,
                                                                    colorC,
                                                                    colorD,
                                                                    colorE,
                                                                    colorF,
                                                                    colorG,
                                                                    colorH,
                                                                    colorI,
                                                                    colorJ,
                                                                    colorK,
                                                                    colorL,
                                                                    colorM,
                                                                    colorN,
                                                                    colorO,
                                                                    colorP,
                                                                    colorQ,
                                                                    colorR,
                                                                    colorS,
                                                                    colorT,
                                                                    colorU,
                                                                    colorV,
                                                                    colorW,
                                                                    colorX,
                                                                    colorY,
                                                                    colorZ,nil];

    textField = [[UITextField alloc] init];

    dictionary = [[Dictionary alloc] init];
    [dictionary iniciandoBancoDados];
//    [dictionary initPage];
    
    realm = [dictionary buscaObjetoBancoDadosWithPage:pagina];
    
    for(int i = 0; i < [realm count]; i++){
        Pagina *obj = [realm objectAtIndex:i];
        
        self.title = obj.letter;
        image = [UIImage imageNamed:obj.image];
        NSString *texto = obj.text;
        [textField setText:texto];
        [self.view setBackgroundColor: [color objectAtIndex:pagina] ];
    }
    
    
    
    //    alfabeto
//    self.title = [dictionary getLetterWithPage:pagina];
    
    //    imagem
    imageView = [[UIImageView alloc] init] ;
//    image = [UIImage imageNamed:[ dictionary getImageWithPage:pagina]];
    imageView.image = image;
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    //    text
//    textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 300, 75)];
//    [textField setText:[dictionary getTextWithPage:pagina]];
    [textField setTextAlignment:NSTextAlignmentCenter];
    textField.font = [UIFont fontWithName:@"Zapfino" size:20];
    
    [textField setEnabled: NO];
    [self.view addSubview:textField];

}

-(void)next:(id)sender {
    
    LetraViewController *proximo = [[LetraViewController alloc]
                                     initWithNibName:nil
                                     bundle:NULL];
    
    [proximo setPagina:pagina+1];
    [self.navigationController pushViewController:proximo
                                         animated:YES];
//    [next setEnabled:YEs];
    
}

-(void) back:(id)sender{
//    LetraViewController *anterior = [[LetraViewController alloc] initWithNibName:nil bundle:NULL];
//    pagina--;
//    [anterior prepararPagina:pagina];
    [self.navigationController popViewControllerAnimated:YES];
    [back setEnabled:YES];
}

-(void) editar:(id)sender{
    
    [editar setEnabled: NO];
    [textField setEnabled:YES];
    [done setEnabled:YES];
    
    
//    EditarViewController *editar = [[EditarViewController alloc] init];
//    
//    [editar setPagina:pagina];
//    [self.navigationController pushViewController:editar animated:YES];
}

-(void) done:(id)sender{
    [editar setEnabled: YES];
    [done setEnabled:NO];
    [textField setEnabled:NO];
    
    
    Pagina *resultado = [dictionary buscaObjetoBancoDadosWithPage:pagina];
//
//    NSString *letra = [resultado letter];
//    
//    
//    Pagina *novaPagina = [[Pagina alloc]init];
//    
//    novaPagina.letter = resultado.letter;
//    novaPagina.image = resultado.image;
//    novaPagina.text = [textField text];
//
    
    [dictionary alteraObjetoBancoDadosWithPage:pagina andWithText:[textField text]];
        
//        [_realm beginWriteTransaction];
////        obj.text = [textField text];
//
//        [_realm commitWriteTransaction];
    
    }

#pragma mark - interatividade

//Método que dá zoom na imagem
-(void)zoom:(UILongPressGestureRecognizer *)sender{
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        [UIView beginAnimations:nil context:nil];
        
        [UIView setAnimationDuration:3];
        imageView.transform = CGAffineTransformMakeScale(2.0f, 2.0f);
        [UIView commitAnimations];
    }
    if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView beginAnimations:nil context:nil];
        
        [UIView setAnimationDuration:3];
        imageView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        [UIView commitAnimations];
    }
}

//Método que habilita a imagem para ser movimentada
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if (CGRectContainsPoint(imageView.frame, point)) {
        imagemTocada = YES;
    }
}

//Método que move a imagem quando tocada
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint localTocado = [touch locationInView:self.view];
    if (imagemTocada) {
        [UIView animateWithDuration:0 animations:^{
            imageView.transform = CGAffineTransformMakeTranslation(localTocado.x-imageView.center.x, localTocado.y-imageView.center.y);
        }];
    }
}


//-(void) touchesLabel:(UILongPressGestureRecognizer *)sender{
//
//    if (sender.state == UIGestureRecognizerStateBegan) {
//        [UIView animateWithDuration:0.4 animations:^{
//            AVSpeechSynthesizer *speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
//            AVSpeechUtterance *speechUteerance = [AVSpeechUtterance speechUtteranceWithString:[dictionary getTextDataBasesWithPage:pagina]];
//            [speechUteerance setPitchMultiplier:1.15f];
//            speechUteerance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"pt-BR"];
//            [speechUteerance setRate:0.03f];
//            [speechSynthesizer speakUtterance:speechUteerance];
//            
//        }];
//    }else{
//        NSLog(@"TESTE");
//    }
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
