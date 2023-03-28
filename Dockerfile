FROM registry.fedoraproject.org/fedora:37

ARG operator_sdk_version=v1.28.0

RUN  yum install -y \
	--setopt=install_weak_deps=False \
        jq \
        go \
        tree \
	    gcc \
	    ansible \
    && yum clean all 

# Download and extract the openshift installer and client
RUN curl -fL -o /tmp/openshift-client.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable/openshift-client-linux.tar.gz \
    && tar xzf /tmp/openshift-client.tar.gz -C /usr/local/bin && rm -f /tmp/openshift-client.tar.gz \
    && chmod a+x /usr/local/bin/oc \

# Download the operator-sdk for the operator bundle testing
    && curl -fL -o /usr/local/bin/operator-sdk https://github.com/operator-framework/operator-sdk/releases/download/"${operator_sdk_version}"/operator-sdk_linux_amd64 \
    && chmod a+x /usr/local/bin/operator-sdk \
    
# Download the yq tool
    && curl -fL -o /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/2.2.1/yq_linux_amd64 \
    && chmod a+x /usr/local/bin/yq

COPY scorecard-basic-config.yml /tmp/config/
