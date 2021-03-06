' ----------------------------------------------------------------------
' Script Created by RMxprt to generate Maxwell 2D Version 2016.0 design 
' Can specify one arg to setup external circuit                         
' ----------------------------------------------------------------------

On Error Resume Next
Set oAnsoftApp = CreateObject("Ansoft.ElectronicsDesktop")
On Error Goto 0
Set oDesktop = oAnsoftApp.GetAppDesktop()
Set oArgs = AnsoftScript.arguments
oDesktop.RestoreWindow
Set oProject = oDesktop.GetActiveProject()
Set oDesign = oProject.GetActiveDesign()
designName = oDesign.GetName
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.SetModelUnits Array("NAME:Units Parameter", "Units:=", "mm", _
  "Rescale:=", false)
oDesign.SetSolutionType "Transient", "XY"
Set oModule = oDesign.GetModule("BoundarySetup")
if (oArgs.Count = 1) then 
oModule.EditExternalCircuit oArgs(0), Array(), Array(), Array(), Array()
end if
oEditor.SetModelValidationSettings Array("NAME:Validation Options", _
  "EntityCheckLevel:=", "Strict", "IgnoreUnclassifiedObjects:=", true)
Set oModule = oDesign.GetModule("MeshSetup")
oModule.InitialMeshSettings Array("NAME:MeshSettings", "MeshMethod:=", _
  "AnsoftTAU")
On Error Resume Next
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:fractions", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "1"))))
On Error Goto 0
Set oDefinitionManager = oProject.GetDefinitionManager()
oDefinitionManager.ModifyLibraries designName, Array("NAME:PersonalLib"), _
  Array("NAME:UserLib"), Array("NAME:SystemLib", "Materials:=", Array(_
  "Materials", "RMxprt"))
if (oDefinitionManager.DoesMaterialExist("JFE_Steel_35JNE300_2DSF0.960")) then
else
oDefinitionManager.AddMaterial Array("NAME:JFE_Steel_35JNE300_2DSF0.960", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), Array("NAME:permeability", "property_type:=", _
  "nonlinear", "HUnit:=", "A_per_meter", "BUnit:=", "tesla", Array(_
  "NAME:BHCoordinates", Array("NAME:Coordinate", "X:=", 0, "Y:=", 0), Array(_
  "NAME:Coordinate", "X:=", 10, "Y:=", 0.0192005), Array("NAME:Coordinate", _
  "X:=", 17.2, "Y:=", 0.0479049), Array("NAME:Coordinate", "X:=", 23.4, "Y:=", _
  0.0958092), Array("NAME:Coordinate", "X:=", 27.9, "Y:=", 0.143713), Array(_
  "NAME:Coordinate", "X:=", 31.7, "Y:=", 0.191522), Array("NAME:Coordinate", _
  "X:=", 34.8, "Y:=", 0.239426), Array("NAME:Coordinate", "X:=", 37.5, "Y:=", _
  0.28733), Array("NAME:Coordinate", "X:=", 40.1, "Y:=", 0.335234), Array(_
  "NAME:Coordinate", "X:=", 42.6, "Y:=", 0.383138), Array("NAME:Coordinate", _
  "X:=", 45, "Y:=", 0.430946), Array("NAME:Coordinate", "X:=", 47.4, "Y:=", _
  0.47885), Array("NAME:Coordinate", "X:=", 49.8, "Y:=", 0.526851), Array(_
  "NAME:Coordinate", "X:=", 52.2, "Y:=", 0.574659), Array("NAME:Coordinate", _
  "X:=", 54.7, "Y:=", 0.622563), Array("NAME:Coordinate", "X:=", 57.5, "Y:=", _
  0.670371), Array("NAME:Coordinate", "X:=", 60.6, "Y:=", 0.718275), Array(_
  "NAME:Coordinate", "X:=", 64.3, "Y:=", 0.766179), Array("NAME:Coordinate", _
  "X:=", 68.3, "Y:=", 0.814083), Array("NAME:Coordinate", "X:=", 72.9, "Y:=", _
  0.861988), Array("NAME:Coordinate", "X:=", 78.2, "Y:=", 0.909796), Array(_
  "NAME:Coordinate", "X:=", 84.4, "Y:=", 0.9577), Array("NAME:Coordinate", _
  "X:=", 91.9, "Y:=", 1.0056), Array("NAME:Coordinate", "X:=", 101, "Y:=", _
  1.05351), Array("NAME:Coordinate", "X:=", 112, "Y:=", 1.10141), Array(_
  "NAME:Coordinate", "X:=", 126, "Y:=", 1.14932), Array("NAME:Coordinate", _
  "X:=", 145, "Y:=", 1.19722), Array("NAME:Coordinate", "X:=", 173, "Y:=", _
  1.24513), Array("NAME:Coordinate", "X:=", 214, "Y:=", 1.29303), Array(_
  "NAME:Coordinate", "X:=", 282, "Y:=", 1.34104), Array("NAME:Coordinate", _
  "X:=", 408, "Y:=", 1.38904), Array("NAME:Coordinate", "X:=", 681, "Y:=", _
  1.43725), Array("NAME:Coordinate", "X:=", 1260, "Y:=", 1.48586), Array(_
  "NAME:Coordinate", "X:=", 1990, "Y:=", 1.53466), Array("NAME:Coordinate", _
  "X:=", 2810, "Y:=", 1.58357), Array("NAME:Coordinate", "X:=", 3860, "Y:=", _
  1.63277), Array("NAME:Coordinate", "X:=", 5000, "Y:=", 1.6719), Array(_
  "NAME:Coordinate", "X:=", 5310, "Y:=", 1.6818), Array("NAME:Coordinate", _
  "X:=", 7340, "Y:=", 1.73499), Array("NAME:Coordinate", "X:=", 10000, "Y:=", _
  1.78226), Array("NAME:Coordinate", "X:=", 10400, "Y:=", 1.7891), Array(_
  "NAME:Coordinate", "X:=", 15000, "Y:=", 1.8428), Array("NAME:Coordinate", _
  "X:=", 22900, "Y:=", 1.9008), Array("NAME:Coordinate", "X:=", 41400, "Y:=", _
  1.972), Array("NAME:Coordinate", "X:=", 80000, "Y:=", 2.0493), Array(_
  "NAME:Coordinate", "X:=", 466000, "Y:=", 2.8223))), Array(_
  "NAME:core_loss_type", "property_type:=", "ChoiceProperty", "Choice:=", _
  "Electrical Steel"), "core_loss_kh:=", 276.225, "core_loss_kc:=", 0.175097, _
  "core_loss_ke:=", 6.50045, "conductivity:=", 2.43902e+006, "mass_density:=", _
  7392) 
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
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "0.75deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "0"))), Array(_
  "NAME:Attributes", "Name:=", "Band", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "631mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "250mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "0.75deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "Shaft", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "631mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "0.75deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "OuterRegion", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
On Error Goto 0
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "Fractions", "fractions"
oEditor.Copy Array("NAME:Selections", "Selections:=", "OuterRegion")
oEditor.Paste
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion1:CreateUserDefinedPart:1", "InfoCore", "1"
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion1"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "Tool"))))
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.SetSymmetryMultiplier "fractions"
Set oModule = oDesign.GetModule("BoundarySetup")
edgeID = oEditor.GetEdgeByPosition(Array("NAME:Parameters", "BodyName:=", _
  "OuterRegion", "XPosition:=", "-404.19999999999999mm", "YPosition:=", _
  "4.9500223621536018e-014mm", "ZPosition:=", "0mm"))
oModule.AssignVectorPotential Array("NAME:VectorPotential1", "Edges:=", Array(edgeID), _
  "Value:=", "0", "CoordinateSystem:=", "")
oDesign.SetDesignSettings Array("NAME:Design Settings Data", "ModelDepth:=", _
  "219.2mm")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs01", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1.938636329548782mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "15mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "21.71563324035466mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "28.00780567061753mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "HalfSlot", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "15deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "InfoCore", "Value:=", "0"))), Array("NAME:Attributes", "Name:=", "Stator", _
  "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", _
  "JFE_Steel_35JNE300_2DSF0.960", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Stator:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "632mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "808.4mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "48"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "3mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", _
  "1.938636329548782mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", _
  "48mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15mm"), Array(_
  "NAME:Pair", "Name:=", "Bs1", "Value:=", "21.71563324035466mm"), Array(_
  "NAME:Pair", "Name:=", "Bs2", "Value:=", "28.00780567061753mm"), Array(_
  "NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "2"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", "2"))), _
  Array("NAME:Attributes", "Name:=", "Coil", "Flags:=", "", "Color:=", _
  "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "copper", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "Coil"), _
  Array("NAME:DuplicateAroundAxisParameters", "CoordinateSystemID:=", -1, _
  "CreateNewObjects:=", true, "WhichAxis:=", "Z", "AngleStr:=", "7.5deg", _
  "NumClones:=", "48"), Array("NAME:Options", "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Coil"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "Coil_0"))))
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseA", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "0.011747ohm", _
  "Inductance:=", "8.85682e-005H", "Voltage:=", "326.599 * sin(2*pi*50*time)", _
  "ParallelBranchesNum:=", "1")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseB", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "0.011747ohm", _
  "Inductance:=", "8.85682e-005H", "Voltage:=", _
  "326.599 * sin(2*pi*50*time-2*pi/3)", "ParallelBranchesNum:=", "1")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseC", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "0.011747ohm", _
  "Inductance:=", "8.85682e-005H", "Voltage:=", _
  "326.599 * sin(2*pi*50*time-4*pi/3)", "ParallelBranchesNum:=", "1")
oModule.AssignCoil Array("NAME:PhARe_0", "Objects:=", Array("Coil_43"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhA_0", "Objects:=", Array("Coil_0"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhA_1", "Objects:=", Array("Coil_1"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhARe_1", "Objects:=", Array("Coil_6"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhBRe_2", "Objects:=", Array("Coil_47"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhB_2", "Objects:=", Array("Coil_4"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhB_3", "Objects:=", Array("Coil_5"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhBRe_3", "Objects:=", Array("Coil_10"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhCRe_4", "Objects:=", Array("Coil_3"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhC_4", "Objects:=", Array("Coil_8"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhC_5", "Objects:=", Array("Coil_9"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhCRe_5", "Objects:=", Array("Coil_14"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhARe_6", "Objects:=", Array("Coil_7"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhA_6", "Objects:=", Array("Coil_12"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhA_7", "Objects:=", Array("Coil_13"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhARe_7", "Objects:=", Array("Coil_18"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhBRe_8", "Objects:=", Array("Coil_11"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhB_8", "Objects:=", Array("Coil_16"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhB_9", "Objects:=", Array("Coil_17"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhBRe_9", "Objects:=", Array("Coil_22"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhCRe_10", "Objects:=", Array("Coil_15"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhC_10", "Objects:=", Array("Coil_20"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhC_11", "Objects:=", Array("Coil_21"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhCRe_11", "Objects:=", Array("Coil_26"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhARe_12", "Objects:=", Array("Coil_19"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhA_12", "Objects:=", Array("Coil_24"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhA_13", "Objects:=", Array("Coil_25"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhARe_13", "Objects:=", Array("Coil_30"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhBRe_14", "Objects:=", Array("Coil_23"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhB_14", "Objects:=", Array("Coil_28"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhB_15", "Objects:=", Array("Coil_29"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhBRe_15", "Objects:=", Array("Coil_34"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhCRe_16", "Objects:=", Array("Coil_27"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhC_16", "Objects:=", Array("Coil_32"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhC_17", "Objects:=", Array("Coil_33"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhCRe_17", "Objects:=", Array("Coil_38"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhARe_18", "Objects:=", Array("Coil_31"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhA_18", "Objects:=", Array("Coil_36"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhA_19", "Objects:=", Array("Coil_37"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhARe_19", "Objects:=", Array("Coil_42"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhBRe_20", "Objects:=", Array("Coil_35"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhB_20", "Objects:=", Array("Coil_40"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhB_21", "Objects:=", Array("Coil_41"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhBRe_21", "Objects:=", Array("Coil_46"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhCRe_22", "Objects:=", Array("Coil_39"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhC_22", "Objects:=", Array("Coil_44"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhC_23", "Objects:=", Array("Coil_45"), _
  "Conductor number:=", 5, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhCRe_23", "Objects:=", Array("Coil_2"), _
  "Conductor number:=", 5, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Coil", "RefineInside:=", true, _
  "Objects:=", Array("Coil_0", "Coil_1", "Coil_2", "Coil_3", "Coil_4", _
  "Coil_5", "Coil_6", "Coil_7", "Coil_8", "Coil_9", "Coil_10", "Coil_11", _
  "Coil_12", "Coil_13", "Coil_14", "Coil_15", "Coil_16", "Coil_17", "Coil_18", _
  "Coil_19", "Coil_20", "Coil_21", "Coil_22", "Coil_23", "Coil_24", "Coil_25", _
  "Coil_26", "Coil_27", "Coil_28", "Coil_29", "Coil_30", "Coil_31", "Coil_32", _
  "Coil_33", "Coil_34", "Coil_35", "Coil_36", "Coil_37", "Coil_38", "Coil_39", _
  "Coil_40", "Coil_41", "Coil_42", "Coil_43", "Coil_44", "Coil_45", "Coil_46", _
  "Coil_47"), "RestrictElem:=", false, "NumMaxElem:=", "1000", _
  "RestrictLength:=", true, "MaxLength:=", "12.4309mm")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "630mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "250mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "61"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1.5mm"), Array("NAME:Pair", "Name:=", "Hs01", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1.5mm"), Array("NAME:Pair", _
  "Name:=", "Hs2", "Value:=", "60mm"), Array("NAME:Pair", "Name:=", "Bs0", _
  "Value:=", "1.1mm"), Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "12mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "8mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "1.55mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "HalfSlot", _
  "Value:=", "0"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "15deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", "0"))), Array(_
  "NAME:Attributes", "Name:=", "Rotor", "Flags:=", "", "Color:=", _
  "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "JFE_Steel_35JNE300_2DSF0.960", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Rotor:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SquirrelCage", "Version:=", "12.11", _
  "NoOfParameters:=", 24, "Library:=", "syslib", Array("NAME:ParamVector", _
  Array("NAME:Pair", "Name:=", "DiaGap", "Value:=", "630mm"), Array(_
  "NAME:Pair", "Name:=", "DiaYoke", "Value:=", "250mm"), Array("NAME:Pair", _
  "Name:=", "Length", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", _
  "Value:=", "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "61"), _
  Array("NAME:Pair", "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "1.5mm"), Array("NAME:Pair", "Name:=", "Hs01", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1.5mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "60mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "1.1mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "12mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "8mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1.55mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "HalfSlot", "Value:=", "0"), Array("NAME:Pair", "Name:=", "BarEndExt", _
  "Value:=", "20mm"), Array("NAME:Pair", "Name:=", "RingLength", "Value:=", _
  "25mm"), Array("NAME:Pair", "Name:=", "RingHeight", "Value:=", "25mm"), _
  Array("NAME:Pair", "Name:=", "RingDiaGap", "Value:=", "0mm"), Array(_
  "NAME:Pair", "Name:=", "CastRotor", "Value:=", "0"), Array("NAME:Pair", _
  "Name:=", "SegAngle", "Value:=", "15deg"), Array("NAME:Pair", "Name:=", _
  "LenRegion", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "0"))), Array("NAME:Attributes", "Name:=", "Bar", "Flags:=", "", _
  "Color:=", "(119 198 206)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "aluminum_25C", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Bar:CreateUserDefinedPart:1", _
  "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Bar", _
  "Tool Parts:=", "Tool"), Array("NAME:SubtractParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", true)
oEditor.SeparateBody  Array("NAME:Selections", "Selections:=", "Bar")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignEndConnection Array("NAME:EndConnection1", "Objects:=", Array(_
  "Bar", "Bar_Separate1", "Bar_Separate2", "Bar_Separate3", "Bar_Separate4", _
  "Bar_Separate5", "Bar_Separate6", "Bar_Separate7", "Bar_Separate8", _
  "Bar_Separate9", "Bar_Separate10", "Bar_Separate11", "Bar_Separate12", _
  "Bar_Separate13", "Bar_Separate14", "Bar_Separate15", "Bar_Separate16", _
  "Bar_Separate17", "Bar_Separate18", "Bar_Separate19", "Bar_Separate20", _
  "Bar_Separate21", "Bar_Separate22", "Bar_Separate23", "Bar_Separate24", _
  "Bar_Separate25", "Bar_Separate26", "Bar_Separate27", "Bar_Separate28", _
  "Bar_Separate29", "Bar_Separate30", "Bar_Separate31", "Bar_Separate32", _
  "Bar_Separate33", "Bar_Separate34", "Bar_Separate35", "Bar_Separate36", _
  "Bar_Separate37", "Bar_Separate38", "Bar_Separate39", "Bar_Separate40", _
  "Bar_Separate41", "Bar_Separate42", "Bar_Separate43", "Bar_Separate44", _
  "Bar_Separate45", "Bar_Separate46", "Bar_Separate47", "Bar_Separate48", _
  "Bar_Separate49", "Bar_Separate50", "Bar_Separate51", "Bar_Separate52", _
  "Bar_Separate53", "Bar_Separate54", "Bar_Separate55", "Bar_Separate56", _
  "Bar_Separate57", "Bar_Separate58", "Bar_Separate59", "Bar_Separate60"), _
  "ResistanceValue:=", "8.37475e-007ohm", "InductanceValue:=", _
  "2.55599e-008H")
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Bar", "RefineInside:=", true, _
  "Objects:=", Array("Bar", "Bar_Separate1", "Bar_Separate2", "Bar_Separate3", _
  "Bar_Separate4", "Bar_Separate5", "Bar_Separate6", "Bar_Separate7", _
  "Bar_Separate8", "Bar_Separate9", "Bar_Separate10", "Bar_Separate11", _
  "Bar_Separate12", "Bar_Separate13", "Bar_Separate14", "Bar_Separate15", _
  "Bar_Separate16", "Bar_Separate17", "Bar_Separate18", "Bar_Separate19", _
  "Bar_Separate20", "Bar_Separate21", "Bar_Separate22", "Bar_Separate23", _
  "Bar_Separate24", "Bar_Separate25", "Bar_Separate26", "Bar_Separate27", _
  "Bar_Separate28", "Bar_Separate29", "Bar_Separate30", "Bar_Separate31", _
  "Bar_Separate32", "Bar_Separate33", "Bar_Separate34", "Bar_Separate35", _
  "Bar_Separate36", "Bar_Separate37", "Bar_Separate38", "Bar_Separate39", _
  "Bar_Separate40", "Bar_Separate41", "Bar_Separate42", "Bar_Separate43", _
  "Bar_Separate44", "Bar_Separate45", "Bar_Separate46", "Bar_Separate47", _
  "Bar_Separate48", "Bar_Separate49", "Bar_Separate50", "Bar_Separate51", _
  "Bar_Separate52", "Bar_Separate53", "Bar_Separate54", "Bar_Separate55", _
  "Bar_Separate56", "Bar_Separate57", "Bar_Separate58", "Bar_Separate59", _
  "Bar_Separate60"), "RestrictElem:=", false, "NumMaxElem:=", "1000", _
  "RestrictLength:=", true, "MaxLength:=", "4mm")
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignTrueSurfOp Array("NAME:SurfApprox_Bar", "Objects:=", Array("Bar", _
  "Bar_Separate1", "Bar_Separate2", "Bar_Separate3", "Bar_Separate4", _
  "Bar_Separate5", "Bar_Separate6", "Bar_Separate7", "Bar_Separate8", _
  "Bar_Separate9", "Bar_Separate10", "Bar_Separate11", "Bar_Separate12", _
  "Bar_Separate13", "Bar_Separate14", "Bar_Separate15", "Bar_Separate16", _
  "Bar_Separate17", "Bar_Separate18", "Bar_Separate19", "Bar_Separate20", _
  "Bar_Separate21", "Bar_Separate22", "Bar_Separate23", "Bar_Separate24", _
  "Bar_Separate25", "Bar_Separate26", "Bar_Separate27", "Bar_Separate28", _
  "Bar_Separate29", "Bar_Separate30", "Bar_Separate31", "Bar_Separate32", _
  "Bar_Separate33", "Bar_Separate34", "Bar_Separate35", "Bar_Separate36", _
  "Bar_Separate37", "Bar_Separate38", "Bar_Separate39", "Bar_Separate40", _
  "Bar_Separate41", "Bar_Separate42", "Bar_Separate43", "Bar_Separate44", _
  "Bar_Separate45", "Bar_Separate46", "Bar_Separate47", "Bar_Separate48", _
  "Bar_Separate49", "Bar_Separate50", "Bar_Separate51", "Bar_Separate52", _
  "Bar_Separate53", "Bar_Separate54", "Bar_Separate55", "Bar_Separate56", _
  "Bar_Separate57", "Bar_Separate58", "Bar_Separate59", "Bar_Separate60"), _
  "SurfDevChoice:=", 2, "SurfDev:=", "0.315mm", "NormalDevChoice:=", 2, _
  "NormalDev:=", "15deg", "AspectRatioChoice:=", 1)
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "630mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "250mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "61"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1.5mm"), Array("NAME:Pair", "Name:=", "Hs01", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1.5mm"), Array("NAME:Pair", _
  "Name:=", "Hs2", "Value:=", "60mm"), Array("NAME:Pair", "Name:=", "Bs0", _
  "Value:=", "1.1mm"), Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "12mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "8mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "1.55mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "HalfSlot", _
  "Value:=", "0"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "15deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "InnerRegion", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "InnerRegion:CreateUserDefinedPart:1", "LenRegion", "219.2mm + 2*endRegion"
On Error Goto 0
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignTrueSurfOp Array("NAME:SurfApprox_Main", "Objects:=", Array(_
  "Stator", "Rotor", "Band", "OuterRegion", "InnerRegion", "Shaft"), _
  "SurfDevChoice:=", 2, "SurfDev:=", "0.4042mm", "NormalDevChoice:=", 2, _
  "NormalDev:=", "15deg", "AspectRatioChoice:=", 1)
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Main", "RefineInside:=", true, _
  "Objects:=", Array("Stator", "Rotor", "Band", "OuterRegion", "InnerRegion", _
  "Shaft"), "RestrictElem:=", false, "NumMaxElem:=", "1000", _
  "RestrictLength:=", true, "MaxLength:=", "17.84mm")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Band", _
  "OuterRegion", "InnerRegion"), Array("NAME:ChangedProps", Array(_
  "NAME:Transparent", "Value:=", 0.75))))
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Band,InnerRegion" & _
  ",Shaft,Stator,Coil_0,Coil_1,Coil_2,Coil_3,Coil_4,Coil_5,Coil_6,Coil_7" & _
  ",Coil_8,Coil_9,Coil_10,Coil_11,Coil_12,Coil_13,Coil_14,Coil_15,Coil_16" & _
  ",Coil_17,Coil_18,Coil_19,Coil_20,Coil_21,Coil_22,Coil_23,Coil_24" & _
  ",Coil_25,Coil_26,Coil_27,Coil_28,Coil_29,Coil_30,Coil_31,Coil_32" & _
  ",Coil_33,Coil_34,Coil_35,Coil_36,Coil_37,Coil_38,Coil_39,Coil_40" & _
  ",Coil_41,Coil_42,Coil_43,Coil_44,Coil_45,Coil_46,Coil_47,Rotor", _
  "Tool Parts:=", "Tool"), Array("NAME:SubtractParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", false)
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.AssignBand Array("NAME:MotionSetup1", "Move Type:=", "Rotate", _
  "Coordinate System:=", "Global", "Axis:=", "Z", "Is Positive:=", true, _
  "InitPos:=", "0deg", "HasRotateLimit:=", false, "NonCylindrical:=", false, _
  "Consider Mechanical Transient:=", true, "Angular Velocity:=", "742rpm", _
  "Moment of Inertia:=", 26.4422, "Damping:=", 1.11715, "Load Torque:=", _
  "if(speed<75.0055, -43.5167*speed, -244817/speed)", "Objects:=", Array(_
  "Band"))
oModule.EditMotionSetup "MotionSetup1", Array("NAME:Data", _
  "Consider Mechanical Transient:=", false)
Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertSetup "Transient", Array("NAME:Setup1", "FastReachSteadyState:=", _
  true, "FrequencyOfAddedVoltageSource:=", "50Hz", "StopTime:=", "0.04s", _
  "TimeStep:=", "0.0002s")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetMinimumTimeStep "0.002ms" 
Set oModule = oDesign.GetModule("ReportSetup")
oModule.CreateReport "Torque", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array("Moving1.Torque")), Array()
oModule.CreateReport "Currents", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array("Current(PhaseA)", "Current(PhaseB)", _
  "Current(PhaseC)")), Array()
oModule.CreateReport "Induced Voltages", "Transient", "XY Plot", _
  "Setup1 : Transient", Array(), Array("Time:=", Array("All")), Array(_
  "X Component:=", "Time", "Y Component:=", Array("InducedVoltage(PhaseA)", _
  "InducedVoltage(PhaseB)", "InducedVoltage(PhaseC)")), Array()
oModule.CreateReport "Flux Linkages", "Transient", "XY Plot", _
  "Setup1 : Transient", Array(), Array("Time:=", Array("All")), Array(_
  "X Component:=", "Time", "Y Component:=", Array("FluxLinkage(PhaseA)", _
  "FluxLinkage(PhaseB)", "FluxLinkage(PhaseC)")), Array()
oModule.CreateReport "Voltages", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array("InputVoltage(PhaseA)", "InputVoltage(PhaseB)", _
  "InputVoltage(PhaseC)")), Array()
oModule.CreateReport "Powers", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array(_
  "InputVoltage(PhaseA)*Current(PhaseA) + InputVoltage(PhaseB)*Current(PhaseB) + InputVoltage(PhaseC)*Current(PhaseC)", _
  "Moving1.Speed*Moving1.Torque")), Array()
oModule.ChangeProperty Array("NAME:AllTabs", Array("NAME:Trace", Array(_
  "NAME:PropServers", _
  "Powers:InputVoltage(PhaseA)*Current(PhaseA) + InputVoltage(PhaseB)*Current(PhaseB) + InputVoltage(PhaseC)*Current(PhaseC)"), _
  Array("NAME:ChangedProps", Array("NAME:Specify Name", "Value:=", true))))
oModule.ChangeProperty Array("NAME:AllTabs", Array("NAME:Trace", Array(_
  "NAME:PropServers", _
  "Powers:InputVoltage(PhaseA)*Current(PhaseA) + InputVoltage(PhaseB)*Current(PhaseB) + InputVoltage(PhaseC)*Current(PhaseC)"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "ElecPower"))))
oModule.ChangeProperty Array("NAME:AllTabs", Array("NAME:Trace", Array(_
  "NAME:PropServers", "Powers:Moving1.Speed*Moving1.Torque"), Array(_
  "NAME:ChangedProps", Array("NAME:Specify Name", "Value:=", true))))
oModule.ChangeProperty Array("NAME:AllTabs", Array("NAME:Trace", Array(_
  "NAME:PropServers", "Powers:Moving1.Speed*Moving1.Torque"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "MechPower"))))
oModule.AddTraceCharacteristics "Torque", "avg", Array(), Array("Specified", _
  "0.02s", "0.04s")
oModule.AddTraceCharacteristics "Currents", "rms", Array(), Array("Specified", _
  "0.02s", "0.04s")
oModule.AddTraceCharacteristics "Currents", "avg", Array(), Array("Specified", _
  "0.02s", "0.04s")
oModule.AddTraceCharacteristics "Voltages", "rms", Array(), Array("Specified", _
  "0.02s", "0.04s")
oModule.AddTraceCharacteristics "Induced Voltages", "rms", Array(), Array(_
  "Specified", "0.02s", "0.04s")
oModule.AddTraceCharacteristics "Powers", "avg", Array(), Array("Specified", _
  "0.02s", "0.04s")
oEditor.ShowWindow
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetupYConnection Array(Array("NAME:YConnection", "Windings:=", _
  "PhaseA,PhaseB,PhaseC"))
