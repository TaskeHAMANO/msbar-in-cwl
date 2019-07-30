# msbar-in-cwl

Wrapper tool of [msbar](http://www.bioinformatics.nl/cgi-bin/emboss/help/msbar) by [CWL](https://github.com/common-workflow-language/common-workflow-language) and [Docker](https://www.docker.com)

## Dependency

* cwl-runner such as [cwltool](https://github.com/common-workflow-language/cwltool)
* Docker
    * If you cannot use docker, this tool runs with ```--no-container``` options.
    * However, you have to install dependent tools of the cwlfile, such as EMBOSS.

## How to use

With the [CWL reference implementation](https://github.com/common-workflow-language/cwltool/) (`cwltool`), [`toil-cwl-runner`](https://toil.readthedocs.io/en/latest/running/cwl.html), or [`arvados-cwl-runner`](https://dev.arvados.org/projects/arvados/wiki/Running_Common_Workflow_Language_%28CWL%29_workflows_on_Arvados) as your `cwl-runner`:

```
cwl-runner --outdir ${PATH_TO_OUTPUT_DIR} \
           msbar.cwl \
           --fasta_file ${PATH_TO_FASTA_FILE} \
           --count  1000
```

For other runners an input object is required:
> inputs.yml
```
fasta_file:
  class: File
  path: path/to/fasta/file
count: 1000

```

```
cwl-runner --outdir ${PATH_TO_OUTPUT_DIR} \
           msbar.cwl \
           inputs.yml
```

## References

* [EMBOSS](https://doi.org/10.1016/S0168-9525(00)02024-2)
