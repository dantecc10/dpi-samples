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
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Image1: TImage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    PopupMenu1: TPopupMenu;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ScrollBox1: TScrollBox;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
    procedure RadioButton2Change(Sender: TObject);
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

procedure TForm1.Button1Click(Sender: TObject);
begin

 if CheckBox1.Checked = true then
 begin
   ShowMessage('La caja 1 ha sido seleccionada');

 end;

end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin

end;

procedure TForm1.CheckBox2Change(Sender: TObject);
begin
  ShowMessage('Se ha cambiado el status de checkbox2');
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
     MenuItem3.Enabled:=True;
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

procedure TForm1.MenuItem4Click(Sender: TObject);
var
  i,j: Integer;
  k  : byte;
begin

 //aplicar filtro negativo

  for i:=0 to ancho-1 do begin

    for j:=0 to alto-1 do begin

      for k:=0 to 2 do begin

         MAT[i,j,k]:=255-MAT[i,j,k]; //operacion negativo
      end;
    end;
  end;

  //copiar resultado a bitmpa
  copiaMtoI(ALTO,ANCHO,MAT,BMAP);

  Image1.Picture.Assign(BMAP);


end;

procedure TForm1.MenuItem5Click(Sender: TObject);
var
  i,j  : Integer;
  prom : Integer;
  k: Byte;

begin

  //convertir a grises

  for i:=0 to ANCHO-1 do begin
    for j:=0 to ALTO-1 do begin

      prom:= (MAT[i,j,0]+MAT[i,j,1]+MAT[i,j,2]) div 3;
      for k:=0 to 2 do begin
        MAT[i,j,k]:=prom;
      end;

    end; //j
  end;   //i

 copiaMtoI(ALTO,ANCHO,MAT,BMAP);
 Image1.Picture.Assign(BMAP);


end;

procedure TForm1.RadioButton1Change(Sender: TObject);
begin
  RadioButton1.Top:=RadioButton1.Top-10;
end;

procedure TForm1.RadioButton2Change(Sender: TObject);
begin
     RadioButton2.Top:=RadioButton2.Top+10;
end;

end.

