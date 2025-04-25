#!/usr/bin/env nextflow

nextflow.enable.dsl=2

// Provide default command if none is passed
params.cmd = params.cmd ?: 'mkdir -p output && echo Hello > output/output.txt'

process task {
    input:
        val cmd

    output:
        path '*'  // Declare everything in the output directory as output

    container 'nextflow/bash'

    script:
    """
    $cmd
    """
}

workflow {
    task(params.cmd)
}
