unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    Button1: TButton;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Check(num1, num2, divNum : integer; date : TDateTime);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  const
    equals = 1;
    bgEqual = 2;
    smEqual = 3;
    bg = 4;
    sm = 5;


var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Check(num1, num2, divNum: Integer; date: TDateTime);
var
  comp : integer;

begin

  comp := Combobox1.ItemIndex;

  case comp of
    0 : begin

      if num1 = num2 then
        Label3.Caption := IntToStr(num1) + ' and ' + IntToStr(num2) + ' are equal'
      else
        Label3.Caption := IntToStr(num1) + ' and ' + IntToStr(num2) + ' are not equal';
      end;

    1 : begin

      if num1 >= num2 then
        Label3.Caption := IntToStr(num1) + ' is bigger or equal than ' + IntToStr(num2)
      else
        Label3.Caption := IntToStr(num1) + ' is not bigger or equal than ' + IntToStr(num2);
      end;

    2 : begin

      if num1 <= num2 then
        Label3.Caption := IntToStr(num1) + ' is smaller or equal than ' + IntToStr(num2)
      else
        Label3.Caption := IntToStr(num1) + ' is not smaller or equal than ' + IntToStr(num2);
      end;

    3 : begin

      if num1 > num2 then
        Label3.Caption := IntToStr(num1) + ' is bigger than ' + IntToStr(num2)
      else
        Label3.Caption := IntToStr(num1) + ' is not bigger than ' + IntToStr(num2);
      end;

    4: begin

      if num1 < num2 then
        Label3.Caption := IntToStr(num1) + ' is smaller than ' + IntToStr(num2)
      else
        Label3.Caption := IntToStr(num1) + ' is not samller than ' + IntToStr(num2);
      end;

    end;

    Label3.Caption := Label3.Caption + ', Divide by: ' + IntToStr(divNum) + ' Date: ' + DateToStr(date);

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  num1, num2, divNum : integer;
  date : TDateTime;
begin

  try

    //string to integer convertion exception
    try

      num1 := StrToInt(Edit1.Text);
      num2 := StrToInt(Edit2.Text);
    except
      on E : EConvertError do
      begin
        ShowMessage('Wrong type of number');
        num1 := 0;
        num2 := 0;
      end;
    end;

    //divide by zero exception
    try

      divNum := StrToInt(Edit3.text);
      num1 := num1 div divNum;

    except
        on E : EDivByZero do
      begin
        ShowMessage('Divede by zero');
        divNum := 1;
      end;
    end;

    //DateTime convertion exception
    try

      date := StrToDate(Edit4.Text);

    except

      on E : EConvertError do
      begin
        ShowMessage('Wrong Date');
        date := Now;
      end;

    end;
  finally

    Check(num1, num2, divNum, date);
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Combobox1.Text := 'Comparator';
  ComboBox1.Items.Add('=');
  ComboBox1.Items.Add('>=');
  ComboBox1.Items.Add('<=');
  ComboBox1.Items.Add('>');
  ComboBox1.Items.Add('<');

end;

end.
