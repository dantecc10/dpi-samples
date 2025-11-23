unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  form2.TrackBar1.Position:=0;
  form2.Label1.Caption:=IntToStr(form2.TrackBar1.Position);
  form2.ShowModal;

  if form2.ModalResult=MrOK then //Presionó boton Ok en formulario 2
  begin
      ShowMessage('El valor del parámetro es:  '+ IntToStr(form2.param));

  end;



end;

end.

