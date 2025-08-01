/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree.
 */

#include "fp8_rowwise_common.h"

at::Tensor
fp8fp8bf16_rowwise_256x192x224x128_16x16_6x7_8x32x1_8x32x1_1x64x1x4_8x8x1_2x1_intrawave_v3(
    at::Tensor XQ,
    at::Tensor WQ,
    at::Tensor x_scale,
    at::Tensor w_scale,
    at::Tensor Y) {
  return f8f8bf16_rowwise_wrapper<
      256,
      192,
      224,
      128,
      16,
      16,
      6,
      7,
      S<8, 32, 1>,
      S<8, 32, 1>,
      S<1, 64, 1, 4>,
      S<8, 8, 1>,
      2,
      1,
      ck::BlockGemmPipelineScheduler::Intrawave,
      ck::BlockGemmPipelineVersion::v3>(XQ, WQ, x_scale, w_scale, Y, 1);
}
