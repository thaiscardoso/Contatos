//
//  AppDelegate.m
//  Contatos
//
//  Created by ios2686 on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "ListagemContatosController.h"

@interface AppDelegate(){
    NSMutableArray *contatos;
}

@end

@implementation AppDelegate
@synthesize  navigationController =_navigationController;

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    //CUSTOMIZADO - Begin
    [self carregaDoPlist];
    
    //Instanciando
    ListagemContatosController *listagemContatos = [[ListagemContatosController alloc] initWithNibName:@"ListagemContatosController" bundle:nil];
    //Control de navegacao das telas
    listagemContatos.contatos=contatos;
    self.navigationController=[[UINavigationController alloc] initWithRootViewController:listagemContatos];
    //setando o root
    self.window.rootViewController = self.navigationController;
    //CUSTOMIZADO - END 
    
    [self.window makeKeyAndVisible];
    return YES;
}

//Criado por Thais
-(void) carregaDoPlist{
    NSString *caminho = [[NSBundle mainBundle] pathForResource:@"contatos" ofType:@"PList"];
    NSMutableDictionary *arrayDeContatos = [[NSMutableDictionary alloc] initWithContentsOfFile:caminho];
    contatos = [[NSMutableArray alloc] init ];
    
    for (NSString *key in arrayDeContatos){
        NSDictionary *d = [arrayDeContatos objectForKey:key];
    
        //array para armazenar os contatos
        [contatos addObject:[d objectForKey:@"nome"]];
    
    }
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
