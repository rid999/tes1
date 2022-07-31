#####################################################################
       .__    .___________  ________  ________ 
_______|__| __| _/   __   \/   __   \/   __   \
\_  __ \  |/ __ |\____    /\____    /\____    /
 |  | \/  / /_/ |   /    /    /    /    /    / 
 |__|  |__\____ |  /____/    /____/    /____/  
               \/                              
#################PROMPT SCRIPT  v1.0 BY RID999#######################
##YOU CAN MODIFY AS YOU LIKE WITH PROMPT QUESTION OR COMMAND#########
#####################################################################

#mainmenu function
mainmenu () {
echo "What would you want to do?"
echo "Enter 1 untuk ping website"
echo "Enter 2 untuk dig domain"
echo "Enter 3 untuk whois domain"
echo "Enter 4 to exit"
read selection
processtheselection
}

#pingwebsite #1
menu1()
{
echo "silahkan masukkan nama website untuk di ping..."
read input
ping $input;
}


menu2()
{
echo "silahkan masukkan nama website untuk dig domain"
read input
dig +short mx $input;
whois $input;

}

menu3()
{
echo "silahkan masukkan nama website yang akan di whois"
read input
whois $input;
}



#exit
exitapp()
{
echo "Exiting from the Application"
exit;
}




#seleksi
processtheselection()
{
case $selection in
    1) echo "anda akan melakukan ping website"
        menu1
        mainmenu
      ;;
    2)  echo "anda akan melakukan dig ke domain"
        menu2
        mainmenu
      ;;
    3)  echo "anda akan melakukan cek whois ke domain"
        menu3
        mainmenu
      ;;
    4) exitapp
        echo "silahkan masukkan perintah..."
        exit
      ;;
    *)  echo "Please enter a valid number"
     mainmenu
     ;;
esac
}

mainmenu;

#change *input to a value as you like
