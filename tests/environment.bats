#!/usr/bin/env bats

setup() {
  load "$BATS_PLUGIN_PATH/load.bash"

  # Uncomment to enable stub debugging
  # export GIT_STUB_DEBUG=/dev/tty
}

@test "creates a root workspace directory" {
  export BUILDKITE_BUILD_PATH="$HOME"
  export BUILDKITE_PLUGIN_RUNREAL_VERSION="1.0.0"

  run "$PWD/hooks/environment"

  assert_success
  assert [ -d "$BUILDKITE_BUILD_PATH/$BUILDKITE_PLUGIN_RUNREAL_VERSION" ]
}