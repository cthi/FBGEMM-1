/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree.
 */

#include "fp8_rowwise_common.h"

at::Tensor
fp8fp8f16_rowwise_256x256x256x128_16x16_8x8_8x32x1_8x32x1_1x32x1x8_8x8x1_1x2_intrawave_v3(
    at::Tensor XQ,
    at::Tensor WQ,
    at::Tensor x_scale,
    at::Tensor w_scale,
    at::Tensor Y) {
  return f8f8f16_rowwise_wrapper<
      256,
      256,
      256,
      128,
      16,
      16,
      8,
      8,
      S<8, 32, 1>,
      S<8, 32, 1>,
      S<1, 32, 1, 8>,
      S<8, 8, 1>,
      1,
      2,
      ck::BlockGemmPipelineScheduler::Intrawave,
      ck::BlockGemmPipelineVersion::v3>(XQ, WQ, x_scale, w_scale, Y, 1);
}
