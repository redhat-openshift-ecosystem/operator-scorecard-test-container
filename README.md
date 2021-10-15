# operator-scorecard-test-container
This repo contains *Dockerfile* for Operator scorecard test container. Its main purpose is to version this container that is used in the Prow jobs for scorecard tests.

The image itself is stored at : https://quay.io/repository/cvpops/operator-scorecard?tab=tags

Scorecard-basic-config.yml is required in orded to build this image, thats why its embeded in repo.

Container runs the operator-sdk scorecard test in the [optional-operators-cvp-common-scorecard step](https://steps.ci.openshift.org/reference/optional-operators-cvp-common-scorecard) as part of the [cvp-common-aws](https://github.com/openshift/release/blob/master/ci-operator/step-registry/optional-operators/cvp-common/aws/optional-operators-cvp-common-aws-workflow.yaml) and [cvp-common-claim](https://github.com/openshift/release/blob/master/ci-operator/step-registry/optional-operators/cvp-common/aws/optional-operators-cvp-common-aws-workflow.yaml) workflows using the extracted operator and the basic config and saves its output in the artifacts directory in form of Json.

To update the operator-scorecard image so it can be used in the above Prow workflows, build it with docker/podman and push a new version tag to `quay.io/repository/cvpops/operator-scorecard`. Afterwards, make PR updating the [cvp-operator-scorecard.yaml](https://github.com/openshift/release/blob/master/clusters/app.ci/supplemental-ci-images/cvp-operator-scorecard.yaml) config as well as the OpenShift CI [mapping_supplemental_ci_images_ci](https://github.com/openshift/release/blob/master/core-services/image-mirroring/supplemental-ci-images/mapping_supplemental_ci_images_ci) image mirroring configuration to point to the new version tag.
