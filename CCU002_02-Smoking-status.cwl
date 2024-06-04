cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  extrivial-ccu002_02-smoking-status---primary:
    run: extrivial-ccu002_02-smoking-status---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  ccu002_02-smoking-status-exheavy---primary:
    run: ccu002_02-smoking-status-exheavy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: extrivial-ccu002_02-smoking-status---primary/output
  ccu002_02-smoking-status-exsmoker---primary:
    run: ccu002_02-smoking-status-exsmoker---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: ccu002_02-smoking-status-exheavy---primary/output
  ccu002_02-smoking-status-excigarette---primary:
    run: ccu002_02-smoking-status-excigarette---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: ccu002_02-smoking-status-exsmoker---primary/output
  ccu002_02-smoking-status-exmoderate---primary:
    run: ccu002_02-smoking-status-exmoderate---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: ccu002_02-smoking-status-excigarette---primary/output
  ccu002_02-smoking-status-stopped---primary:
    run: ccu002_02-smoking-status-stopped---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: ccu002_02-smoking-status-exmoderate---primary/output
  ccu002_02-smoking-status-consumption---primary:
    run: ccu002_02-smoking-status-consumption---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: ccu002_02-smoking-status-stopped---primary/output
  ccu002_02-smoking-status-ceased---primary:
    run: ccu002_02-smoking-status-ceased---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: ccu002_02-smoking-status-consumption---primary/output
  ccu002_02-smoking-status-chain---primary:
    run: ccu002_02-smoking-status-chain---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: ccu002_02-smoking-status-ceased---primary/output
  unknown-ccu002_02-smoking-status---primary:
    run: unknown-ccu002_02-smoking-status---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: ccu002_02-smoking-status-chain---primary/output
  light-ccu002_02-smoking-status---primary:
    run: light-ccu002_02-smoking-status---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: unknown-ccu002_02-smoking-status---primary/output
  ccu002_02-smoking-status-stopping---primary:
    run: ccu002_02-smoking-status-stopping---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: light-ccu002_02-smoking-status---primary/output
  ccu002_02-smoking-status-tobacco---primary:
    run: ccu002_02-smoking-status-tobacco---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: ccu002_02-smoking-status-stopping---primary/output
  ccu002_02-smoking-status---primary:
    run: ccu002_02-smoking-status---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: ccu002_02-smoking-status-tobacco---primary/output
  occasional-ccu002_02-smoking-status---primary:
    run: occasional-ccu002_02-smoking-status---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: ccu002_02-smoking-status---primary/output
  ccu002_02-smoking-status-trying---primary:
    run: ccu002_02-smoking-status-trying---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: occasional-ccu002_02-smoking-status---primary/output
  ccu002_02-smoking-status-smoker---primary:
    run: ccu002_02-smoking-status-smoker---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: ccu002_02-smoking-status-trying---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: ccu002_02-smoking-status-smoker---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
