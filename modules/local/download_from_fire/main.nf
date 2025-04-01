process DOWNLOAD_FROM_FIRE {
    tag "$accession"
    label 'process_single'
    container 'community.wave.seqera.io/library/pip_boto3_botocore_requests_retry:52fc026d39c78019'

    input:
    tuple val(accession)

    output:
    tuple val("$accession"), path("*.fa.gz"), emit: metagenome

    script:
    """
    download_from_fire.py ${accession}
    """
}