object dmMainMod: TdmMainMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 318
  Width = 402
  object TbCliente: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 48
    Top = 104
  end
  object FDConnection1: TFDConnection
    Left = 48
    Top = 32
  end
end
