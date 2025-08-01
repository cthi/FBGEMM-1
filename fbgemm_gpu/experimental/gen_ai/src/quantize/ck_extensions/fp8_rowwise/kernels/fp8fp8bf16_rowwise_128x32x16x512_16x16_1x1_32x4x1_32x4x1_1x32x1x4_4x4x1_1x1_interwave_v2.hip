/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree.
 */

#include "fp8_rowwise_common.h"

at::Tensor
fp8fp8bf16_rowwise_128x32x16x512_16x16_1x1_32x4x1_32x4x1_1x32x1x4_4x4x1_1x1_interwave_v2(
    at::Tensor XQ,
    at::Tensor WQ,
    at::Tensor x_scale,
    at::Tensor w_scale,
    at::Tensor Y) {
  return f8f8bf16_rowwise_wrapper<
      128,
      32,
      16,
      512,
      16,
      16,
      1,
      1,
      S<32, 4, 1>,
      S<32, 4, 1>,
      S<1, 32, 1, 4>,
      S<4, 4, 1>,
      1,
      1,
      ck::BlockGemmPipelineScheduler::Interwave,
      ck::BlockGemmPipelineVersion::v2>(XQ, WQ, x_scale, w_scale, Y, 1);
}
