# dokcer-asap2kite

A script to reformat FASTQ files from ASAP-seq for downstream processing.

Note that it was originally designed for kite (kallisto | bustools), but can be used for something else as well.

## How to Run

```
docker run -it --rm \
    -v $(pwd)/test:/data \
    -w /data \
    asap2kite:0.0.1 \
    --fastqs /tmp/asap_to_kite-0.0.1/test/data1/ \
    --sample test1 \
    --id asapseq-test \
    --cores 2
```

## Build Container Image

```bash
./build.sh
```

## Push to Docker Registry

Either you can use the `docker push` command or run `push.sh` (requires [SCING](https://github.com/hisplan/scing)):

```bash
./push.sh
```

## Structure

### TotalSeq-A

Illumina demultiplexed:

- `R1`: UMI / UBI (10 nts) at position 0
- `R2`: CB (16 nts)
- `R3`: HTO (15 nts)
- `I`: Illumina indexing

After reformatted:

- `R1`: CB (16nts) + UMI (10 nts)
- `R2`: HTO (15 nts) at position 0

Conversion code: https://github.com/hisplan/asap_to_kite/blob/master/asap_to_kite_v2.py#L122

### Notes

- `R2` from sequencing must have exactly 16 nts. It appears that >16 could cause issues during the reformatting.
