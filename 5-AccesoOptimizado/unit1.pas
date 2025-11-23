unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ComCtrls,
  ExtCtrls, ExtDlgs, StdCtrls;

type

  //definir tipos propios
   MATRGB= Array of Array of Array of byte;

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    ScrollBox1: TScrollBox;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure MenuItem2Click(Sender: TObject);
  private

  public

    procedure copiaItoM(Al,An: Integer; B: Tbitmap;  var M:MATRGB);   //copiar de bitmap a matriz con scanline
    procedure copiaMtoI(Al,An: Integer; M:MATRGB; var B:Tbitmap  );   //copiar de matriz a la imagen con scanline

  end;

var
  Form1: TForm1;

  ALTO, ANCHO : Integer;
  MAT: MATRGB ;  //del tipo propio para alamacenar R,G,B

  BMAP: Tbitmap;   //para acceso a imagenes bmp

implementation

{$R *.lfm}

{ TForm1 }

//copiar de la matriz a la imagen mediante scanline
procedure tform1.copiaMtoI(Al,An:Integer; M:MATRGB; var B:Tbitmap);
var
  i,j,k : Integer;
  P     :Pbyte;
begin
  for i:=0 to al-1 do
  begin
    B.BeginUpdate;
    P:=B.ScanLine[i];  //Invocar método para tener listo en memoria la localidad a modificar--> toda la fila
    B.EndUpdate;

    for j:=0 to an-1 do
    begin             //asignando valores de matriz al apuntador scanline--> Bitmap
       k:=3*j;
       P[k+2]:=M[j,i,0];
       P[k+1]:=M[j,i,1];
       P[k]:=M[j,i,2];
    end; //j
  end; //i
end;



//procedimiento para copiar de imagen a matriz con Scanline del bitmap
procedure Tform1.copiaItoM(Al,An: Integer; B: Tbitmap; var M:MATRGB);
var
  i,j,k     :Integer;
  P       :Pbyte;      //apuntador de tipo byte

  begin
  for i:=0 to al-1 do
  begin
    B.BeginUpdate;
    P:=B.ScanLine[i];  //leer RGB de todo el renglon-iesimo
    B.EndUpdate;

    for j:=0 to an-1 do
    begin
       //asignar valores RGB a la matriz
       k:=3*j;
       M[j,i,0]:=P[k+2];  //R
       M[j,i,1]:=P[k+1];  //G
       M[j,i,2]:=P[k];    //B
    end; //j
   end; //i


end;


procedure TForm1.FormCreate(Sender: TObject);
begin
   BMAP:=Tbitmap.Create;  //Instanciar-crear objeto de la clase Tbitmap
end;


procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  
  StatusBar1.Panels[1].Text:=Inttostr(X);
  StatusBar1.Panels[2].Text:=Inttostr(Y);
  StatusBar1.Panels[4].Text:= IntToStr(MAT[x,y,0])+','+IntToStr(MAT[x,y,1])+','+IntToStr(MAT[x,y,2]) ;

end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
    if OpenPictureDialog1.Execute then
    begin
     Image1.Enabled:=True;
     BMAP.LoadFromFile(OpenPictureDialog1.FileName);
     ALTO:=BMAP.Height;
     ANCHO:=BMAP.Width;

     if BMAP.PixelFormat<> pf24bit then   //garantizar 8 bits por canal
     begin
      BMAP.PixelFormat:=pf24bit;
     end;
     StatusBar1.Panels[6].Text:=IntToStr(ALTO)+'x'+IntToStr(ANCHO);
     SetLength(MAT,ANCHO,ALTO,3);
     copiaItoM(ALTO,ANCHO,BMAP,MAT);  //copiar contenido de bitmap a MAT
     Image1.Picture.Assign(BMAP);  //visulaizar imagen

  end;
end;

end.

