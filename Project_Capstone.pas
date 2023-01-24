Program Capstone_Project;
uses crt, wincrt;

Type
  WaitingRoom = ^WAITING;
                waiting = Record
								symptome:string;
                  gender: String;
                  LastName: String;
                  Firstname: String;
                  Age: Integer;
                  hour: Integer;
                  minute: Integer;
                  disease: String;
									Entering:integer;
									Leaving:integer;
                  time: Integer;
                  pay: Integer;
                  next: waitingroom
                End;

type
 Liste_of_patient=^Customers;
                Customers = Record
								contenu:WaitingRoom;
								nxt:liste_of_patient;
								end;


                 //-------------------------Names----------//

Function firstnameF(i:integer):string;
Begin
case i Of
1:firstnameF:='Fatima'; 2:firstnameF:='Fatiha';  3:firstnameF:='Zohra';    4:firstnameF:='Malika';
5:firstnameF:='Meriem'; 6:firstnameF:='Halima';  7:firstnameF:='Leila';    8:firstnameF:='Nadia';
9:firstnameF:='Samia';  10:firstnameF:='Salima';  11:firstnameF:='Rachida';   12:firstnameF:='Souad';
13:firstnameF:='Saida';  14:firstnameF:='Amel';  15:firstnameF:='Nacera';   16:firstnameF:='Yassmine';
17:firstnameF:='Farah'; 18:firstnameF:='Amira'; 19:firstnameF:='Nassima';   20:firstnameF:='Siham';
end;
end;

Function firstnameM(i:integer):string;
Begin
case i Of
1:firstnamem:='Mohamed'; 2:firstnamem:='Samir';  3:firstnamem:='Samy';    4:firstnamem:='Chabane';
5:firstnamem:='Nazim'; 6:firstnamem:='Mounir';  7:firstnamem:='Abderrahmane';    8:firstnamem:='Youcef';
9:firstnamem:='Abdou';  10:firstnamem:='Ahmed';  11:firstnamem:='Oussama';   12:firstnamem:='Yacine';
13:firstnamem:='Amine';  14:firstnamem:='Salah';  15:firstnamem:='Omar';   16:firstnamem:='Adel';
17:firstnamem:='Soufyane'; 18:firstnamem:='Amir'; 19:firstnamem:='Karim'; 20:firstnamem:='Ilyes';
end;
end;

Function LASTNAME(i:integer):string;
Begin
case i Of
1:LASTNAME:='Chaibi'; 2:LASTNAME:='Mansouri';  3:LASTNAME:='Yahiaoui';    4:LASTNAME:=' Benaissa';
5:LASTNAME:='Saidi'; 6:LASTNAME:='Brahimi';  7:LASTNAME:='Rahmani';    8:LASTNAME:=' Moussaoui';
9:LASTNAME:='Slimani';  10:LASTNAME:='Messaoudi';  11:LASTNAME:='Dahmani';   12:LASTNAME:='Bouziane';
13:LASTNAME:='Touati';  14:LASTNAME:='Haddad';  15:LASTNAME:='Sahraoui';   16:LASTNAME:='Salhi';
17:LASTNAME:='Saadi'; 18:LASTNAME:='Aissaoui';  19:LASTNAME:='Banyahia'; 20:LASTNAME:='Amara';
end;
end;

function diagnosis(i:integer):string;
Begin
case i Of
1:diagnosis:='Gluten Allergies'; 2:diagnosis:='Crustacean Allergies'; 3:diagnosis:='Egg Allergies';
4:diagnosis:='Peanut Allergies'; 5:diagnosis:='Milk Allergies';       6:diagnosis:='Pet Allergies';
7:diagnosis:='Pollen Allergies'; 8:diagnosis:='Dust Mite Allergies';  9:diagnosis:='Mold Allergies';
end;
end;

function symptomes(i:integer):string;
Begin
case i Of
1:symptomes:='Swelling of the tongue, mouth, and face';    2:symptomes:='Difficulty breathing';
3:symptomes:='Hives';         4:symptomes:='Itchy rash';    5: symptomes:=' Low blood pressure';
6:symptomes:=	'Vomiting';       7:symptomes:='Diarrhea';	8:symptomes:='Digestive distress, such as a stomach ache';
9:symptomes:='Skin reactions, such as hives or a rash';   10:symptomes:='Respiratory problems';
11: symptomes:='Red and swollen eyes';  12:symptomes:='Sneezing'; 13:symptomes:='stuffy nose';
end;
end;


function Price(i:integer):integer;
Begin
if (i>=20) and (i<=30) then price:=1500
else if (i>30) and (i<=45) then price:=2000;
end;



                //---------------------------Vide---------------//

Function fileVide(Fil:WaitingRoom): Boolean;
Begin
  fileVide := (fil=Nil);
End;

                      //-----------------------------taille-------------------//
Function taille(Fi:WaitingRoom;Ge:string): Integer;
Var
    cpt:integer;
Begin
cpt:=0;

while not filevide(fi) Do
   Begin
if fi^.gender[1]=Ge then cpt:=cpt+1;
fi:=fi^.next;
end;
taille:=cpt;
end;


Procedure Enfile(Var patient,y:WaitingRoom);
Var i:integer;
  x: WaitingRoom;
Begin
  if patient=nil then Begin
	new(patient);
	patient:=y;
	 patient^.next:=Nil;
	 end
  Else
    Begin
      x := patient;
      While x^.next<>Nil Do
        x := x^.next;
				new(x^.next);
				x^.next:=y;
			x^.next^.next:=nil;
    End;
End;
     //---------------------------Enfiler---------------//

     Procedure Enfiler(Var patient:WaitingRoom;h,m,v:integer;G:string);
Var i:string;
  x: WaitingRoom;
Begin

 if taille(patient,G)<8 then Begin
  if patient=nil then Begin
	new(patient);
	patient^.age:=random(80)+2;   patient^.hour:=h;  patient^.minute:=m;  patient^.time:=v; patient^.disease:=diagnosis(random(9)+1); 
	          if G='F' then Begin
						patient^.gender:='Female'; patient^.firstname:=firstnamef(random(20)+1);
						patient^.lastname:=lastname(random(20)+1); end
						else if G='M' then Begin
						patient^.gender:='Male'; patient^.firstname:=firstnameM(random(20)+1);
						patient^.lastname:=lastname(random(20)+1);  end;
						patient^.pay:=price(patient^.time);
	 patient^.next:=Nil;
	 end
  Else
    Begin
      x := patient;
      While x^.next<>Nil Do
        x := x^.next;
				new(x^.next);
				x^.next^.hour:=h;  x^.next^.minute:=m;   x^.next^.disease:=diagnosis(random(9)+1);
	          if G='F' then Begin
						x^.next^.gender:='Female'; x^.next^.firstname:=firstnamef(random(20)+1);
						x^.next^.lastname:=lastname(random(20)+1); end
						else if G='M' then Begin
						x^.next^.gender:='Male'; x^.next^.firstname:=firstnameM(random(20)+1);
						x^.next^.lastname:=lastname(random(20)+1); end;
				x^.next^.age:=random(80)+2; x^.next^.time:=v; x^.next^.pay:=price(x^.next^.time);
			x^.next^.next:=nil;
    End;
	end;
End;
//---------------------------Defiler---------------//
Function Defiler(Var patient:WaitingRoom): WaitingRoom;
Var
  x,y: WaitingRoom;
Begin
if patient=nil then Defiler:=nil
  else
    Begin
      x := patient;

      patient := patient^.next;
			//x^.leaving:=leav;
      Defiler := x;
      x^.next:=nil;
    End;
End;

function Hour(t:integer):integer;
Begin
hour:=7+(t div 60);
end;

function min(t:integer):integer;
Begin
min:=0+(t mod 60);
end;

function Hour2(t:integer):integer;
Begin
hour2:=12+(t div 60);
end;

function min2(t:integer):integer;
Begin
min2:=0+(t mod 60);
end;

function lastfile(fi:waitingroom):waitingroom;
var x:waitingroom;
Begin
x:=fi;
if x=nil then lastfile:=nil
else Begin
while x^.next<>nil Do
x:=x^.next;
lastfile:=x;
end;
end;

procedure leaving(var L:Liste_of_patient;z:waitingroom);
Var  x:Liste_of_patient;
Begin
if l=nil Then Begin
new(l); l^.contenu:=z; l^.nxt:=Nil; end
Else Begin
 x:=l;
 while x^.nxt<>nil Do
 x:=x^.nxt;
 new(x^.nxt); x^.nxt^.contenu:=z; x^.nxt^.nxt:=nil;
 end;
end;

function totalpatient(Li:liste_of_patient):integer;
Var cpt:integer;
Begin
cpt:=0;
while(li<>nil) Do
   Begin
	 li:=li^.nxt;
	 cpt:=cpt+1;
	 end;
	 totalpatient:=cpt;
end;

Procedure Gendermost(Li:liste_of_patient);
Var cptm,cptf:integer;
Begin
cptm:=0; cptf:=0;
while (li<>nil) do
  Begin
	if li^.contenu^.gender='Female' then cptf:=cptf+1
	else if li^.contenu^.gender='Male' then cptm:=cptm+1;
	li:=li^.nxt;
	end;
Writeln('==> there was been ',cptm,' Male patient were served by the doctor today'); delay(500);
writeln('==> there was been ',cptf,' Female patient were served by the doctor today');
end;

function Income(Li:liste_of_patient):integer;
Var sum:integer;
Begin
sum:=0;
while li<>nil Do Begin
                 sum:=sum+(li^.contenu^.pay);
								 li:=li^.nxt;
								 end;
income:=sum;
end;

function Ratio(Li:liste_of_patient):integer;
Var cpt:integer;
Begin
cpt:=0;
while li<>nil Do Begin
                 if li^.contenu^.pay=2000 then cpt:=cpt+1;
								 li:=li^.nxt;
								 end;
Ratio:=cpt;
end;

procedure percentage(tot,ratt:integer);
var i,j:integer;
Begin
i:=(ratt*100) div tot;
j:=(ratt*100) mod tot;
writeln('=> *** The RATIO of consulting sessions that made 2000DA is ',i,',',j,' %' ); readln; end;

function nbr_patient(li:liste_of_patient;i:integer):liste_of_patient;
Var w:liste_of_patient;
cpt:integer;
b:boolean;
begin
b:=false;
w:=li;
cpt:=1;
while (w<>nil) and (not b) Do Begin
                 if cpt=i then Begin
								  nbr_patient:=W ;
									b:=true;
									end;
									cpt:=cpt+1;
								 w:=w^.nxt;
								 end;

end;

Function hour_i(i,j:integer):integer;
Begin
hour_i:=((i-7)*60)+j mod 60;
end;

procedure sup(var f,ff:waitingroom;var ll:liste_of_patient);
var x:waitingroom;

Begin
x:=f;
if x=ff then Begin f:=f^.next; leaving(ll,x);  End
Else  Begin
while (x^.next<>ff)  Do  x:=x^.next;
x^.next:=x^.next^.next;
leaving(ll,ff);
end;
end;



procedure leavers(var Fi:waitingroom;ti:integer;var l:liste_of_patient);
Var f:waitingroom;
	 b:boolean;
Begin
b:=false;
f:=fi;
while (not filevide(f)) and (not b) do Begin
if ti-(hour_i(f^.hour,f^.minute))>=180 Then  Begin
									b:=true;
									writeln('                *****  Important '); writeln;
									writeln('===> Patient ',f^.lastname,' ',f^.firstname,' entred',f^.hour,':',f^.minute,' left the waiting room because of waiting for more than three hours'); delay(1000); //readln;   
									sup(fi,f,l)
									end;
									if f<>nil then
									f:=f^.next;

									end;
end;








								//___________Principal Program_______________//

Var room,x,y,Doc:waitingroom;
		heure,minu,i,global,arrival,vis,j,vi,Gend,tm,tf,nb:integer;
		Left,rep,leave:liste_of_patient;
		stop,symp:string;
Begin
room:=nil;  heure:=7;   leave:=nil;
left:=nil;  minu:=0;
randomize;
writeln('   ***== Dr. Allaoui Clinic ''Allergist / Immunologist Specialized Doctor'' ==***   ');

global:=0;  arrival:=random(10)+10;  vis:=0; doc:=nil;
Writeln('                      *"" Showing today''s Reports ""*        ');
readln; Clrscr;
for i:=1 to 300 Do
Begin
leavers(room,i,leave);
heure:=hour(i); minu:=min(i);
tm:=taille(room,'M'); tf:=taille(room,'F');
 if (i=arrival) and (i<240) and( ((tm<8) and (tf=8)) or ((tm=8) and (tf<8)) or ((tm<8) and (tf<8)))  then begin
 							writeln('                 <====***   Last Queue Report   *****====>     '); delay(350);  writeln;
               vis:=random(20)+25; gend:=random(2)+1;
							 if gend=1 then Begin  Enfiler(room,heure,minu,vis,'M'); end
							 else if gend=2 then  Begin Enfiler(room,heure,minu,vis,'F'); end;
							 y:=lastfile(room);
							 writeln('A patient enters the waiting room at ',heure,':',minu,' AM ,the patient''s name is ',y^.lastname,' ',y^.firstname); delay(1500);
							 writeln;writeln;writeln; //readln;
							 arrival:=arrival+random(10)+10;
							 end;
			if (doc=nil) and (room<>nil) then Begin
			x:=Defiler(room);    Enfile(doc,x);     leaving(left,x);   doc^.Entering:=i;
			    writeln('                <====*** The patient being examined Report *****====>     ');   delay(350); writeln;
			writeln('==>   Entrance time is ',hour(i),':',min(i),' AM  .*');
			 writeln('=== Patient ',doc^.firstname,' ',doc^.lastname,' entered, the patient is being examined by the Doctor .'); delay(1500);
			  writeln; writeln;writeln;
			 vi:=doc^.time+i;
			 //readln;
				end;
				if (i=vi) or (i=300) then Begin  Writeln('           <====*** Last Patient Report ''Leaving The Dr''s Room'' *****====>     '); delay (650);    writeln;
				 writeln('=> Patient ',doc^.firstname,' ',doc^.lastname,' got diagnosed with "', doc^.disease,'".'); delay(300);
				  writeln('===** here is some informations about this patient **==='); delay(1500);
					writeln('==> The patient ',doc^.firstname,' ',doc^.lastname,' is a ',doc^.gender); delay(200);
					writeln('==> The patient has ',doc^.age,' years old.');   delay(250);
					 symp:=symptomes(random(13)+1); doc^.symptome:=symp;
					writeln('==> The patient had this following symptome : ',doc^.symptome,'.'); delay(250);
				  writeln('==> The patient stayed ',doc^.time,' min ,and left at ',hour(i),':',min(i),' AM'); //readln;
					doc^.leaving:=i;
					 Defiler(doc);
					 writeln;writeln;writeln;
					end;
end;
Readln;  clrscr;
writeln('  **  ==>  It''s 12:00 PM ,it''s launch break from 12:00 to 12:30 PM , the Clinic is closed now **'); delay(2000); writeln; writeln; writeln;writeln;
for i:=300 to 330 do Begin
writeln('==>',hour(i),':',min(i),' PM <=='); delay (200);
end;

 clrscr;
  writeln('    ***==   Dr. Allaoui''s Clinic ''Allergist / Immunologist Specialized Doctor''  ==***   ');
	writeln('          ****   Reopening the Clinic   ******'); delay (3000);
	clrscr;
arrival:=330+random(10)+10;
for i:=330 to 480 Do
Begin
leavers(room,i,leave);
heure:=hour(i); minu:=min(i);
tm:=taille(room,'M'); tf:=taille(room,'F');
 if (i=arrival) and( ((tm<8) and (tf=8)) or ((tm=8) and (tf<8)) or ((tm<8) and (tf<8))) and (i<430)
  then begin
 							 writeln('        <====***   Last Queue Report   *****====>     ');  delay(850);  writeln;
               vis:=random(20)+25; gend:=random(2)+1;
							 if gend=1 then Begin  Enfiler(room,heure,minu,vis,'M'); end
							 else if gend=2 then  Begin Enfiler(room,heure,minu,vis,'F'); end;
							 y:=lastfile(room);
							 writeln('A patient enters the waiting room at ',heure,':',minu,' AM ,the patient''s name is ',y^.lastname ,' ',y^.firstname); delay(1500);  //readln;
							 		writeln;writeln;
							 arrival:=arrival+random(10)+10;
							 end;
			if (doc=nil) and (room<>nil) then Begin
			x:=Defiler(room);    Enfile(doc,x);     leaving(left,x);
			    writeln('            <====*** The patient being examined *****====>     ');    delay(850);   writeln;
			writeln('==>   Entrance time is ',hour(i),':',min(i),' PM  .*');
			 writeln('=== Patient ',doc^.firstname,' ',doc^.lastname,' entered, the patient is being examined by the Doctor .'); delay(1500); //readln;
			  writeln; writeln;   writeln;
			 vi:=doc^.time+i;

				end;
				if (i=vi) or (i=480) then Begin  Writeln('          <====*** Last Patient Report   ''Leaving the DR''s Room''*****====>     ');  delay(650); writeln;
				 writeln('=> Patient ',doc^.firstname,' ',doc^.lastname,' got diagnosed with "', doc^.disease,'".');  delay(350);
				  writeln('===** here is some informations about this patient **===');    delay(1500);
					writeln('==> The patient ',doc^.firstname,' ',doc^.lastname,' is a ',doc^.gender);  delay(300);
					writeln('==> The patient has ',doc^.age,' years old.');   delay(300);
					symp:=symptomes(random(13)+1); doc^.symptome:=symp;
					writeln('==> The patient had this following symptome : ',doc^.symptome,'.');delay(300);
				  writeln('==> The patient stayed ',doc^.time,' min ,and left at ',hour(i),':',min(i),' PM');   writeln; writeln;  writeln;
					doc^.leaving:=i;
					 Defiler(doc);
					//readln;
					end;
					if i=480 then     Begin
					clrscr;
					   writeln('===> It is ',hour(i),':',min(i),' PM');  delay(150);  writeln;
						 writeln('==> A policy announce that the doctor should serve the patient who are still        waiting in the two waiting rooms'); delay(3500);clrscr;
						 while (room<>nil) OR (doc<>nil) Do Begin
						 if (doc=nil) and (room<>nil) then Begin
			x:=Defiler(room);    Enfile(doc,x);     leaving(left,x);  doc^.entering:=i;
			    writeln('        <====*** The patient being examined *****====>     '); delay(650); writeln;
			writeln('==>   Entrance time is ',hour(i),':',min(i),' PM  .*');
			 writeln('=== Patient ',doc^.firstname,' ',doc^.lastname,' entered, the patient is being examined by the Doctor .');delay(1500); writeln;writeln;   writeln; writeln; //readln;
			 vi:=doc^.time+i;

				end;
				if (i=vi)  then Begin  Writeln('        <====*** Last Patient Report   ''Leaving the Doctor''s Room'' *****====>     '); delay(650);  writeln;
				 writeln('=> Patient ',doc^.firstname,' ',doc^.lastname,' got diagnosed with "', doc^.disease,'".');delay(350);
				  writeln('===** here is some informations about this patient **===');  delay(1500);
					writeln('==> The patient ',doc^.firstname,' ',doc^.lastname,' is a ',doc^.gender); delay(300);
					writeln('==> The patient has ',doc^.age,' years old.');       delay(300);
					symp:=symptomes(random(13)+1); doc^.symptome:=symp;
					writeln('==> The patient had this following symptome : ',doc^.symptome,'.');   delay(300);
				  writeln('==> The patient stayed ',doc^.time,' min ,and left at ',hour(i),':',min(i),' PM'); delay(1500);  writeln; writeln; writeln;writeln;   //readln;
					doc^.leaving:=i;
					 Defiler(doc);

					end;
					i:=i+1;
					end;
					end;

end;

Writeln(' ======** All today''s reports are stocked ** ====== ');
Delay(2000);
Repeat
clrscr; writeln('    **** Chose the Report needed ****    ');
writeln(' ===> ** 1- The number of the patients that the doctor served this day   **');
writeln(' ===> ** 2- The gender that served the most this day   **');
writeln(' ===> ** 3- Total money earned during the entire day   **');
writeln(' ===> ** 4- The RATIO of consulting sessions that made 2000DA   **');
Writeln(' ===> ** 5- The examination Report of a specific patient ''chose the patient''s   number ');
writeln(' ===> ** 6- Show the number of the patients that left the waiting room');
Writeln('=========> ** Chose a Report to show ** ');
 write('===>');readln(nb);  writeln('********  Checking the stocked information ......  *********');  writeln;writeln;writeln;             delay(2000);
case nb Of
1:Begin
   writeln('=> *** The number of the patients that the doctor served this day is ',totalpatient(left) ,' patient ***');
	 readln;
end;
2: Begin Gendermost(left);  readln; end;
3: Begin  writeln('=> *** The Doctor earned ',income(left),' DA  *** '); readln; end;
4:percentage(totalpatient(left),ratio(left));
5:Begin
writeln('=> ** Enter the number of the patient to show his/her examination Report **'); write('==>'); readln(j); delay(1500);
				rep:=nbr_patient(left,j);
  Writeln('        <====*** Last Patient Report *****====>     '); delay(1550);
	writeln('Patient entered the waiting room at ',rep^.contenu^.hour,':',rep^.contenu^.minute);delay(300);
	writeln('Patient entered the Doctor''s room at ',hour(rep^.contenu^.entering),':',min(rep^.contenu^.entering));delay(300);
				 writeln('=> Patient ',rep^.contenu^.firstname,' ',rep^.contenu^.lastname,' got diagnosed with "', rep^.contenu^.disease,'".');     delay(300);
				  writeln('===** here is some informations about this patient **===');  delay(550);
					;
					writeln('==> The patient is a ',rep^.contenu^.age,' years old ',rep^.contenu^.gender,' .');       delay(300);
					writeln('==> The patient had this following symptome : ',rep^.contenu^.symptome,'.');   delay(300);
				  writeln('==> The patient stayed ',rep^.contenu^.time,' min ,and left at ',hour(rep^.contenu^.leaving),':',min(rep^.contenu^.leaving),' , and payed ',rep^.contenu^.pay,' DA .');
					readln;
end;
6:writeln('The number of the patients who left the waiting room is ',totalpatient(leave),' patient');
end;
Writeln;
      Writeln(' ====> If you want to exit the program type "END"');
      write('===>'); Readln(stop);
until (stop='End') or ( stop='end') or (stop='END');


Writeln('                                  Shutting down'); delay(1000);



end.