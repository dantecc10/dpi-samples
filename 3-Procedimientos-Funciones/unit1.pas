unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Math;

//const
//  v1=45;


type


  //definir tipos propios
  {
   más
  de  una linea para comentarios
  }

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);

    //Especificar procedimientos propios de alcance Tform1



  private
   //variables privadas para esta unidad

  public
    //variables de alcance público para esta unidad

   //Especifiación de procedimientos

    //suma paramateros por valor
    //procedure suma(Sum1,Sum2: Integer);


    //suma paramateros por referencia
    procedure suma(Sum1,Sum2: Integer; var R:Integer);

    function potencia(B,E: Integer): Real;
  //

  end;

var //variables globales de la unidad
  Form1: TForm1;
  A: Integer;  //variable global
  RES : Integer;


implementation

{$R *.lfm}

{ TForm1 }


//funcion propia que devuelve ena base elevada a un exponente
function Tform1.potencia(B,E: Integer):Real;
var
  pot: Real;
begin

   pot:=power(B,E);    //se utiliza power() definida en la bibkioteca Math

   //se especifica el valor que debe devolver la función
   potencia:=pot;



end;


// procedimiento propio para hacer suma
procedure Tform1.suma(Sum1,Sum2: Integer; var R:Integer);
begin

   R:=sum1+sum2;
   label3.Caption:=Inttostr(R);


end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  //Evento de dari click sobre Button1
  Edit1.Text:='Hola mundo..';


end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ShowMessage('Hola mundo..');

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  B:Integer; //variable local para este evento
  cad: String;
  begin
   //ASignar valor a la variable local A
  A:=34;
 // cad:=IntToStr(A);
 // cad:=cad + '  años';
 // Edit2.Text:=cad;

  Edit2.Text:=IntToStr(A);



end;

procedure TForm1.Button4Click(Sender: TObject);
  var
  S1,S2, sumar : Integer;
begin
   S1:=StrToInt(Edit3.Text);
   S2:=StrToInt(Edit4.Text);
   if (S1<10) then
   begin
      ShowMessage('El valor S1 es pequeño');
   end
   else //de lo contrario
   begin
     ShowMessage('El valor S1 es grande');
   end;
   sumar:=S1+S2;
   label2.Caption:=IntToStr(sumar);



end;

procedure TForm1.Button5Click(Sender: TObject);
var
S1,S2:integer;
begin
   S1:=StrToInt(Edit3.Text);
   S2:=StrToInt(Edit4.Text);
   suma(S1,S2,RES);  //llamar procedimiento propio




end;

procedure TForm1.Button6Click(Sender: TObject);
var
 respot: Real;
begin

   //llamar funcion propia que eleva una base al exponente
   respot:=potencia(StrToInt(Edit3.Text),StrToInt(Edit4.Text));
   Edit5.Text:=Floattostr(respot);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Label2Click(Sender: TObject);
begin

end;



end.

