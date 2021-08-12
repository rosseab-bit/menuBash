# menuBash
Menu for execute functions scripts bash
structure
---------
run app => appMenu.sh
packages
|
=> this folder conuntain folders for all submenu
   in forlder submenu you add new scripts
   type name of scripts equals to name functions
   you can see the examples 

sources
|
=> menu.txt : in this file add the principal menus one under other
	       example:
	       submenu1
	       submenu2
	       submenu3
=> submenu : in this folder was generate files of config submenues
	|
	=> in this folder there files for configure submenues
	   add name of files of scripts. You can see the examples

1_ After add your submenues in menu.txt
   run loadModules.sh for generate folders what will have your scripts from submenues
2_ Add your scripts in folders generated in packages.
3_ You can run yours scripts run from appMenu.sh

thanks!
