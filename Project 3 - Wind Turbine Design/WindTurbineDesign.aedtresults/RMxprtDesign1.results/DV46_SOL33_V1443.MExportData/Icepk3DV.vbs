' ----------------------------------------------------------------------
' Script Created by RMxprt to generate Maxwell 3D Version 2016.0 design 
' Can specify one arg to setup external circuit                         
' ----------------------------------------------------------------------

On Error Resume Next
Set oAnsoftApp = CreateObject("Ansoft.ElectronicsDesktop")
On Error Goto 0
Set oDesktop = oAnsoftApp.GetAppDesktop()
Set oArgs = AnsoftScript.arguments
oDesktop.RestoreWindow
Set oProject = oDesktop.GetActiveProject()
if (oArgs.Count > 0) then 
  Set oDesign = oProject.GetDesign(oArgs(0))
else
  Set oDesign = oProject.GetActiveDesign()
end if
designName = oDesign.GetName
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.SetModelUnits Array("NAME:Units Parameter", "Units:=", "mm", _
  "Rescale:=", false)
oDesign.SetSolutionType "Transient"
Set oModule = oDesign.GetModule("BoundarySetup")
oEditor.SetModelValidationSettings Array("NAME:Validation Options", _
  "EntityCheckLevel:=", "Strict", "IgnoreUnclassifiedObjects:=", true)
oDesign.SetDesignSettings Array("NAME:Design Settings Data", _
  "InsulatorThreshold:=", 2.5e+006)
On Error Resume Next
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:fractions", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "1"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:halfAxial", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "0"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:endRegion", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "157.95771050631063mm"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:rotorSkew", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "0"))))
On Error Goto 0
Set oDefinitionManager = oProject.GetDefinitionManager()
oDefinitionManager.ModifyLibraries designName, Array("NAME:PersonalLib"), _
  Array("NAME:UserLib"), Array("NAME:SystemLib", "Materials:=", Array(_
  "Materials", "RMxprt"))
if (oDefinitionManager.DoesMaterialExist("JFE_Steel_35JNE300_3DSF0.960")) then
else
oDefinitionManager.AddMaterial Array("NAME:JFE_Steel_35JNE300_3DSF0.960", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), Array("NAME:permeability", "property_type:=", _
  "nonlinear", "HUnit:=", "A_per_meter", "BUnit:=", "tesla", Array(_
  "NAME:BHCoordinates", Array("NAME:Coordinate", "X:=", 0, "Y:=", 0), Array(_
  "NAME:Coordinate", "X:=", 10, "Y:=", 0.02), Array("NAME:Coordinate", "X:=", _
  17.2, "Y:=", 0.0499), Array("NAME:Coordinate", "X:=", 23.4, "Y:=", 0.0998), _
  Array("NAME:Coordinate", "X:=", 27.9, "Y:=", 0.1497), Array(_
  "NAME:Coordinate", "X:=", 31.7, "Y:=", 0.1995), Array("NAME:Coordinate", _
  "X:=", 34.8, "Y:=", 0.2494), Array("NAME:Coordinate", "X:=", 37.5, "Y:=", _
  0.2993), Array("NAME:Coordinate", "X:=", 40.1, "Y:=", 0.3492), Array(_
  "NAME:Coordinate", "X:=", 42.6, "Y:=", 0.3991), Array("NAME:Coordinate", _
  "X:=", 45, "Y:=", 0.4489), Array("NAME:Coordinate", "X:=", 47.4, "Y:=", _
  0.4988), Array("NAME:Coordinate", "X:=", 49.8, "Y:=", 0.5488), Array(_
  "NAME:Coordinate", "X:=", 52.2, "Y:=", 0.5986), Array("NAME:Coordinate", _
  "X:=", 54.7, "Y:=", 0.6485), Array("NAME:Coordinate", "X:=", 57.5, "Y:=", _
  0.6983), Array("NAME:Coordinate", "X:=", 60.6, "Y:=", 0.7482), Array(_
  "NAME:Coordinate", "X:=", 64.3, "Y:=", 0.7981), Array("NAME:Coordinate", _
  "X:=", 68.3, "Y:=", 0.848), Array("NAME:Coordinate", "X:=", 72.9, "Y:=", _
  0.8979), Array("NAME:Coordinate", "X:=", 78.2, "Y:=", 0.9477), Array(_
  "NAME:Coordinate", "X:=", 84.4, "Y:=", 0.9976), Array("NAME:Coordinate", _
  "X:=", 91.9, "Y:=", 1.0475), Array("NAME:Coordinate", "X:=", 101, "Y:=", _
  1.0974), Array("NAME:Coordinate", "X:=", 112, "Y:=", 1.1473), Array(_
  "NAME:Coordinate", "X:=", 126, "Y:=", 1.1972), Array("NAME:Coordinate", _
  "X:=", 145, "Y:=", 1.2471), Array("NAME:Coordinate", "X:=", 173, "Y:=", _
  1.297), Array("NAME:Coordinate", "X:=", 214, "Y:=", 1.3469), Array(_
  "NAME:Coordinate", "X:=", 282, "Y:=", 1.3969), Array("NAME:Coordinate", _
  "X:=", 408, "Y:=", 1.4469), Array("NAME:Coordinate", "X:=", 681, "Y:=", _
  1.4971), Array("NAME:Coordinate", "X:=", 1260, "Y:=", 1.5477), Array(_
  "NAME:Coordinate", "X:=", 1990, "Y:=", 1.5985), Array("NAME:Coordinate", _
  "X:=", 2810, "Y:=", 1.6494), Array("NAME:Coordinate", "X:=", 3860, "Y:=", _
  1.7006), Array("NAME:Coordinate", "X:=", 5000, "Y:=", 1.7413), Array(_
  "NAME:Coordinate", "X:=", 5310, "Y:=", 1.7516), Array("NAME:Coordinate", _
  "X:=", 7340, "Y:=", 1.8069), Array("NAME:Coordinate", "X:=", 10000, "Y:=", _
  1.856), Array("NAME:Coordinate", "X:=", 10400, "Y:=", 1.8631), Array(_
  "NAME:Coordinate", "X:=", 15000, "Y:=", 1.9188), Array("NAME:Coordinate", _
  "X:=", 22900, "Y:=", 1.9788), Array("NAME:Coordinate", "X:=", 41400, "Y:=", _
  2.052), Array("NAME:Coordinate", "X:=", 80000, "Y:=", 2.1305), Array(_
  "NAME:Coordinate", "X:=", 466000, "Y:=", 2.9155))), Array(_
  "NAME:core_loss_type", "property_type:=", "ChoiceProperty", "Choice:=", _
  "Electrical Steel"), "core_loss_kh:=", 265.176, "core_loss_kc:=", 0.168094, _
  "core_loss_ke:=", 6.36912, "conductivity:=", 2.43902e+006, "mass_density:=", _
  7700, Array("NAME:stacking_type", "property_type:=", "ChoiceProperty", _
  "Choice:=", "Lamination"), "stacking_factor:=", "0.96", Array(_
  "NAME:stacking_direction", "property_type:=", "ChoiceProperty", "Choice:=", _
  "V(3)"))
end if
if (oDefinitionManager.DoesMaterialExist("aluminum_25C")) then
else
oDefinitionManager.AddMaterial Array("NAME:aluminum_25C", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), "conductivity:=", "4.53077e+007")
end if
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "631mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "250mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "535.1154210126213mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "1.5deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", _
  "1"), Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "Shaft", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Shaft:CreateUserDefinedPart:1", _
  "Length", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "631mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "535.1154210126213mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "1.5deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", _
  "1"), Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "OuterRegion", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "Length", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "Fractions", "fractions"
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "HalfAxial", "halfAxial"
On Error Goto 0
oEditor.Copy Array("NAME:Selections", "Selections:=", "OuterRegion")
oEditor.Paste
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion1:CreateUserDefinedPart:1", "InfoCore", "1"
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion1"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "Tool"))))
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.SetSymmetryMultiplier "fractions*(1+halfAxial)"
Set oModule = oDesign.GetModule("BoundarySetup")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs01", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", _
  "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", _
  "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), Array(_
  "NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), Array(_
  "NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), Array(_
  "NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "HalfSlot", _
  "Value:=", "0"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "30deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "535.1154210126213mm"), Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", _
  "0"))), Array("NAME:Attributes", "Name:=", "Stator", "Flags:=", "", _
  "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "JFE_Steel_35JNE300_3DSF0.960", "SolveInside:=", _
  true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Stator:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_0", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_0:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_0"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "322.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_1", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_1:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_1"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "7.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_2", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_2:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_2"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "352.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_3", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_3:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_3"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "37.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_4", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_4:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_4"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "22.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_5", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_5:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_5"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "67.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_6", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_6:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_6"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "52.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_7", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_7:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_7"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "97.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_8", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_8:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_8"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "82.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_9", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_9:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_9"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "127.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_10", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_10:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_10"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "112.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_11", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_11:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_11"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "157.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_12", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_12:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_12"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "142.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_13", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_13:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_13"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "187.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_14", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_14:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_14"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "172.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_15", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_15:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_15"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "217.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_16", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_16:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_16"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "202.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_17", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_17:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_17"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "247.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_18", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_18:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_18"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "232.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_19", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_19:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_19"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "277.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_20", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_20:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_20"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "262.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_21", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_21:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_21"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "307.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_22", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_22:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_22"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "292.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", _
  "Value:=", "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), _
  Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "5"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_23", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_23:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_23"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "337.5deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "630mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "250mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "61"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "1.5mm"), Array("NAME:Pair", "Name:=", "Hs01", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1.5mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "60mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "1.1mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "12mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "8mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1.55mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "HalfSlot", "Value:=", "0"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "30deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "535.1154210126213mm"), Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", _
  "0"))), Array("NAME:Attributes", "Name:=", "Rotor", "Flags:=", "", _
  "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "JFE_Steel_35JNE300_3DSF0.960", "SolveInside:=", _
  true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Rotor:CreateUserDefinedPart:1", _
  "Skew", "rotorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", "Rotor:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SquirrelCage", "Version:=", "12.11", _
  "NoOfParameters:=", 24, "Library:=", "syslib", Array("NAME:ParamVector", _
  Array("NAME:Pair", "Name:=", "DiaGap", "Value:=", "630mm"), Array(_
  "NAME:Pair", "Name:=", "DiaYoke", "Value:=", "250mm"), Array("NAME:Pair", _
  "Name:=", "Length", "Value:=", "219.2mm"), Array("NAME:Pair", "Name:=", _
  "Skew", "Value:=", "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", _
  "61"), Array("NAME:Pair", "Name:=", "SlotType", "Value:=", "4"), Array(_
  "NAME:Pair", "Name:=", "Hs0", "Value:=", "1.5mm"), Array("NAME:Pair", _
  "Name:=", "Hs01", "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "1.5mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "60mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "1.1mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "12mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "8mm"), Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1.55mm"), _
  Array("NAME:Pair", "Name:=", "FilletType", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "HalfSlot", "Value:=", "0"), Array("NAME:Pair", _
  "Name:=", "BarEndExt", "Value:=", "20mm"), Array("NAME:Pair", "Name:=", _
  "RingLength", "Value:=", "25mm"), Array("NAME:Pair", "Name:=", "RingHeight", _
  "Value:=", "25mm"), Array("NAME:Pair", "Name:=", "RingDiaGap", "Value:=", _
  "0mm"), Array("NAME:Pair", "Name:=", "CastRotor", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "30deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "535.1154210126213mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "0"))), Array("NAME:Attributes", "Name:=", _
  "Bar", "Flags:=", "", "Color:=", "(119 198 206)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "aluminum_25C", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Bar:CreateUserDefinedPart:1", _
  "Skew", "rotorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", "Bar:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Bar", _
  "Tool Parts:=", "Tool"), Array("NAME:SubtractParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", true)
oEditor.SeparateBody  Array("NAME:Selections", "Selections:=", "Bar")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetEddyEffect Array("NAME:Eddy Effect Setting", Array(_
  "NAME:EddyEffectVector", Array("NAME:Data", "Object Name:=", "Bar", _
  "Eddy Effect:=", true)))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion"), _
  Array("NAME:ChangedProps", Array("NAME:Transparent", "Value:=", 0.75))))
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Shaft,Stator,Coil_0" & _
  ",Coil_1,Coil_2,Coil_3,Coil_4,Coil_5,Coil_6,Coil_7,Coil_8,Coil_9,Coil_10" & _
  ",Coil_11,Coil_12,Coil_13,Coil_14,Coil_15,Coil_16,Coil_17,Coil_18" & _
  ",Coil_19,Coil_20,Coil_21,Coil_22,Coil_23,Rotor,Bar", "Tool Parts:=", _
  "Tool"), Array("NAME:SubtractParameters", "CoordinateSystemID:=", -1, _
  "KeepOriginals:=", false)
oEditor.FitAll
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:ChangedProps", _
  Array("NAME:rotorSkew", "Value:=", "5.90164deg"))))
Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertSetup "Transient", Array("NAME:Setup1", "FastReachSteadyState:=", _
  true, "FrequencyOfAddedVoltageSource:=", "50Hz", "StopTime:=", "0.04s", _
  "TimeStep:=", "0.0002s")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetMinimumTimeStep "0.002ms" 
set oUnclassified = oEditor.GetObjectsInGroup("Unclassified")
Dim oObject
For Each oObject in oUnclassified
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", oObject), Array(_
  "NAME:ChangedProps", Array("NAME:Model", "Value:=", false))))
Next
