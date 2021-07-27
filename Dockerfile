FROM ubuntu:20.04

LABEL maintainer="Jaeyoung Chun (chunj@mskcc.org)"

ENV VERSION 0.0.1

RUN apt-get update \
    && apt-get install --yes build-essential python3 python3-pip wget

RUN pip3 install biopython

RUN cd /tmp \
    && wget https://github.com/hisplan/asap_to_kite/archive/refs/tags/v${VERSION}.tar.gz \
    && tar xvzf v${VERSION}.tar.gz \
    && rm -rf v${VERSION}.tar.gz \
    && cd asap_to_kite-${VERSION} \
    && mv asap_to_kite_A_B.py asap_to_kite_v2.py /opt/

ENTRYPOINT [ "python3", "/opt/asap_to_kite_v2.py" ]
CMD [ "--help" ]
