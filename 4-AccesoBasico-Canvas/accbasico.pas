unit Accbasico;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ExtDlgs,
  Menus, ComCtrls, LCLIntf, StdCtrls;


  //LCLIntf permite metodos Getrvalue, getgvalue, getbvalue, RGB

type
  //definir tipos propios

  MATRGB= Array of Array of Array of byte;



  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    ScrollBox1: TScrollBox;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure MenuItem2Click(Sender: TObject);
  private

  public


    procedure copiaIM(Al, An: Integer; var M:MATRGB);

  end;

var
  Form1: TForm1;
  ALTO, ANCHO : Integer;
  MAT: MATRGB ;  //del tipo propio para alamacenar R,G,B



implementation

{$R *.lfm}

{ TForm1 }

//procedimiento para copiar de Imagen a matriz



Procedure tform1.copiaIM(Al, An: Integer; var M:MATRGB);
var
  i,j  : Integer;
  cl   : Tcolor;
begin

    for i:=0 to An-1 do
     begin
        for j:=0 to Al-1 do
        begin
         cl:=Image1.Canvas.Pixels[i,j];
         M[i,j,0]:=GetRValue(cl);
         M[i,j,1]:=GetGValue(cl);
         M[i,j,2]:=GetBValue(cl);
        end;//j

     end; //i



end;

procedure TForm1.MenuItem2Click(Sender: TObject);
var
  i,j: Integer;
  cl: Tcolor;
begin
  //Abrir la imagen
  if OpenPictureDialog1.Execute then
  begin
    Image1.Enabled:=True;
    Button1.Enabled:=True;
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    ALTO:=Image1.Height;
    ANCHO:=Image1.Width;

    //matriz para copiar contenido de la imagen
    SetLength(MAT,ANCHO,ALTO,3);
    StatusBar1.Panels[6].Text:=IntToStr(ALTO)+'x'+IntToStr(ANCHO);

    copiaIM(ALTO,ANCHO,MAT);     //procedimiento que copia a matriz



    //copiar valores RGB a MAT


  end; //opendialog



end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Cl: Tcolor;
  R,G,B : Byte;
begin

  StatusBar1.Panels[1].Text:=Inttostr(X);
  StatusBar1.Panels[2].Text:=Inttostr(Y);

  //Acceso desde canvas a RGB

    //Leer completo valor de 24bits en color
    //CL:=Image1.Canvas.Pixels[X,Y];



    //LEER R,G,B
   { R:=GetRValue(CL);
    G:=GetGValue(CL);
    B:=GetBValue(CL);
    }

    //Leer valores RGB que fueron copiados a MAT
    StatusBar1.Panels[4].Text:= IntToStr(MAT[x,y,0])+','+IntToStr(MAT[x,y,1])+','+IntToStr(MAT[x,y,2]) ;





end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i,j: Integer;
  cl: Tcolor;

begin
  //Asignar algun color a los pixels de la imagen

  for i:=0 to ANCHO-1 do begin
   for j:=0 to 10 do begin
      MAT[i,j,0]:=120;
      MAT[i,j,1]:=50;
      MAT[i,j,2]:=180;

      //Asignar al CAnvas
      cl:=RGB(MAT[i,j,0],MAT[i,j,1],MAT[i,j,2]);
      Image1.Canvas.Pixels[i,j]:=cl;

   end;
  end;




  Image1.Canvas.Pixels[10,10]:=cl;

end;

end.

