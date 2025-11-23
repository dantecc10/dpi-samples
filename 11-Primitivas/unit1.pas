unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, LCLIntf;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ColorDialog1: TColorDialog;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
  private

  public

  end;

var
  Form1: TForm1;
  band: Boolean;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Canvas.Clear;

  //trazar rectángulo


  //Image1.Canvas.Brush.Color:=Clyellow;
  //Image1.Canvas.Pen.Color:=clred;
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
  band:=false;

end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin


  If Button=mbLeft then
  begin

     Image1.Canvas.Pixels[X,Y]:=Clgreen;

  end;

  If Button=mbRight then
  begin

     if band=false then
     begin
        band:=true;
     end
     else
     band:=false;

  end;


end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if band then
  begin

     Image1.Canvas.Pixels[X,Y]:=Clred;

  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  cl: Tcolor;
  R,G,B : Byte;
begin
  if ColorDialog1.execute then
  begin
     cl:=ColorDialog1.Color;
     Image1.Canvas.Pen.Width:=3;
     Image1.Canvas.Pen.Color:=cl;

     Image1.Canvas.Line(5,7,70,80);

     R:=GetRValue(cl);
     G:=GetGValue(cl);
     B:=GetBValue(cl);

     Edit1.Text:=IntToStr(R);
     Edit2.Text:=IntToStr(G);
     Edit3.Text:=IntToStr(B);


  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Image1.Canvas.Ellipse(70,70,90,180);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin

  Image1.Canvas.TextOut(200,200,'Hola..');
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

end.

