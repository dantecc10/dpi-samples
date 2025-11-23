unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public              //alcance público desde otros formularios - unidades
     A: Integer;


  end;

var
  Form1: TForm1;

implementation

uses unit2;


{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin

  form2.Show;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  A:=24;
end;

end.

