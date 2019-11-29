unit uDataForm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TdmMainMod = class(TDataModule)
    TbCliente: TFDMemTable;
    FDConnection1: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CreateClientTable;
  public
    { Public declarations }
  end;

var
  dmMainMod: TdmMainMod;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmMainMod }

procedure TdmMainMod.CreateClientTable;
begin
  TbCliente.Active := False;
  TbCliente.FieldDefs.Clear;
  TbCliente.Indexes.Clear;
  TbCliente.IndexDefs.Clear;
  TbCliente.IndexFieldNames := '';
  TbCliente.IndexName := '';
  TbCliente.Aggregates.Clear;
  TbCliente.Filter := '';
  TbCliente.FilterOptions := [];
  TbCliente.Filtered := False;


  with TbCliente do
    begin
      FieldDefs.Add('ID', ftAutoInc);
      FieldDefs.Add('Nome', ftString, 100);
      FieldDefs.Add('Identidade', ftString, 20);
      FieldDefs.Add('Cpf', ftString, 15);
      FieldDefs.Add('Telefone', ftString, 16);
      FieldDefs.Add('Email', ftString, 50);
      FieldDefs.Add('Endereco', ftString, 100);
      FieldDefs.Add('Cep', ftString, 8);
      FieldDefs.Add('Logradouro', ftString, 100);
      FieldDefs.Add('Numero', ftString, 10);
      FieldDefs.Add('Complemento', ftString, 100);
      FieldDefs.Add('Bairro', ftString, 50);
      FieldDefs.Add('Cidade', ftString, 50);
      FieldDefs.Add('Estado', ftString, 50);
      FieldDefs.Add('Pais', ftString, 20);
      FieldDefs.Add('DataCadastro', ftDateTime, 0);
   end;


  TbCliente.Open;

end;

procedure TdmMainMod.DataModuleCreate(Sender: TObject);
begin
  // Inicializando tabela (banco de dados)
  CreateClientTable;
end;

end.
