#!/usr/bin/env nextflow

/*
 * Use echo to print 'Hello World!' to a file
 */
process task {
    input:
            val cmd

    container 'nextflow/bash'

    output:
        path 'output'

    script:
    """
    $cmd
    """

}

workflow {

    // emit a greeting
    task(params.cmd)

    publish:
    outputs = task.out
}

output {
    outputs {
        path '.'
    }
}

