#!/user/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["msbar"]
hints:
    DockerRequirement:
        dockerPull: biocontainers/emboss:6.5.7
        dockerImageId: biocontainers/emboss:6.5.7
inputs:
    "fasta_file":
        type: File
        inputBinding:
            position: 1
            prefix: "-sequence"
    "count":
        type: int
        inputBinding:
            position: 2
            prefix: "-count"
    "point":
        type: int?
        doc: "[0] Types of point mutations to perform (Values: 0 (None); 1 (Any of the following); 2 (Insertions); 3 (Deletions); 4 (Changes); 5 (Duplications); 6 (Moves))"
        default: 0
        inputBinding:
            position: 3
            prefix: "-point"
    "block":
        type: int?
        doc: "[0] Types of block mutations to perform (Values: 0 (None); 1 (Any of the following); 2 (Insertions); 3 (Deletions); 4 (Changes); 5 (Duplications); 6 (Moves))"
        default: 0
        inputBinding:
            position: 4
            prefix: "-block"
    "codon":
        type: int?
        doc: "[0] Types of codon mutations to perform. These are only done if the sequence is nucleic. (Values: 0 (None); 1 (Any of the following); 2 (Insertions); 3 (Deletions); 4 (Changes); 5 (Duplications); 6 (Moves))"
        default: 0
        inputBinding:
            position: 5
            prefix: "-codon"
    "outseq":
        type: string?
        doc: "[<sequence>.<format>] Sequence set(s) filename and optional format (output USA)"
        default: msbar_output.fasta
        inputBinding:
            position: 6
            prefix: "-outseq"

outputs:
    "output_file":
        type: File
        outputBinding:
            glob: $(inputs.outseq)