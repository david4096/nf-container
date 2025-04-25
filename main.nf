#!/usr/bin/env nextflow

/*
 * Use echo to print 'Hello World!' to a file
 */
process task {
    publishDir 'output', mode: 'copy'

    input:
            val greeting

    container 'nextflow/bash'

    output:
        path 'output.txt'

    script:
    """
    cmd
    """
}

workflow {

    // emit a greeting
    task(params.cmd)
}

