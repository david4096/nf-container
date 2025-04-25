#!/usr/bin/env nextflow

nextflow.enable.dsl=2

// Provide default command if none is passed
params.cmd = params.cmd ?: 'mkdir -p output && echo Hello > output/output.txt'

process task {
    publishDir 'output', mode: 'copy'  // This publishes the contents of 'output/'

    input:
        val cmd

    output:
        path 'output'  // Declare everything in the output directory as output

    container 'nextflow/bash'

    script:
    """
    $cmd
    """
}

workflow {
    task(params.cmd)
}
