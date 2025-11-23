unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls;


type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var     //Variables globales
  Form1: TForm1;
  ARR    : Array [0..4] of integer;       //arreglo de 5 elementos tipo entero
  M      : Array [0..4,0..4] of integer;   //matriz de 5 x5 enteros
  MATD   : Array of Array of integer;    //MAtriz sin dimensiones, posteriromente se asignan en el instante que se requiera

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i: integer;
  cad: String;
begin

  for i:=0 to 4 do
  begin
    //llenar asignar valores al arreglo
    ARR[i]:=random(100);
    cad:=IntToStr(ARR[i]);
    StringGrid1.Cells[i,0]:=cad;

  end;



end;

procedure TForm1.Button2Click(Sender: TObject);
var
 i,j  : Integer;
 cad : String;
begin
   for i:=0 to 4 do begin
     for j:=0 to 4 do begin
      //asignar valores a la matriz
       M[i,j]:=random(400);
       cad:=IntToStr(M[i,j]);
       StringGrid2.Cells[i,j]:=cad;

     end;
   end;


end;

procedure TForm1.Button3Click(Sender: TObject);
var
filas, cols   : integer;
i,j           : byte;

begin
  filas:=Strtoint(Edit1.Text);  //leer desde cajas de texto el valor de filas y columnas
  cols:=strtoint(Edit2.Text);
  setlength(MATD,filas,cols);  //asignar dimensiones a la matriz

  //modificar tamaño y numero de filas columnas en el Stringrd
  StringGrid3.ColCount:=cols;
  StringGrid3.RowCount:=filas;
  StringGrid3.Width:=cols*StringGrid3.DefaultColWidth+5;
  StringGrid3.Height:=filas*StringGrid3.DefaultRowHeight+5;

  //llenar valores aleatorios de la matriz
  for i:=0 to filas-1 do begin
    for j:=0 to cols-1 do begin
      MATD[i,j]:=random(300);

      //convertir y colocar valor en stringgrid
      StringGrid3.Cells[j,i]:=inttostr(MATD[i,j]);
    end;
  end;

end;

end.

