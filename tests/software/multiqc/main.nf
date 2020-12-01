#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { MULTIQC } from '../../../software/multiqc/main.nf' addParams(options: [publish_dir: 'test_multiqc'])


workflow test_multiqc {

    def input = []

    input = [[id: 'test'], // meta map
             [file("${launchDir}/tests/data/fastqc/test_1.fastq.html", checkIfExists: true),
              file("${launchDir}/tests/data/fastqc/test_1.fastq.zip", checkIfExists: true),
              file("${launchDir}/tests/data/fastqc/test_2.fastq.html", checkIfExists: true),
              file("${launchDir}/tests/data/fastqc/test_2.fastq.zip", checkIfExists: true)]]

    MULTIQC(input)
}
