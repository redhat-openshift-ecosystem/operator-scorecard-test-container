# operator-scorecard-test-container
This repo contains *Dockerfile* for Operator scorecard test container. Its main purpose is to version this container that is used in the Prow jobs for scorecard tests.

The image itself is stored at : https://quay.io/repository/cvpops/operator-scorecard?tab=tags

Scorecard-basic-config.yml is required in orded to build this image, thats why its embeded in repo.

Container runs the operator-sdk scorecard test (as part of the [aws-workflow](https://github.com/openshift/release/blob/master/ci-operator/step-registry/optional-operators/cvp-common/aws/optional-operators-cvp-common-aws-workflow.yaml)) using the extracted operator and the basic config and save its output in the artifacts directory in form of Json.