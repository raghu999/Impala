// Licensed to the Apache Software Foundation (ASF) under one
// or more contributor license agreements.  See the NOTICE file
// distributed with this work for additional information
// regarding copyright ownership.  The ASF licenses this file
// to you under the Apache License, Version 2.0 (the
// "License"); you may not use this file except in compliance
// with the License.  You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

#ifndef IMPALA_UTIL_FLAT_BUFFER_H
#define IMPALA_UTIL_FLAT_BUFFER_H

#include "common/status.h"

#include "gen-cpp/CatalogObjects_generated.h"
#include "gen-cpp/ImpalaInternalService_constants.h"

namespace impala {

/// Converts a FlatBuffer representation for compression to the corresponding thrift
/// representation. Returns an error for invalid mappings.
Status FromFbCompression(org::apache::impala::fb::FbCompression fb_compression,
    THdfsCompression::type* thrift_compression);
} // namespace impala
#endif // IMPALA_UTIL_FLAT_BUFFER_H
