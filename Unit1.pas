unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}




procedure TForm1.Button3Click(Sender: TObject);
const M4 : integer = $48F42400;
var M0,M1,  M2,M3 : dword;
    M00 : int64 absolute M0;
    M22 : int64 absolute M2;
    M55 : double;
begin
  asm
    push $0A
    call sleep
    rdtsc //    db $0F,$31  //  rdtsc
    mov M1,eax
    mov M0,edx
    push $000001F4
    call sleep
    rdtsc //    db $0F,$31  //  rdtsc
    sub eax, dword ptr M1
    sbb edx, dword ptr M0
    mov M1,eax
    mov M0,edx

  //  mov eax,M1
    mov dword ptr M2,eax
    xor eax,eax
    mov dword ptr M3,eax
    fild qword ptr M22
  //  fild qword ptr M00

    fdiv dword ptr M4
    fstp qword ptr M55
    wait
    fld qword ptr M55

  end;
  memo1.Lines.Add(floattostrF(M55,ffFixed,10,4)+' Mhz');
end;

end.
