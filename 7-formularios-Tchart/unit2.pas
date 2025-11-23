unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, TAGraph,
  TASeries;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Chart1LineSeries2: TLineSeries;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

uses unit1;

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  //se tiene alcance a la variable publica "A" del form1
  Edit1.Text:=Inttostr(form1.A);
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  i: Integer;

//graficar ln()
begin

  Chart1LineSeries1.LinePen.Color:=clblue;
  Chart1LineSeries1.Clear;  // Limpiar valor de la función

  for i:=1 to 10 do begin
     Chart1LineSeries1.AddXY(i,ln(i));

  end;



end;

end.

