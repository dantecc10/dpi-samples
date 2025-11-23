unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

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
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
   //variables privadas para esta unidad

  public
    //variables de alcance público para esta unidad

  end;

var //variables globales de la unidad
  Form1: TForm1;
  A: Integer;  //variable global


implementation

{$R *.lfm}

{ TForm1 }

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
  S1,S2, suma : Integer;
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
   suma:=S1+S2;
   label2.Caption:=IntToStr(suma);



end;

end.

